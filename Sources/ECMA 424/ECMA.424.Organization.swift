public import RFC_3987

extension ECMA.`424` {
    public struct Organization: Sendable, Hashable {
        public let reference: ECMA.`424`.Reference?
        public let name: String?
        public let url: [IETF.RFC.`3987`.IRI.Reference]
        public let contact: [ECMA.`424`.Organization.Contact]

        public init(
            reference: ECMA.`424`.Reference? = nil,
            name: String? = nil,
            url: [IETF.RFC.`3987`.IRI.Reference] = [],
            contact: [ECMA.`424`.Organization.Contact] = []
        ) {
            self.reference = reference
            self.name = name
            self.url = url
            self.contact = contact
        }
    }
}
