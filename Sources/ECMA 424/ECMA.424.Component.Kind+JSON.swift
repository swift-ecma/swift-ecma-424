public import RFC_8259

extension ECMA.`424`.Component.Kind {
    public init(json: IETF.RFC.`8259`.Value) throws(ECMA.`424`.Error) {
        guard let text = json.string, let value = Self(rawValue: text) else { throw .malformed }
        self = value
    }

    public var json: IETF.RFC.`8259`.Value { .string(self.rawValue) }
}
