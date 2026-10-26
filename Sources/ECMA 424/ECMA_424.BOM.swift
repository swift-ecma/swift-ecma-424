public import RFC_4122

extension ECMA_424 {
    public struct BOM: Sendable, Hashable {
        public let specVersion: String
        public let serialNumber: RFC_4122.UUID?
        public let version: Int
        public let metadata: ECMA_424.Metadata?
        public let components: [ECMA_424.Component]
        public let externalReferences: [ECMA_424.Reference.External]
        public let dependencies: [ECMA_424.Dependency]
        public let properties: [ECMA_424.Property]

        public init(
            specVersion: String = ECMA_424.version,
            serialNumber: RFC_4122.UUID? = nil,
            version: Int = 1,
            metadata: ECMA_424.Metadata? = nil,
            components: [ECMA_424.Component] = [],
            externalReferences: [ECMA_424.Reference.External] = [],
            dependencies: [ECMA_424.Dependency] = [],
            properties: [ECMA_424.Property] = []
        ) throws(ECMA_424.Error) {
            guard version >= 1 else { throw .invalid("version") }
            self.specVersion = specVersion
            self.serialNumber = serialNumber
            self.version = version
            self.metadata = metadata
            self.components = try ECMA_424.Members.distinct(components, "components")
            self.externalReferences = externalReferences
            self.dependencies = try ECMA_424.Members.distinct(dependencies, "dependencies")
            self.properties = properties
        }
    }
}
