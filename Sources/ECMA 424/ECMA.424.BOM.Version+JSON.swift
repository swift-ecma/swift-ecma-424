import Cardinal
public import RFC_8259

extension ECMA.`424`.BOM.Version {
    public init(json: IETF.RFC.`8259`.Value) throws(ECMA.`424`.Error) {
        guard let number = json.number?.int else { throw .malformed }
        let count: Cardinal
        do throws(Cardinal.Error) {
            count = try Cardinal(number)
        } catch {
            throw .malformed
        }
        try self.init(count)
    }

    public var json: IETF.RFC.`8259`.Value { .number(IETF.RFC.`8259`.Number(Int(clamping: count))) }
}
