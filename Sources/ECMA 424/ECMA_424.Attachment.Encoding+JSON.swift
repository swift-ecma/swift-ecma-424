public import RFC_8259

extension ECMA_424.Attachment.Encoding {
    public init(json: RFC_8259.Value) throws(ECMA_424.Error) {
        guard let text = json.string, let value = Self(rawValue: text) else { throw .malformed }
        self = value
    }

    public var json: RFC_8259.Value { .string(self.rawValue) }
}
