public import ISO_5962_License_Expression

extension ECMA.`424`.License {
    public struct Expression: Sendable, Hashable {
        public let value: ISO.`5962`.Expression
        public let reference: ECMA.`424`.Reference?
        public let acknowledgement: ECMA.`424`.License.Acknowledgement?
        public let properties: [ECMA.`424`.Property]

        public init(
            _ value: ISO.`5962`.Expression,
            reference: ECMA.`424`.Reference? = nil,
            acknowledgement: ECMA.`424`.License.Acknowledgement? = nil,
            properties: [ECMA.`424`.Property] = []
        ) {
            self.value = value
            self.reference = reference
            self.acknowledgement = acknowledgement
            self.properties = properties
        }
    }
}
