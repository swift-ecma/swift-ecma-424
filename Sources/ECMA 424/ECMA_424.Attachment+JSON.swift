public import RFC_8259

extension ECMA_424.Attachment {
    static let keys: Set<String> = ["contentType", "encoding", "content"]

    public init(json: RFC_8259.Value) throws(ECMA_424.Error) {
        let members = try ECMA_424.Members(json, known: Self.keys)
        guard let content = try members.string("content") else { throw .missing("content") }
        self.init(
            contentType: try members.string("contentType"),
            encoding: try members.value("encoding", ECMA_424.Attachment.Encoding.init(json:)),
            content: content
        )
    }

    public var json: RFC_8259.Value {
        ECMA_424.Members.object([
            ("contentType", ECMA_424.Members.text(contentType)),
            ("encoding", encoding?.json),
            ("content", .string(content)),
        ])
    }
}
