import EmailAddress_Standard
public import RFC_8259

extension ECMA.`424`.Organization.Contact {
    static let keys: Set<String> = ["bom-ref", "name", "email", "phone"]

    public init(json: IETF.RFC.`8259`.Value) throws(ECMA.`424`.Error) {
        let members = try ECMA.`424`.Members(json, known: Self.keys)
        self.init(
            reference: try members.value("bom-ref", ECMA.`424`.Reference.init(json:)),
            name: try members.string("name"),
            email: try members.email("email"),
            phone: try members.string("phone")
        )
    }

    public var json: IETF.RFC.`8259`.Value {
        ECMA.`424`.Members.object([
            ("bom-ref", reference?.json),
            ("name", ECMA.`424`.Members.text(name)),
            ("email", ECMA.`424`.Members.text(email?.address)),
            ("phone", ECMA.`424`.Members.text(phone)),
        ])
    }
}
