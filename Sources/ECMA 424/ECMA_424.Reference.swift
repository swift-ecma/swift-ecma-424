extension ECMA_424 {
    public struct Reference: Sendable, Hashable {
        public let value: String

        public init(_ value: String) throws(ECMA_424.Error) {
            guard !value.isEmpty else { throw .invalid("bom-ref") }
            self.value = value
        }
    }
}
