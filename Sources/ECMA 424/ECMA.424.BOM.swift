public import RFC_4122

extension ECMA.`424` {
    public struct BOM: Sendable, Hashable {
        public let specVersion: String
        public let serialNumber: IETF.RFC.`4122`.UUID?
        public let version: ECMA.`424`.BOM.Version
        public let metadata: ECMA.`424`.Metadata?
        public let components: [ECMA.`424`.Component]
        public let externalReferences: [ECMA.`424`.Reference.External]
        public let dependencies: [ECMA.`424`.Dependency]
        public let properties: [ECMA.`424`.Property]

        public init(
            specVersion: String = ECMA.`424`.version,
            serialNumber: IETF.RFC.`4122`.UUID? = nil,
            version: ECMA.`424`.BOM.Version = .first,
            metadata: ECMA.`424`.Metadata? = nil,
            components: [ECMA.`424`.Component] = [],
            externalReferences: [ECMA.`424`.Reference.External] = [],
            dependencies: [ECMA.`424`.Dependency] = [],
            properties: [ECMA.`424`.Property] = []
        ) throws(ECMA.`424`.Error) {
            self.specVersion = specVersion
            self.serialNumber = serialNumber
            self.version = version
            self.metadata = metadata
            self.components = try ECMA.`424`.Members.distinct(components, "components")
            self.externalReferences = externalReferences
            self.dependencies = try ECMA.`424`.Members.distinct(dependencies, "dependencies")
            self.properties = properties
        }
    }
}
