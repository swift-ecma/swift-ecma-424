extension ECMA_424 {
    public struct Tool: Sendable, Hashable {
        public let vendor: String?
        public let name: String?
        public let version: String?
        public let hashes: [ECMA_424.Hash]
        public let externalReferences: [ECMA_424.Reference.External]

        public init(
            vendor: String? = nil,
            name: String? = nil,
            version: String? = nil,
            hashes: [ECMA_424.Hash] = [],
            externalReferences: [ECMA_424.Reference.External] = []
        ) {
            self.vendor = vendor
            self.name = name
            self.version = version
            self.hashes = hashes
            self.externalReferences = externalReferences
        }
    }
}
