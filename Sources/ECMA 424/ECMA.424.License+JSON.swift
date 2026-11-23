import RFC_3987
public import RFC_8259

extension ECMA.`424`.License {
    static let keys: Set<String> = ["bom-ref", "id", "name", "acknowledgement", "text", "url", "licensing", "properties"]

    public init(json: IETF.RFC.`8259`.Value) throws(ECMA.`424`.Error) {
        let members = try ECMA.`424`.Members(json, known: Self.keys)
        let identifier: Identifier
        let id = try members.string("id")
        let name = try members.string("name")
        switch (id, name) {
        case (let id?, nil): identifier = .spdx(id)
        case (nil, let name?): identifier = .name(name)
        case (nil, nil): throw .missing("id")
        case (.some, .some): throw .unexpected("name")
        }
        self.init(
            identifier,
            reference: try members.value("bom-ref", ECMA.`424`.Reference.init(json:)),
            acknowledgement: try members.value("acknowledgement", Acknowledgement.init(json:)),
            text: try members.value("text", ECMA.`424`.Attachment.init(json:)),
            url: try members.iri("url"),
            properties: try members.values("properties", ECMA.`424`.Property.init(json:))
        )
    }

    public var json: IETF.RFC.`8259`.Value {
        let (id, name): (IETF.RFC.`8259`.Value?, IETF.RFC.`8259`.Value?) =
            switch identifier {
            case .spdx(let value): (.string(value), nil)
            case .name(let value): (nil, .string(value))
            }
        return ECMA.`424`.Members.object([
            ("bom-ref", reference?.json),
            ("id", id),
            ("name", name),
            ("acknowledgement", acknowledgement?.json),
            ("text", text?.json),
            ("url", ECMA.`424`.Members.text(url?.value)),
            ("properties", ECMA.`424`.Members.array(properties.map(\.json))),
        ])
    }
}
