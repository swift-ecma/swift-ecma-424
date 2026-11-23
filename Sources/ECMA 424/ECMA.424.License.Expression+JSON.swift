import ISO_5962_License_Expression
public import RFC_8259

extension ECMA.`424`.License.Expression {
    static let keys: Set<String> = ["expression", "expressionDetails", "acknowledgement", "bom-ref", "licensing", "properties"]

    public init(json: IETF.RFC.`8259`.Value) throws(ECMA.`424`.Error) {
        let members = try ECMA.`424`.Members(json, known: Self.keys)
        guard let value = try members.value("expression", Self.expression) else { throw .missing("expression") }
        self.init(
            value,
            reference: try members.value("bom-ref", ECMA.`424`.Reference.init(json:)),
            acknowledgement: try members.value("acknowledgement", ECMA.`424`.License.Acknowledgement.init(json:)),
            properties: try members.values("properties", ECMA.`424`.Property.init(json:))
        )
    }

    static func expression(_ json: IETF.RFC.`8259`.Value) throws(ECMA.`424`.Error) -> ISO.`5962`.Expression {
        guard let text = json.string else { throw .malformed }
        do throws(ISO.`5962`.Expression.Error) {
            return try ISO.`5962`.Expression(text)
        } catch {
            throw .malformed
        }
    }

    public var json: IETF.RFC.`8259`.Value {
        ECMA.`424`.Members.object([
            ("expression", .string(value.description)),
            ("acknowledgement", acknowledgement?.json),
            ("bom-ref", reference?.json),
            ("properties", ECMA.`424`.Members.array(properties.map(\.json))),
        ])
    }
}
