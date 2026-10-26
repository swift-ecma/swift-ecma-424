import Byte
import ECMA_424
import ISO_5962_License_Expression
import RFC_3986
import RFC_8259
import Testing

extension ECMA_424.BOM {
    @Suite struct Test {
        @Suite struct Unit {}
        @Suite struct `Edge Case` {}
    }
}

extension ECMA_424.BOM.Test.Unit {

    @Test
    func `a built BOM serializes the required members and round-trips`() throws {
        let digest = [Byte](repeating: Byte(bitPattern: 0xAB), count: 32)
        let component = try ECMA_424.Component(
            kind: .library,
            reference: try ECMA_424.Reference("pkg:swift/swift-ietf/swift-rfc-8259@main"),
            name: "swift-rfc-8259",
            hashes: [try ECMA_424.Hash(algorithm: .sha256, content: digest)],
            licenses: [.expression(ECMA_424.License.Expression(.simple(.license("Apache-2.0"))))],
            externalReferences: [
                ECMA_424.Reference.External(url: try RFC_3986.URI("https://github.com/swift-ietf/swift-rfc-8259"), kind: .vcs)
            ]
        )
        let bom = try ECMA_424.BOM(components: [component])
        #expect(bom.json["bomFormat"] == "CycloneDX")
        #expect(bom.json["specVersion"] == "1.7")
        #expect(bom.json["components"]?[0]?["hashes"]?[0]?["content"] == .string(String(repeating: "ab", count: 32)))
        #expect(try ECMA_424.BOM(json: bom.json) == bom)
    }
}

extension ECMA_424.BOM.Test.Unit {

    @Test
    func `the BOM version defaults to one and is incremented by one`() throws {
        let bom = try ECMA_424.BOM()
        #expect(bom.version == .first)
        #expect(bom.json["version"] == 1)
        let next = bom.version.successor()
        #expect(next > bom.version)
        #expect(next.json == 2)
        #expect(try ECMA_424.BOM.Version(json: 2) == next)
    }
}

extension ECMA_424.BOM.Test.`Edge Case` {

    @Test
    func `the required members are required`() {
        #expect(throws: ECMA_424.Error.missing("bomFormat")) { try ECMA_424.BOM(json: ["specVersion": "1.7"]) }
        #expect(throws: ECMA_424.Error.missing("specVersion")) { try ECMA_424.BOM(json: ["bomFormat": "CycloneDX"]) }
    }

    @Test
    func `a member the schema does not define is refused`() {
        #expect(throws: ECMA_424.Error.unexpected("bomformat")) {
            try ECMA_424.BOM(json: ["bomFormat": "CycloneDX", "specVersion": "1.7", "bomformat": "CycloneDX"])
        }
    }

    @Test
    func `a document that is not an object is malformed`() {
        #expect(throws: ECMA_424.Error.malformed) { try ECMA_424.BOM(json: ["bomFormat", "CycloneDX"]) }
    }

    @Test
    func `a negative BOM version is refused`() {
        #expect(throws: ECMA_424.Error.invalid("version")) {
            try ECMA_424.BOM(json: ["bomFormat": "CycloneDX", "specVersion": "1.7", "version": -1])
        }
    }

    @Test
    func `the BOM version starts at one`() {
        #expect(throws: ECMA_424.Error.invalid("version")) {
            try ECMA_424.BOM(json: ["bomFormat": "CycloneDX", "specVersion": "1.7", "version": 0])
        }
    }

    @Test
    func `an uppercase serial number is refused`() {
        #expect(throws: ECMA_424.Error.invalid("serialNumber")) {
            try ECMA_424.BOM(json: [
                "bomFormat": "CycloneDX", "specVersion": "1.7", "serialNumber": "urn:uuid:3E671687-395B-41F5-A30F-A58921A69B79",
            ])
        }
    }

    @Test
    func `a license expression that does not parse is refused`() {
        #expect(throws: ECMA_424.Error.invalid("expression")) {
            try ECMA_424.License.Choice(json: ["expression": "MIT AND"])
        }
    }

    @Test
    func `uppercase hash content is read and written lowercase`() throws {
        let hash = try ECMA_424.Hash(json: ["alg": "MD5", "content": "3942447FAC867AE5CDB3229B658F4D48"])
        #expect(hash.json["content"] == "3942447fac867ae5cdb3229b658f4d48")
    }

    @Test
    func `duplicate components are refused`() throws {
        let component = try ECMA_424.Component(kind: .library, name: "a")
        #expect(throws: ECMA_424.Error.duplicate("components")) { try ECMA_424.BOM(components: [component, component]) }
    }

    @Test
    func `duplicate dependsOn references are refused`() throws {
        let reference = try ECMA_424.Reference("a")
        #expect(throws: ECMA_424.Error.duplicate("dependsOn")) {
            try ECMA_424.Dependency(ref: reference, dependsOn: [reference, reference])
        }
    }
}
