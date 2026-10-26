public import RFC_8259

extension ECMA_424.Property {
    static let keys: Set<String> = ["name", "value"]

    public init(json: RFC_8259.Value) throws(ECMA_424.Error) {
        let members = try ECMA_424.Members(json, known: Self.keys)
        guard let name = try members.string("name") else { throw .missing("name") }
        self.init(name: name, value: try members.string("value"))
    }

    public var json: RFC_8259.Value {
        ECMA_424.Members.object([
            ("name", .string(name)),
            ("value", ECMA_424.Members.text(value)),
        ])
    }
}
