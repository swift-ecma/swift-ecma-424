public import RFC_8259

extension ECMA_424.Tool {
    static let keys: Set<String> = ["vendor", "name", "version", "hashes", "externalReferences"]

    public init(json: RFC_8259.Value) throws(ECMA_424.Error) {
        let members = try ECMA_424.Members(json, known: Self.keys)
        self.init(
            vendor: try members.string("vendor"),
            name: try members.string("name"),
            version: try members.string("version"),
            hashes: try members.values("hashes", ECMA_424.Hash.init(json:)),
            externalReferences: try members.values("externalReferences", ECMA_424.Reference.External.init(json:))
        )
    }

    public var json: RFC_8259.Value {
        ECMA_424.Members.object([
            ("vendor", ECMA_424.Members.text(vendor)),
            ("name", ECMA_424.Members.text(name)),
            ("version", ECMA_424.Members.text(version)),
            ("hashes", ECMA_424.Members.array(hashes.map(\.json))),
            ("externalReferences", ECMA_424.Members.array(externalReferences.map(\.json))),
        ])
    }
}
