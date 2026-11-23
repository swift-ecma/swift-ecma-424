public import RFC_8259

extension ECMA.`424`.Dependency {
    static let keys: Set<String> = ["ref", "dependsOn", "provides"]

    public init(json: IETF.RFC.`8259`.Value) throws(ECMA.`424`.Error) {
        let members = try ECMA.`424`.Members(json, known: Self.keys)
        guard let ref = try members.value("ref", ECMA.`424`.Reference.init(json:)) else { throw .missing("ref") }
        try self.init(
            ref: ref,
            dependsOn: try members.values("dependsOn", ECMA.`424`.Reference.init(json:)),
            provides: try members.values("provides", ECMA.`424`.Reference.init(json:))
        )
    }

    public var json: IETF.RFC.`8259`.Value {
        ECMA.`424`.Members.object([
            ("ref", ref.json),
            ("dependsOn", ECMA.`424`.Members.array(dependsOn.map(\.json))),
            ("provides", ECMA.`424`.Members.array(provides.map(\.json))),
        ])
    }
}
