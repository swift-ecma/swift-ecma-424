extension ECMA.`424`.Component {
    public enum Scope: String, Sendable, Hashable, CaseIterable {
        case required
        case optional
        case excluded
    }
}
