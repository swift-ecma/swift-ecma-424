public import RFC_8259

extension ECMA_424.Reference {
    public init(json: IETF.RFC.`8259`.Value) throws(ECMA_424.Error) {
        guard let text = json.string, !text.isEmpty else { throw .malformed }
        self.value = text
    }

    public var json: IETF.RFC.`8259`.Value { .string(value) }
}
