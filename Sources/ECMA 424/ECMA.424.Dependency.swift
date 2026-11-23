extension ECMA.`424` {
    public struct Dependency: Sendable, Hashable {
        public let ref: ECMA.`424`.Reference
        public let dependsOn: [ECMA.`424`.Reference]
        public let provides: [ECMA.`424`.Reference]

        public init(
            ref: ECMA.`424`.Reference,
            dependsOn: [ECMA.`424`.Reference] = [],
            provides: [ECMA.`424`.Reference] = []
        ) throws(ECMA.`424`.Error) {
            self.ref = ref
            self.dependsOn = try ECMA.`424`.Members.distinct(dependsOn, "dependsOn")
            self.provides = try ECMA.`424`.Members.distinct(provides, "provides")
        }
    }
}
