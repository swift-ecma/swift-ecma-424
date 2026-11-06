public import EmailAddress_Standard

extension ECMA_424.Organization {
    public struct Contact: Sendable, Hashable {
        public let reference: ECMA_424.Reference?
        public let name: String?
        public let email: EmailAddress?
        public let phone: String?

        public init(
            reference: ECMA_424.Reference? = nil,
            name: String? = nil,
            email: EmailAddress? = nil,
            phone: String? = nil
        ) {
            self.reference = reference
            self.name = name
            self.email = email
            self.phone = phone
        }
    }
}
