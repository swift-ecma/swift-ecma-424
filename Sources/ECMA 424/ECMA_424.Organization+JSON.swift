import RFC_3986
public import RFC_8259

extension ECMA_424.Organization {
    static let keys: Set<String> = ["bom-ref", "name", "address", "url", "contact"]

    public init(json: RFC_8259.Value) throws(ECMA_424.Error) {
        let members = try ECMA_424.Members(json, known: Self.keys)
        self.init(
            reference: try members.value("bom-ref", ECMA_424.Reference.init(json:)),
            name: try members.string("name"),
            url: try members.values("url", ECMA_424.Members.uri),
            contact: try members.values("contact", ECMA_424.Organization.Contact.init(json:))
        )
    }

    public var json: RFC_8259.Value {
        ECMA_424.Members.object([
            ("bom-ref", reference?.json),
            ("name", ECMA_424.Members.text(name)),
            ("url", ECMA_424.Members.strings(url.map(\.value))),
            ("contact", ECMA_424.Members.array(contact.map(\.json))),
        ])
    }
}
