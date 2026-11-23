public import RFC_8259

extension ECMA.`424`.Hash {
    static let keys: Set<String> = ["alg", "content"]

    public init(json: IETF.RFC.`8259`.Value) throws(ECMA.`424`.Error) {
        let members = try ECMA.`424`.Members(json, known: Self.keys)
        guard let algorithm = try members.value("alg", Algorithm.init(json:)) else { throw .missing("alg") }
        guard let content = try members.string("content") else { throw .missing("content") }
        try self.init(algorithm: algorithm, content: try ECMA.`424`.Members.bytes(content, "content"))
    }

    public var json: IETF.RFC.`8259`.Value {
        ECMA.`424`.Members.object([
            ("alg", algorithm.json),
            ("content", .string(ECMA.`424`.Members.hex(content))),
        ])
    }
}
