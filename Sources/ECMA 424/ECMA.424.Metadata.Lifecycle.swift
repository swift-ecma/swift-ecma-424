extension ECMA.`424`.Metadata {
    public enum Lifecycle: Sendable, Hashable {
        case phase(ECMA.`424`.Metadata.Lifecycle.Phase)
        case custom(name: String, description: String?)
    }
}
