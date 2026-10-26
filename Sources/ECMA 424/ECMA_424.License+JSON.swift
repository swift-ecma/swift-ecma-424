import RFC_3986
public import RFC_8259

extension ECMA_424.License {
    static let keys: Set<String> = ["bom-ref", "id", "name", "acknowledgement", "text", "url", "licensing", "properties"]

    public init(json: RFC_8259.Value) throws(ECMA_424.Error) {
        let members = try ECMA_424.Members(json, known: Self.keys)
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
            reference: try members.value("bom-ref", ECMA_424.Reference.init(json:)),
            acknowledgement: try members.value("acknowledgement", Acknowledgement.init(json:)),
            text: try members.value("text", ECMA_424.Attachment.init(json:)),
            url: try members.uri("url"),
            properties: try members.values("properties", ECMA_424.Property.init(json:))
        )
    }

    public var json: RFC_8259.Value {
        let (id, name): (RFC_8259.Value?, RFC_8259.Value?) =
            switch identifier {
            case .spdx(let value): (.string(value), nil)
            case .name(let value): (nil, .string(value))
            }
        return ECMA_424.Members.object([
            ("bom-ref", reference?.json),
            ("id", id),
            ("name", name),
            ("acknowledgement", acknowledgement?.json),
            ("text", text?.json),
            ("url", ECMA_424.Members.text(url?.value)),
            ("properties", ECMA_424.Members.array(properties.map(\.json))),
        ])
    }
}
