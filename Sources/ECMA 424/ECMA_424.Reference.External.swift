public import RFC_3986

extension ECMA_424.Reference {
    public struct External: Sendable, Hashable {
        public let url: RFC_3986.URI
        public let kind: ECMA_424.Reference.External.Kind
        public let comment: String?
        public let hashes: [ECMA_424.Hash]
        public let properties: [ECMA_424.Property]

        public init(
            url: RFC_3986.URI,
            kind: ECMA_424.Reference.External.Kind,
            comment: String? = nil,
            hashes: [ECMA_424.Hash] = [],
            properties: [ECMA_424.Property] = []
        ) {
            self.url = url
            self.kind = kind
            self.comment = comment
            self.hashes = hashes
            self.properties = properties
        }
    }
}
