public import Byte

extension ECMA.`424` {
    public struct Hash: Sendable, Hashable {
        public let algorithm: ECMA.`424`.Hash.Algorithm
        public let content: [Byte]

        public init(algorithm: ECMA.`424`.Hash.Algorithm, content: [Byte]) throws(ECMA.`424`.Error) {
            guard [16, 20, 32, 48, 64].contains(content.count) else { throw .invalid("content") }
            self.algorithm = algorithm
            self.content = content
        }
    }
}
