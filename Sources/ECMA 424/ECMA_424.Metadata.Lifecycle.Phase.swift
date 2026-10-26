extension ECMA_424.Metadata.Lifecycle {
    public enum Phase: String, Sendable, Hashable, CaseIterable {
        case design
        case preBuild = "pre-build"
        case build
        case postBuild = "post-build"
        case operations
        case discovery
        case decommission
    }
}
