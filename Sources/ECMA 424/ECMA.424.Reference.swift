extension ECMA.`424` {
    public struct Reference: Sendable, Hashable {
        public let value: String

        public init(_ value: String) throws(ECMA.`424`.Error) {
            guard !value.isEmpty else { throw .invalid("bom-ref") }
            self.value = value
        }
    }
}
