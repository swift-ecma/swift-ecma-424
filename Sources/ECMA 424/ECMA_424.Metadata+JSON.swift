import RFC_3339
public import RFC_8259

extension ECMA_424.Metadata {
    static let keys: Set<String> = [
        "timestamp", "lifecycles", "tools", "manufacturer", "authors", "component", "manufacture", "supplier",
        "licenses", "properties", "distributionConstraints",
    ]

    public init(json: RFC_8259.Value) throws(ECMA_424.Error) {
        let members = try ECMA_424.Members(json, known: Self.keys)
        self.init(
            timestamp: try members.value("timestamp", Self.timestamp),
            lifecycles: try members.values("lifecycles", ECMA_424.Metadata.Lifecycle.init(json:)),
            tools: try members.value("tools", ECMA_424.Metadata.Tools.init(json:)),
            manufacturer: try members.value("manufacturer", ECMA_424.Organization.init(json:)),
            authors: try members.values("authors", ECMA_424.Organization.Contact.init(json:)),
            component: try members.value("component", ECMA_424.Component.init(json:)),
            supplier: try members.value("supplier", ECMA_424.Organization.init(json:)),
            licenses: try members.values("licenses", ECMA_424.License.Choice.init(json:)),
            properties: try members.values("properties", ECMA_424.Property.init(json:))
        )
    }

    static func timestamp(_ json: RFC_8259.Value) throws(ECMA_424.Error) -> RFC_3339.DateTime {
        guard let text = json.string else { throw .malformed }
        do throws(RFC_3339.DateTime.Error) {
            return try RFC_3339.DateTime(text)
        } catch {
            throw .malformed
        }
    }

    public var json: RFC_8259.Value {
        ECMA_424.Members.object([
            ("timestamp", timestamp.map { .string($0.description) }),
            ("lifecycles", ECMA_424.Members.array(lifecycles.map(\.json))),
            ("tools", tools?.json),
            ("manufacturer", manufacturer?.json),
            ("authors", ECMA_424.Members.array(authors.map(\.json))),
            ("component", component?.json),
            ("supplier", supplier?.json),
            ("licenses", ECMA_424.Members.array(licenses.map(\.json))),
            ("properties", ECMA_424.Members.array(properties.map(\.json))),
        ])
    }
}
