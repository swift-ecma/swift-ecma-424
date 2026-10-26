extension ECMA_424.License {
    public enum Choice: Sendable, Hashable {
        case license(ECMA_424.License)
        case expression(ECMA_424.License.Expression)
    }
}
