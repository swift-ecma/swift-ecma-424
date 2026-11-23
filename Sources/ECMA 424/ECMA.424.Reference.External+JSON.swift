import RFC_3987
public import RFC_8259

extension ECMA.`424`.Reference.External {
    static let keys: Set<String> = ["url", "comment", "type", "hashes", "properties"]

    public init(json: IETF.RFC.`8259`.Value) throws(ECMA.`424`.Error) {
        let members = try ECMA.`424`.Members(json, known: Self.keys)
        guard let url = try members.iri("url") else { throw .missing("url") }
        guard let kind = try members.value("type", Kind.init(json:)) else { throw .missing("type") }
        self.init(
            url: url,
            kind: kind,
            comment: try members.string("comment"),
            hashes: try members.values("hashes", ECMA.`424`.Hash.init(json:)),
            properties: try members.values("properties", ECMA.`424`.Property.init(json:))
        )
    }

    public var json: IETF.RFC.`8259`.Value {
        ECMA.`424`.Members.object([
            ("url", .string(url.value)),
            ("comment", ECMA.`424`.Members.text(comment)),
            ("type", kind.json),
            ("hashes", ECMA.`424`.Members.array(hashes.map(\.json))),
            ("properties", ECMA.`424`.Members.array(properties.map(\.json))),
        ])
    }
}
