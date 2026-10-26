public import ISO_5962_License_Expression

extension ECMA_424.License {
    public struct Expression: Sendable, Hashable {
        public let value: ISO_5962.Expression
        public let reference: ECMA_424.Reference?
        public let acknowledgement: ECMA_424.License.Acknowledgement?
        public let properties: [ECMA_424.Property]

        public init(
            _ value: ISO_5962.Expression,
            reference: ECMA_424.Reference? = nil,
            acknowledgement: ECMA_424.License.Acknowledgement? = nil,
            properties: [ECMA_424.Property] = []
        ) {
            self.value = value
            self.reference = reference
            self.acknowledgement = acknowledgement
            self.properties = properties
        }
    }
}
