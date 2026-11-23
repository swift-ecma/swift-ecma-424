public import RFC_8259
import RFC_9110

extension ECMA.`424`.Attachment {
    static let keys: Set<String> = ["contentType", "encoding", "content"]

    public init(json: IETF.RFC.`8259`.Value) throws(ECMA.`424`.Error) {
        let members = try ECMA.`424`.Members(json, known: Self.keys)
        guard let content = try members.string("content") else { throw .missing("content") }
        self.init(
            contentType: try members.mediaType("contentType"),
            encoding: try members.value("encoding", ECMA.`424`.Attachment.Encoding.init(json:)),
            content: content
        )
    }

    public var json: IETF.RFC.`8259`.Value {
        ECMA.`424`.Members.object([
            ("contentType", ECMA.`424`.Members.text(contentType?.value)),
            ("encoding", encoding?.json),
            ("content", .string(content)),
        ])
    }
}
