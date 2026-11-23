public import RFC_8259

extension ECMA.`424`.Metadata.Lifecycle {
    public init(json: IETF.RFC.`8259`.Value) throws(ECMA.`424`.Error) {
        guard let object = json.object else { throw .malformed }
        if object["phase"] != nil {
            let members = try ECMA.`424`.Members(json, known: ["phase"])
            guard let phase = try members.value("phase", Phase.init(json:)) else { throw .missing("phase") }
            self = .phase(phase)
        } else {
            let members = try ECMA.`424`.Members(json, known: ["name", "description"])
            guard let name = try members.string("name") else { throw .missing("name") }
            self = .custom(name: name, description: try members.string("description"))
        }
    }

    public var json: IETF.RFC.`8259`.Value {
        switch self {
        case .phase(let phase):
            ECMA.`424`.Members.object([("phase", phase.json)])
        case .custom(let name, let description):
            ECMA.`424`.Members.object([
                ("name", .string(name)),
                ("description", ECMA.`424`.Members.text(description)),
            ])
        }
    }
}
