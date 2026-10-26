import RFC_3986
public import RFC_8259

extension ECMA_424.Reference.External {
    static let keys: Set<String> = ["url", "comment", "type", "hashes", "properties"]

    public init(json: RFC_8259.Value) throws(ECMA_424.Error) {
        let members = try ECMA_424.Members(json, known: Self.keys)
        guard let url = try members.uri("url") else { throw .missing("url") }
        guard let kind = try members.value("type", Kind.init(json:)) else { throw .missing("type") }
        self.init(
            url: url,
            kind: kind,
            comment: try members.string("comment"),
            hashes: try members.values("hashes", ECMA_424.Hash.init(json:)),
            properties: try members.values("properties", ECMA_424.Property.init(json:))
        )
    }

    public var json: RFC_8259.Value {
        ECMA_424.Members.object([
            ("url", .string(url.value)),
            ("comment", ECMA_424.Members.text(comment)),
            ("type", kind.json),
            ("hashes", ECMA_424.Members.array(hashes.map(\.json))),
            ("properties", ECMA_424.Members.array(properties.map(\.json))),
        ])
    }
}
