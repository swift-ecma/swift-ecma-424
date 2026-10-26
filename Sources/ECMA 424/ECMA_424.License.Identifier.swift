extension ECMA_424.License {
    public enum Identifier: Sendable, Hashable {
        case spdx(String)
        case name(String)
    }
}
