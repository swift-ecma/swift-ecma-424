public import RFC_9110

extension ECMA_424 {
    public struct Attachment: Sendable, Hashable {
        public let contentType: RFC_9110.MediaType?
        public let encoding: ECMA_424.Attachment.Encoding?
        public let content: String

        public init(contentType: RFC_9110.MediaType? = nil, encoding: ECMA_424.Attachment.Encoding? = nil, content: String) {
            self.contentType = contentType
            self.encoding = encoding
            self.content = content
        }
    }
}
