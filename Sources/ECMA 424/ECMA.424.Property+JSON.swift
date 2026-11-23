public import RFC_8259

extension ECMA.`424`.Property {
    static let keys: Set<String> = ["name", "value"]

    public init(json: IETF.RFC.`8259`.Value) throws(ECMA.`424`.Error) {
        let members = try ECMA.`424`.Members(json, known: Self.keys)
        guard let name = try members.string("name") else { throw .missing("name") }
        self.init(name: name, value: try members.string("value"))
    }

    public var json: IETF.RFC.`8259`.Value {
        ECMA.`424`.Members.object([
            ("name", .string(name)),
            ("value", ECMA.`424`.Members.text(value)),
        ])
    }
}
