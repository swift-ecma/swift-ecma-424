public import RFC_3987

extension ECMA.`424`.Reference {
    public struct External: Sendable, Hashable {
        public let url: IETF.RFC.`3987`.IRI.Reference
        public let kind: ECMA.`424`.Reference.External.Kind
        public let comment: String?
        public let hashes: [ECMA.`424`.Hash]
        public let properties: [ECMA.`424`.Property]

        public init(
            url: IETF.RFC.`3987`.IRI.Reference,
            kind: ECMA.`424`.Reference.External.Kind,
            comment: String? = nil,
            hashes: [ECMA.`424`.Hash] = [],
            properties: [ECMA.`424`.Property] = []
        ) {
            self.url = url
            self.kind = kind
            self.comment = comment
            self.hashes = hashes
            self.properties = properties
        }
    }
}
