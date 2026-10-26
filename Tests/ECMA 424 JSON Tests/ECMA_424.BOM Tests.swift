import ECMA_424
import ECMA_427
import ISO_5962_License_Expression
import JSON
import RFC_3339
import RFC_4122
import RFC_8259
import Testing

extension ECMA_424.BOM {
    @Suite struct Test {
        @Suite struct Integration {}
        @Suite struct `Edge Case` {}
    }
}

extension ECMA_424.BOM.Test {
    static func bom(_ text: String) throws -> ECMA_424.BOM {
        try ECMA_424.BOM(json: RFC_8259.Value(try JSON.parse(text)))
    }
}

extension ECMA_424.BOM.Test.Integration {

    @Test(arguments: [
        ECMA_424.BOM.Test.Valid.bom,
        ECMA_424.BOM.Test.Valid.minimalViable,
        ECMA_424.BOM.Test.Valid.componentHashes,
        ECMA_424.BOM.Test.Valid.componentTypes,
        ECMA_424.BOM.Test.Valid.componentIdentifiers,
        ECMA_424.BOM.Test.Valid.dependency,
        ECMA_424.BOM.Test.Valid.emptyComponents,
        ECMA_424.BOM.Test.Valid.externalReference,
        ECMA_424.BOM.Test.Valid.licenseChoice,
        ECMA_424.BOM.Test.Valid.licenseExpression,
        ECMA_424.BOM.Test.Valid.licenseId,
        ECMA_424.BOM.Test.Valid.licenseName,
        ECMA_424.BOM.Test.Valid.metadataAuthor,
        ECMA_424.BOM.Test.Valid.metadataLifecycle,
        ECMA_424.BOM.Test.Valid.metadataManufacturer,
        ECMA_424.BOM.Test.Valid.metadataSupplier,
        ECMA_424.BOM.Test.Valid.metadataTimestamp,
        ECMA_424.BOM.Test.Valid.metadataTool,
        ECMA_424.BOM.Test.Valid.properties,
    ])
    func `every valid conformance document round-trips through its JSON value and JSON text`(text: String) throws {
        let bom = try ECMA_424.BOM.Test.bom(text)
        #expect(bom.specVersion == "1.7")
        #expect(try ECMA_424.BOM(json: bom.json) == bom)
        #expect(try ECMA_424.BOM.Test.bom(JSON(bom.json).serialize()) == bom)
    }

    @Test
    func `the serial number is a lowercase RFC 4122 UUID behind the urn prefix`() throws {
        let bom = try ECMA_424.BOM.Test.bom(ECMA_424.BOM.Test.Valid.minimalViable)
        let expected = try RFC_4122.UUID("3e671687-395b-41f5-a30f-a58921a69b79")
        #expect(bom.serialNumber == expected)
        #expect(bom.json["serialNumber"] == "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79")
        #expect(bom.version == .first)
    }

    @Test
    func `every component type of the conformance suite decodes`() throws {
        let bom = try ECMA_424.BOM.Test.bom(ECMA_424.BOM.Test.Valid.componentTypes)
        let expected: [ECMA_424.Component.Kind] = [
            .application, .library, .framework, .container, .operatingSystem, .firmware, .device, .file, .data,
        ]
        #expect(bom.components.map(\.kind) == expected)
    }

    @Test
    func `component hashes keep their algorithm and digest`() throws {
        let bom = try ECMA_424.BOM.Test.bom(ECMA_424.BOM.Test.Valid.componentHashes)
        let hashes = try #require(bom.components.first).hashes
        let expected: [ECMA_424.Hash.Algorithm] = [
            .md5, .sha1, .sha256, .sha384, .sha512, .sha3_256, .sha3_384, .sha3_512, .blake2b256, .blake2b384,
            .blake2b512, .blake3,
        ]
        #expect(hashes.map(\.algorithm) == expected)
        #expect(hashes.map(\.content.count) == [16, 20, 32, 48, 64, 32, 48, 64, 32, 48, 64, 32])
    }

    @Test
    func `component identifiers carry cpe, purl, OmniBOR and SWHID`() throws {
        let bom = try ECMA_424.BOM.Test.bom(ECMA_424.BOM.Test.Valid.componentIdentifiers)
        let component = try #require(bom.components.first)
        #expect(component.purl?.description == "pkg:maven/com.example/acme-library@1.0.0")
        #expect(component.cpe == "cpe:2.3:a:example:acme-library:1.0.0:*:*:*:*:*:*:*")
        #expect(component.omnibor.count == 2)
        #expect(
            component.swhid == [
                "swh:1:cnt:94a9ed024d3859793618152ea559a168bbcbb5e2", "swh:1:dir:d198bc9d7a6bcf6db04f476d29314f157507d505",
            ]
        )
    }

    @Test
    func `dependencies reference components by bom-ref`() throws {
        let bom = try ECMA_424.BOM.Test.bom(ECMA_424.BOM.Test.Valid.dependency)
        #expect(bom.dependencies.map(\.ref.value) == ["library-a", "library-b"])
        #expect(bom.dependencies.last?.dependsOn.map(\.value) == ["library-c"])
    }

    @Test
    func `a license choice mixes licenses and expressions`() throws {
        let bom = try ECMA_424.BOM.Test.bom(ECMA_424.BOM.Test.Valid.licenseChoice)
        let licenses = try #require(bom.components.first).licenses
        guard case .license(let apache) = licenses[0],
            case .expression(let expression) = licenses[1],
            case .license(let own) = licenses[2]
        else {
            Issue.record("expected a license, an expression and a named license")
            return
        }
        #expect(apache.identifier == .spdx("Apache-2.0"))
        #expect(expression.value == .disjunction(.simple(.license("EPL-2.0")), .exception(.license("GPL-2.0"), "Classpath-exception-2.0")))
        #expect(own.identifier == .name("My Own License"))
    }

    @Test
    func `an expression keeps its acknowledgement and bom-ref`() throws {
        let bom = try ECMA_424.BOM.Test.bom(ECMA_424.BOM.Test.Valid.licenseExpression)
        let choice = try #require(bom.components.first?.licenses.first)
        guard case .expression(let expression) = choice else {
            Issue.record("expected an expression")
            return
        }
        let reference = try ECMA_424.Reference("my-license")
        #expect(expression.acknowledgement == .declared)
        #expect(expression.reference == reference)
    }

    @Test
    func `lifecycles are predefined phases or custom names`() throws {
        let bom = try ECMA_424.BOM.Test.bom(ECMA_424.BOM.Test.Valid.metadataLifecycle)
        let expected: [ECMA_424.Metadata.Lifecycle] = [
            .phase(.build), .phase(.postBuild),
            .custom(name: "platform-integration-testing", description: "Integration testing specific to the runtime platform"),
        ]
        #expect(bom.metadata?.lifecycles == expected)
    }

    @Test
    func `tools are components in the current form`() throws {
        let bom = try ECMA_424.BOM.Test.bom(ECMA_424.BOM.Test.Valid.metadataTool)
        guard case .components(let tools) = bom.metadata?.tools else {
            Issue.record("expected tools as components")
            return
        }
        #expect(tools.map(\.name) == ["Awesome Tool"])
    }

    @Test
    func `the legacy tools array is still read`() throws {
        let bom = try ECMA_424.BOM.Test.bom(ECMA_424.BOM.Test.Valid.bom)
        guard case .legacy(let tools) = bom.metadata?.tools else {
            Issue.record("expected legacy tools")
            return
        }
        let expected: [ECMA_424.Hash.Algorithm] = [.sha1, .sha256]
        #expect(tools.first?.vendor == "Awesome Vendor")
        #expect(tools.first?.hashes.map(\.algorithm) == expected)
    }

    @Test
    func `the timestamp is an RFC 3339 date-time`() throws {
        let bom = try ECMA_424.BOM.Test.bom(ECMA_424.BOM.Test.Valid.metadataTimestamp)
        let expected = try RFC_3339.DateTime("2020-04-13T20:20:39+00:00")
        #expect(bom.metadata?.timestamp == expected)
    }

    @Test
    func `a purl is a package URL`() throws {
        let bom = try ECMA_424.BOM.Test.bom(ECMA_424.BOM.Test.Valid.componentIdentifiers)
        let expected = try ECMA_427.PURL("pkg:maven/com.example/acme-library@1.0.0")
        #expect(bom.components.first?.purl == expected)
    }
}

extension ECMA_424.BOM.Test.`Edge Case` {

    @Test
    func `another bom format is refused`() {
        #expect(throws: ECMA_424.Error.invalid("bomFormat")) { try ECMA_424.BOM.Test.bom(ECMA_424.BOM.Test.Invalid.bomformat) }
    }

    @Test
    func `an empty bom-ref is refused`() {
        #expect(throws: ECMA_424.Error.invalid("bom-ref")) { try ECMA_424.BOM.Test.bom(ECMA_424.BOM.Test.Invalid.componentRef) }
    }

    @Test
    func `an unknown component type is refused`() {
        #expect(throws: ECMA_424.Error.invalid("type")) { try ECMA_424.BOM.Test.bom(ECMA_424.BOM.Test.Invalid.componentType) }
    }

    @Test
    func `a dependency without a ref is refused`() {
        #expect(throws: ECMA_424.Error.missing("ref")) { try ECMA_424.BOM.Test.bom(ECMA_424.BOM.Test.Invalid.dependency) }
    }

    @Test
    func `a component without a name is refused`() {
        #expect(throws: ECMA_424.Error.missing("name")) { try ECMA_424.BOM.Test.bom(ECMA_424.BOM.Test.Invalid.emptyComponent) }
    }

    @Test
    func `a component without a type is refused`() {
        #expect(throws: ECMA_424.Error.missing("type")) {
            try ECMA_424.BOM.Test.bom(ECMA_424.BOM.Test.Invalid.missingComponentType)
        }
    }

    @Test
    func `an unknown hash algorithm is refused`() {
        #expect(throws: ECMA_424.Error.invalid("alg")) { try ECMA_424.BOM.Test.bom(ECMA_424.BOM.Test.Invalid.hashAlg) }
    }

    @Test(arguments: [
        ECMA_424.BOM.Test.Invalid.hashMd5,
        ECMA_424.BOM.Test.Invalid.hashSha1,
        ECMA_424.BOM.Test.Invalid.hashSha256,
        ECMA_424.BOM.Test.Invalid.hashSha512,
    ])
    func `hash content that is not a digest is refused`(text: String) {
        #expect(throws: ECMA_424.Error.invalid("content")) { try ECMA_424.BOM.Test.bom(text) }
    }

    @Test
    func `a license object beside an expression is refused`() {
        #expect(throws: ECMA_424.Error.unexpected("expression")) {
            try ECMA_424.BOM.Test.bom(ECMA_424.BOM.Test.Invalid.licenseChoice)
        }
    }

    @Test
    func `a license without id or name is refused`() {
        #expect(throws: ECMA_424.Error.missing("id")) {
            try ECMA_424.BOM.Test.bom(ECMA_424.BOM.Test.Invalid.licenseMissingIdAndName)
        }
    }

    @Test
    func `a date without a time is not a timestamp`() {
        #expect(throws: ECMA_424.Error.invalid("timestamp")) {
            try ECMA_424.BOM.Test.bom(ECMA_424.BOM.Test.Invalid.metadataTimestamp)
        }
    }

    @Test
    func `a property without a name is refused`() {
        #expect(throws: ECMA_424.Error.missing("name")) { try ECMA_424.BOM.Test.bom(ECMA_424.BOM.Test.Invalid.properties) }
    }

    @Test
    func `an unknown scope is refused`() {
        #expect(throws: ECMA_424.Error.invalid("scope")) { try ECMA_424.BOM.Test.bom(ECMA_424.BOM.Test.Invalid.scope) }
    }

    @Test
    func `a truncated serial number is refused`() {
        #expect(throws: ECMA_424.Error.invalid("serialNumber")) {
            try ECMA_424.BOM.Test.bom(ECMA_424.BOM.Test.Invalid.serialnumber)
        }
    }

    @Test
    func `an SPDX identifier outside the license list is accepted, because the list is not modeled`() throws {
        let bom = try ECMA_424.BOM.Test.bom(ECMA_424.BOM.Test.Invalid.licenseId)
        let choice = try #require(bom.components.first?.licenses.first)
        guard case .license(let license) = choice else {
            Issue.record("expected a license")
            return
        }
        #expect(license.identifier == .spdx("Apache-2"))
    }
}
