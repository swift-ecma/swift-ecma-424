public import Cardinal

extension ECMA_424.BOM {
    public struct Version: Sendable, Hashable {
        public let count: Cardinal

        public init(_ count: Cardinal) throws(ECMA_424.Error) {
            guard count >= .one else { throw .invalid("version") }
            self.init(count: count)
        }

        private init(count: Cardinal) {
            self.count = count
        }
    }
}

extension ECMA_424.BOM.Version {
    public static var first: Self { Self(count: .one) }

    public func successor() -> Self {
        Self(count: count + .one)
    }
}
