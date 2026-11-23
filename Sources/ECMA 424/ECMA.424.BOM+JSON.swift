import RFC_4122
public import RFC_8259

extension ECMA.`424`.BOM {
    static let keys: Set<String> = [
        "$schema", "bomFormat", "specVersion", "serialNumber", "version", "metadata", "components", "services",
        "externalReferences", "dependencies", "compositions", "vulnerabilities", "annotations", "formulation",
        "declarations", "definitions", "citations", "properties", "signature",
    ]

    static let urn = "urn:uuid:"

    public init(json: IETF.RFC.`8259`.Value) throws(ECMA.`424`.Error) {
        let members = try ECMA.`424`.Members(json, known: Self.keys)
        guard let format = try members.string("bomFormat") else { throw .missing("bomFormat") }
        guard format == ECMA.`424`.format else { throw .invalid("bomFormat") }
        guard let specVersion = try members.string("specVersion") else { throw .missing("specVersion") }
        try self.init(
            specVersion: specVersion,
            serialNumber: try members.value("serialNumber", Self.serial),
            version: try members.value("version", ECMA.`424`.BOM.Version.init(json:)) ?? .first,
            metadata: try members.value("metadata", ECMA.`424`.Metadata.init(json:)),
            components: try members.unique("components", ECMA.`424`.Component.init(json:)),
            externalReferences: try members.values("externalReferences", ECMA.`424`.Reference.External.init(json:)),
            dependencies: try members.unique("dependencies", ECMA.`424`.Dependency.init(json:)),
            properties: try members.values("properties", ECMA.`424`.Property.init(json:))
        )
    }

    static func serial(_ json: IETF.RFC.`8259`.Value) throws(ECMA.`424`.Error) -> IETF.RFC.`4122`.UUID {
        guard let text = json.string, text.hasPrefix(urn) else { throw .malformed }
        let uuid = String(text.dropFirst(urn.count))
        let parsed: IETF.RFC.`4122`.UUID
        do throws(IETF.RFC.`4122`.UUID.Error) {
            parsed = try IETF.RFC.`4122`.UUID(uuid)
        } catch {
            throw .malformed
        }
        guard parsed.description == uuid else { throw .malformed }
        return parsed
    }

    public var json: IETF.RFC.`8259`.Value {
        ECMA.`424`.Members.object([
            ("bomFormat", .string(ECMA.`424`.format)),
            ("specVersion", .string(specVersion)),
            ("serialNumber", serialNumber.map { .string(Self.urn + $0.description) }),
            ("version", version.json),
            ("metadata", metadata?.json),
            ("components", ECMA.`424`.Members.array(components.map(\.json))),
            ("externalReferences", ECMA.`424`.Members.array(externalReferences.map(\.json))),
            ("dependencies", ECMA.`424`.Members.array(dependencies.map(\.json))),
            ("properties", ECMA.`424`.Members.array(properties.map(\.json))),
        ])
    }
}
