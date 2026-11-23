public import RFC_3339

extension ECMA.`424` {
    public struct Metadata: Sendable, Hashable {
        public let timestamp: IETF.RFC.`3339`.DateTime?
        public let lifecycles: [ECMA.`424`.Metadata.Lifecycle]
        public let tools: ECMA.`424`.Metadata.Tools?
        public let manufacturer: ECMA.`424`.Organization?
        public let authors: [ECMA.`424`.Organization.Contact]
        public let component: ECMA.`424`.Component?
        public let supplier: ECMA.`424`.Organization?
        public let licenses: [ECMA.`424`.License.Choice]
        public let properties: [ECMA.`424`.Property]

        public init(
            timestamp: IETF.RFC.`3339`.DateTime? = nil,
            lifecycles: [ECMA.`424`.Metadata.Lifecycle] = [],
            tools: ECMA.`424`.Metadata.Tools? = nil,
            manufacturer: ECMA.`424`.Organization? = nil,
            authors: [ECMA.`424`.Organization.Contact] = [],
            component: ECMA.`424`.Component? = nil,
            supplier: ECMA.`424`.Organization? = nil,
            licenses: [ECMA.`424`.License.Choice] = [],
            properties: [ECMA.`424`.Property] = []
        ) {
            self.timestamp = timestamp
            self.lifecycles = lifecycles
            self.tools = tools
            self.manufacturer = manufacturer
            self.authors = authors
            self.component = component
            self.supplier = supplier
            self.licenses = licenses
            self.properties = properties
        }
    }
}
