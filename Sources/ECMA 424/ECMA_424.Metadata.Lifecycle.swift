extension ECMA_424.Metadata {
    public enum Lifecycle: Sendable, Hashable {
        case phase(ECMA_424.Metadata.Lifecycle.Phase)
        case custom(name: String, description: String?)
    }
}
