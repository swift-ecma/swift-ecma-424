public import RFC_8259

extension ECMA.`424`.License.Choice {
    public init(json: IETF.RFC.`8259`.Value) throws(ECMA.`424`.Error) {
        guard let object = json.object else { throw .malformed }
        if object["license"] != nil {
            let members = try ECMA.`424`.Members(json, known: ["license"])
            guard let license = try members.value("license", ECMA.`424`.License.init(json:)) else {
                throw .missing("license")
            }
            self = .license(license)
        } else {
            self = .expression(try ECMA.`424`.License.Expression(json: json))
        }
    }

    public var json: IETF.RFC.`8259`.Value {
        switch self {
        case .license(let license): ECMA.`424`.Members.object([("license", license.json)])
        case .expression(let expression): expression.json
        }
    }
}
