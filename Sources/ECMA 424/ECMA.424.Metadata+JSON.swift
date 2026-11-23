import RFC_3339
public import RFC_8259

extension ECMA.`424`.Metadata {
    static let keys: Set<String> = [
        "timestamp", "lifecycles", "tools", "manufacturer", "authors", "component", "manufacture", "supplier",
        "licenses", "properties", "distributionConstraints",
    ]

    public init(json: IETF.RFC.`8259`.Value) throws(ECMA.`424`.Error) {
        let members = try ECMA.`424`.Members(json, known: Self.keys)
        self.init(
            timestamp: try members.value("timestamp", Self.timestamp),
            lifecycles: try members.values("lifecycles", ECMA.`424`.Metadata.Lifecycle.init(json:)),
            tools: try members.value("tools", ECMA.`424`.Metadata.Tools.init(json:)),
            manufacturer: try members.value("manufacturer", ECMA.`424`.Organization.init(json:)),
            authors: try members.values("authors", ECMA.`424`.Organization.Contact.init(json:)),
            component: try members.value("component", ECMA.`424`.Component.init(json:)),
            supplier: try members.value("supplier", ECMA.`424`.Organization.init(json:)),
            licenses: try members.values("licenses", ECMA.`424`.License.Choice.init(json:)),
            properties: try members.values("properties", ECMA.`424`.Property.init(json:))
        )
    }

    static func timestamp(_ json: IETF.RFC.`8259`.Value) throws(ECMA.`424`.Error) -> IETF.RFC.`3339`.DateTime {
        guard let text = json.string else { throw .malformed }
        do throws(IETF.RFC.`3339`.DateTime.Error) {
            return try IETF.RFC.`3339`.DateTime(text)
        } catch {
            throw .malformed
        }
    }

    public var json: IETF.RFC.`8259`.Value {
        ECMA.`424`.Members.object([
            ("timestamp", timestamp.map { .string($0.description) }),
            ("lifecycles", ECMA.`424`.Members.array(lifecycles.map(\.json))),
            ("tools", tools?.json),
            ("manufacturer", manufacturer?.json),
            ("authors", ECMA.`424`.Members.array(authors.map(\.json))),
            ("component", component?.json),
            ("supplier", supplier?.json),
            ("licenses", ECMA.`424`.Members.array(licenses.map(\.json))),
            ("properties", ECMA.`424`.Members.array(properties.map(\.json))),
        ])
    }
}
