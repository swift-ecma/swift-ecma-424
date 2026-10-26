import RFC_4122
public import RFC_8259

extension ECMA_424.BOM {
    static let keys: Set<String> = [
        "$schema", "bomFormat", "specVersion", "serialNumber", "version", "metadata", "components", "services",
        "externalReferences", "dependencies", "compositions", "vulnerabilities", "annotations", "formulation",
        "declarations", "definitions", "citations", "properties", "signature",
    ]

    static let urn = "urn:uuid:"

    public init(json: RFC_8259.Value) throws(ECMA_424.Error) {
        let members = try ECMA_424.Members(json, known: Self.keys)
        guard let format = try members.string("bomFormat") else { throw .missing("bomFormat") }
        guard format == ECMA_424.format else { throw .invalid("bomFormat") }
        guard let specVersion = try members.string("specVersion") else { throw .missing("specVersion") }
        try self.init(
            specVersion: specVersion,
            serialNumber: try members.value("serialNumber", Self.serial),
            version: try members.integer("version") ?? 1,
            metadata: try members.value("metadata", ECMA_424.Metadata.init(json:)),
            components: try members.unique("components", ECMA_424.Component.init(json:)),
            externalReferences: try members.values("externalReferences", ECMA_424.Reference.External.init(json:)),
            dependencies: try members.unique("dependencies", ECMA_424.Dependency.init(json:)),
            properties: try members.values("properties", ECMA_424.Property.init(json:))
        )
    }

    static func serial(_ json: RFC_8259.Value) throws(ECMA_424.Error) -> RFC_4122.UUID {
        guard let text = json.string, text.hasPrefix(urn) else { throw .malformed }
        let uuid = String(text.dropFirst(urn.count))
        let parsed: RFC_4122.UUID
        do throws(RFC_4122.UUID.Error) {
            parsed = try RFC_4122.UUID(uuid)
        } catch {
            throw .malformed
        }
        guard parsed.description == uuid else { throw .malformed }
        return parsed
    }

    public var json: RFC_8259.Value {
        ECMA_424.Members.object([
            ("bomFormat", .string(ECMA_424.format)),
            ("specVersion", .string(specVersion)),
            ("serialNumber", serialNumber.map { .string(Self.urn + $0.description) }),
            ("version", .number(RFC_8259.Number(version))),
            ("metadata", metadata?.json),
            ("components", ECMA_424.Members.array(components.map(\.json))),
            ("externalReferences", ECMA_424.Members.array(externalReferences.map(\.json))),
            ("dependencies", ECMA_424.Members.array(dependencies.map(\.json))),
            ("properties", ECMA_424.Members.array(properties.map(\.json))),
        ])
    }
}
