public import RFC_8259

extension ECMA_424.Dependency {
    static let keys: Set<String> = ["ref", "dependsOn", "provides"]

    public init(json: RFC_8259.Value) throws(ECMA_424.Error) {
        let members = try ECMA_424.Members(json, known: Self.keys)
        guard let ref = try members.value("ref", ECMA_424.Reference.init(json:)) else { throw .missing("ref") }
        try self.init(
            ref: ref,
            dependsOn: try members.values("dependsOn", ECMA_424.Reference.init(json:)),
            provides: try members.values("provides", ECMA_424.Reference.init(json:))
        )
    }

    public var json: RFC_8259.Value {
        ECMA_424.Members.object([
            ("ref", ref.json),
            ("dependsOn", ECMA_424.Members.array(dependsOn.map(\.json))),
            ("provides", ECMA_424.Members.array(provides.map(\.json))),
        ])
    }
}
