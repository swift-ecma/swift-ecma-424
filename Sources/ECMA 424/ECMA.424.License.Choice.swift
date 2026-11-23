extension ECMA.`424`.License {
    public enum Choice: Sendable, Hashable {
        case license(ECMA.`424`.License)
        case expression(ECMA.`424`.License.Expression)
    }
}
