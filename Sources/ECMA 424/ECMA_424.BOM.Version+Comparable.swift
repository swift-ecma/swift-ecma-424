extension ECMA_424.BOM.Version: Comparable {
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.count < rhs.count
    }
}
