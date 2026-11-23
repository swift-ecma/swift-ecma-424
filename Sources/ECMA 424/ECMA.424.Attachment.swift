public import RFC_9110

extension ECMA.`424` {
    public struct Attachment: Sendable, Hashable {
        public let contentType: IETF.RFC.`9110`.MediaType?
        public let encoding: ECMA.`424`.Attachment.Encoding?
        public let content: String

        public init(contentType: IETF.RFC.`9110`.MediaType? = nil, encoding: ECMA.`424`.Attachment.Encoding? = nil, content: String) {
            self.contentType = contentType
            self.encoding = encoding
            self.content = content
        }
    }
}
