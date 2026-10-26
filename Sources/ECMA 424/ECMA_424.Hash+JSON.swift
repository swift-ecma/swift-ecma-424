public import RFC_8259

extension ECMA_424.Hash {
    static let keys: Set<String> = ["alg", "content"]

    public init(json: RFC_8259.Value) throws(ECMA_424.Error) {
        let members = try ECMA_424.Members(json, known: Self.keys)
        guard let algorithm = try members.value("alg", Algorithm.init(json:)) else { throw .missing("alg") }
        guard let content = try members.string("content") else { throw .missing("content") }
        try self.init(algorithm: algorithm, content: try ECMA_424.Members.bytes(content, "content"))
    }

    public var json: RFC_8259.Value {
        ECMA_424.Members.object([
            ("alg", algorithm.json),
            ("content", .string(ECMA_424.Members.hex(content))),
        ])
    }
}
