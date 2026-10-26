extension ECMA_424.Metadata {
    public enum Tools: Sendable, Hashable {
        case components([ECMA_424.Component])
        case legacy([ECMA_424.Tool])
    }
}
