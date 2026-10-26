public import RFC_3986

extension ECMA_424 {
    public struct Organization: Sendable, Hashable {
        public let reference: ECMA_424.Reference?
        public let name: String?
        public let url: [RFC_3986.URI]
        public let contact: [ECMA_424.Organization.Contact]

        public init(
            reference: ECMA_424.Reference? = nil,
            name: String? = nil,
            url: [RFC_3986.URI] = [],
            contact: [ECMA_424.Organization.Contact] = []
        ) {
            self.reference = reference
            self.name = name
            self.url = url
            self.contact = contact
        }
    }
}
