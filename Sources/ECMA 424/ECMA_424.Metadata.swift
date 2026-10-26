public import RFC_3339

extension ECMA_424 {
    public struct Metadata: Sendable, Hashable {
        public let timestamp: RFC_3339.DateTime?
        public let lifecycles: [ECMA_424.Metadata.Lifecycle]
        public let tools: ECMA_424.Metadata.Tools?
        public let manufacturer: ECMA_424.Organization?
        public let authors: [ECMA_424.Organization.Contact]
        public let component: ECMA_424.Component?
        public let supplier: ECMA_424.Organization?
        public let licenses: [ECMA_424.License.Choice]
        public let properties: [ECMA_424.Property]

        public init(
            timestamp: RFC_3339.DateTime? = nil,
            lifecycles: [ECMA_424.Metadata.Lifecycle] = [],
            tools: ECMA_424.Metadata.Tools? = nil,
            manufacturer: ECMA_424.Organization? = nil,
            authors: [ECMA_424.Organization.Contact] = [],
            component: ECMA_424.Component? = nil,
            supplier: ECMA_424.Organization? = nil,
            licenses: [ECMA_424.License.Choice] = [],
            properties: [ECMA_424.Property] = []
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
