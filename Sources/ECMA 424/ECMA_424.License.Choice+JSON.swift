public import RFC_8259

extension ECMA_424.License.Choice {
    public init(json: RFC_8259.Value) throws(ECMA_424.Error) {
        guard let object = json.object else { throw .malformed }
        if object["license"] != nil {
            let members = try ECMA_424.Members(json, known: ["license"])
            guard let license = try members.value("license", ECMA_424.License.init(json:)) else {
                throw .missing("license")
            }
            self = .license(license)
        } else {
            self = .expression(try ECMA_424.License.Expression(json: json))
        }
    }

    public var json: RFC_8259.Value {
        switch self {
        case .license(let license): ECMA_424.Members.object([("license", license.json)])
        case .expression(let expression): expression.json
        }
    }
}
