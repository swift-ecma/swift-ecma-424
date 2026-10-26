extension ECMA_424.Hash {
    public enum Algorithm: String, Sendable, Hashable, CaseIterable {
        case md5 = "MD5"
        case sha1 = "SHA-1"
        case sha256 = "SHA-256"
        case sha384 = "SHA-384"
        case sha512 = "SHA-512"
        case sha3_256 = "SHA3-256"
        case sha3_384 = "SHA3-384"
        case sha3_512 = "SHA3-512"
        case blake2b256 = "BLAKE2b-256"
        case blake2b384 = "BLAKE2b-384"
        case blake2b512 = "BLAKE2b-512"
        case blake3 = "BLAKE3"
        case streebog256 = "Streebog-256"
        case streebog512 = "Streebog-512"
    }
}
