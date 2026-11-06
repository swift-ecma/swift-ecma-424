extension ECMA_424 {
    public struct Tool: Sendable, Hashable {
        public let vendor: String?
        public let name: String?
        // swift-linter:disable:next raw concept
        // REASON: CycloneDX leaves a tool's version free-form; looked at Version.Semantic and Version.Tools, which would refuse real BOMs.
        public let version: String?
        public let hashes: [ECMA_424.Hash]
        public let externalReferences: [ECMA_424.Reference.External]

        public init(
            vendor: String? = nil,
            name: String? = nil,
            // swift-linter:disable:next raw concept
            // REASON: CycloneDX leaves a tool's version free-form; looked at Version.Semantic and Version.Tools, which would refuse real BOMs.
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
