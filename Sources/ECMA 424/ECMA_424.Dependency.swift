extension ECMA_424 {
    public struct Dependency: Sendable, Hashable {
        public let ref: ECMA_424.Reference
        public let dependsOn: [ECMA_424.Reference]
        public let provides: [ECMA_424.Reference]

        public init(
            ref: ECMA_424.Reference,
            dependsOn: [ECMA_424.Reference] = [],
            provides: [ECMA_424.Reference] = []
        ) throws(ECMA_424.Error) {
            self.ref = ref
            self.dependsOn = try ECMA_424.Members.distinct(dependsOn, "dependsOn")
            self.provides = try ECMA_424.Members.distinct(provides, "provides")
        }
    }
}
