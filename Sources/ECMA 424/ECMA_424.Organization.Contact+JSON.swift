public import RFC_8259

extension ECMA_424.Organization.Contact {
    static let keys: Set<String> = ["bom-ref", "name", "email", "phone"]

    public init(json: RFC_8259.Value) throws(ECMA_424.Error) {
        let members = try ECMA_424.Members(json, known: Self.keys)
        self.init(
            reference: try members.value("bom-ref", ECMA_424.Reference.init(json:)),
            name: try members.string("name"),
            email: try members.string("email"),
            phone: try members.string("phone")
        )
    }

    public var json: RFC_8259.Value {
        ECMA_424.Members.object([
            ("bom-ref", reference?.json),
            ("name", ECMA_424.Members.text(name)),
            ("email", ECMA_424.Members.text(email)),
            ("phone", ECMA_424.Members.text(phone)),
        ])
    }
}
