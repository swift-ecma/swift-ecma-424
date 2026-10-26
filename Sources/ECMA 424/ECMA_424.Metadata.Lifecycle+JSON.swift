public import RFC_8259

extension ECMA_424.Metadata.Lifecycle {
    public init(json: RFC_8259.Value) throws(ECMA_424.Error) {
        guard let object = json.object else { throw .malformed }
        if object["phase"] != nil {
            let members = try ECMA_424.Members(json, known: ["phase"])
            guard let phase = try members.value("phase", Phase.init(json:)) else { throw .missing("phase") }
            self = .phase(phase)
        } else {
            let members = try ECMA_424.Members(json, known: ["name", "description"])
            guard let name = try members.string("name") else { throw .missing("name") }
            self = .custom(name: name, description: try members.string("description"))
        }
    }

    public var json: RFC_8259.Value {
        switch self {
        case .phase(let phase):
            ECMA_424.Members.object([("phase", phase.json)])
        case .custom(let name, let description):
            ECMA_424.Members.object([
                ("name", .string(name)),
                ("description", ECMA_424.Members.text(description)),
            ])
        }
    }
}
