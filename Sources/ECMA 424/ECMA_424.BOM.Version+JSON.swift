import Cardinal
public import RFC_8259

extension ECMA_424.BOM.Version {
    public init(json: RFC_8259.Value) throws(ECMA_424.Error) {
        guard let number = json.number?.int else { throw .malformed }
        let count: Cardinal
        do throws(Cardinal.Error) {
            count = try Cardinal(number)
        } catch {
            throw .malformed
        }
        try self.init(count)
    }

    public var json: RFC_8259.Value { .number(RFC_8259.Number(Int(clamping: count))) }
}
