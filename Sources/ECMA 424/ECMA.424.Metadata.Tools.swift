extension ECMA.`424`.Metadata {
    public enum Tools: Sendable, Hashable {
        case components([ECMA.`424`.Component])
        case legacy([ECMA.`424`.Tool])
    }
}
