public import RFC_3987

extension ECMA.`424` {
    public struct License: Sendable, Hashable {
        public let identifier: ECMA.`424`.License.Identifier
        public let reference: ECMA.`424`.Reference?
        public let acknowledgement: ECMA.`424`.License.Acknowledgement?
        public let text: ECMA.`424`.Attachment?
        public let url: IETF.RFC.`3987`.IRI.Reference?
        public let properties: [ECMA.`424`.Property]

        public init(
            _ identifier: ECMA.`424`.License.Identifier,
            reference: ECMA.`424`.Reference? = nil,
            acknowledgement: ECMA.`424`.License.Acknowledgement? = nil,
            text: ECMA.`424`.Attachment? = nil,
            url: IETF.RFC.`3987`.IRI.Reference? = nil,
            properties: [ECMA.`424`.Property] = []
        ) {
            self.identifier = identifier
            self.reference = reference
            self.acknowledgement = acknowledgement
            self.text = text
            self.url = url
            self.properties = properties
        }
    }
}
