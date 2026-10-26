extension ECMA_424.Organization {
    public struct Contact: Sendable, Hashable {
        public let reference: ECMA_424.Reference?
        public let name: String?
        public let email: String?
        public let phone: String?

        public init(
            reference: ECMA_424.Reference? = nil,
            name: String? = nil,
            email: String? = nil,
            phone: String? = nil
        ) {
            self.reference = reference
            self.name = name
            self.email = email
            self.phone = phone
        }
    }
}
