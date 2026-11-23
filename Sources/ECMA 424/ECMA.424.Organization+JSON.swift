import RFC_3987
public import RFC_8259

extension ECMA.`424`.Organization {
    static let keys: Set<String> = ["bom-ref", "name", "address", "url", "contact"]

    public init(json: IETF.RFC.`8259`.Value) throws(ECMA.`424`.Error) {
        let members = try ECMA.`424`.Members(json, known: Self.keys)
        self.init(
            reference: try members.value("bom-ref", ECMA.`424`.Reference.init(json:)),
            name: try members.string("name"),
            url: try members.values("url", ECMA.`424`.Members.iri),
            contact: try members.values("contact", ECMA.`424`.Organization.Contact.init(json:))
        )
    }

    public var json: IETF.RFC.`8259`.Value {
        ECMA.`424`.Members.object([
            ("bom-ref", reference?.json),
            ("name", ECMA.`424`.Members.text(name)),
            ("url", ECMA.`424`.Members.strings(url.map(\.value))),
            ("contact", ECMA.`424`.Members.array(contact.map(\.json))),
        ])
    }
}
