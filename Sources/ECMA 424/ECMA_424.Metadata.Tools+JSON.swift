public import RFC_8259

extension ECMA_424.Metadata.Tools {
    public init(json: RFC_8259.Value) throws(ECMA_424.Error) {
        if let array = json.array {
            self = .legacy(
                try array.map { element throws(ECMA_424.Error) in
                    try ECMA_424.Members.within("tools", element, ECMA_424.Tool.init(json:))
                }
            )
        } else {
            let members = try ECMA_424.Members(json, known: ["components", "services"])
            self = .components(try members.unique("components", ECMA_424.Component.init(json:)))
        }
    }

    public var json: RFC_8259.Value {
        switch self {
        case .components(let components):
            ECMA_424.Members.object([("components", ECMA_424.Members.array(components.map(\.json)))])
        case .legacy(let tools):
            .array(RFC_8259.Array(tools.map(\.json)))
        }
    }
}
