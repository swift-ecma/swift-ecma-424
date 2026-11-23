public import RFC_8259

extension ECMA.`424`.Tool {
    static let keys: Set<String> = ["vendor", "name", "version", "hashes", "externalReferences"]

    public init(json: IETF.RFC.`8259`.Value) throws(ECMA.`424`.Error) {
        let members = try ECMA.`424`.Members(json, known: Self.keys)
        self.init(
            vendor: try members.string("vendor"),
            name: try members.string("name"),
            version: try members.string("version"),
            hashes: try members.values("hashes", ECMA.`424`.Hash.init(json:)),
            externalReferences: try members.values("externalReferences", ECMA.`424`.Reference.External.init(json:))
        )
    }

    public var json: IETF.RFC.`8259`.Value {
        ECMA.`424`.Members.object([
            ("vendor", ECMA.`424`.Members.text(vendor)),
            ("name", ECMA.`424`.Members.text(name)),
            ("version", ECMA.`424`.Members.text(version)),
            ("hashes", ECMA.`424`.Members.array(hashes.map(\.json))),
            ("externalReferences", ECMA.`424`.Members.array(externalReferences.map(\.json))),
        ])
    }
}
