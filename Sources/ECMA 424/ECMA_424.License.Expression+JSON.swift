import ISO_5962_License_Expression
public import RFC_8259

extension ECMA_424.License.Expression {
    static let keys: Set<String> = ["expression", "expressionDetails", "acknowledgement", "bom-ref", "licensing", "properties"]

    public init(json: RFC_8259.Value) throws(ECMA_424.Error) {
        let members = try ECMA_424.Members(json, known: Self.keys)
        guard let value = try members.value("expression", Self.expression) else { throw .missing("expression") }
        self.init(
            value,
            reference: try members.value("bom-ref", ECMA_424.Reference.init(json:)),
            acknowledgement: try members.value("acknowledgement", ECMA_424.License.Acknowledgement.init(json:)),
            properties: try members.values("properties", ECMA_424.Property.init(json:))
        )
    }

    static func expression(_ json: RFC_8259.Value) throws(ECMA_424.Error) -> ISO_5962.Expression {
        guard let text = json.string else { throw .malformed }
        do throws(ISO_5962.Expression.Error) {
            return try ISO_5962.Expression(text)
        } catch {
            throw .malformed
        }
    }

    public var json: RFC_8259.Value {
        ECMA_424.Members.object([
            ("expression", .string(value.description)),
            ("acknowledgement", acknowledgement?.json),
            ("bom-ref", reference?.json),
            ("properties", ECMA_424.Members.array(properties.map(\.json))),
        ])
    }
}
