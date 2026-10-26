public import RFC_3986

extension ECMA_424 {
    public struct License: Sendable, Hashable {
        public let identifier: ECMA_424.License.Identifier
        public let reference: ECMA_424.Reference?
        public let acknowledgement: ECMA_424.License.Acknowledgement?
        public let text: ECMA_424.Attachment?
        public let url: RFC_3986.URI?
        public let properties: [ECMA_424.Property]

        public init(
            _ identifier: ECMA_424.License.Identifier,
            reference: ECMA_424.Reference? = nil,
            acknowledgement: ECMA_424.License.Acknowledgement? = nil,
            text: ECMA_424.Attachment? = nil,
            url: RFC_3986.URI? = nil,
            properties: [ECMA_424.Property] = []
        ) {
            self.identifier = identifier
            self.reference = reference
            self.acknowledgement = acknowledgement
            self.text = text
            self.url = url
            self.properties = properties
        }
    }
}
