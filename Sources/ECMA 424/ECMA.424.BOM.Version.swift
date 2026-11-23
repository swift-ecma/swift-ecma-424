public import Cardinal

extension ECMA.`424`.BOM {
    public struct Version: Sendable, Hashable {
        public let count: Cardinal

        public init(_ count: Cardinal) throws(ECMA.`424`.Error) {
            guard count >= .one else { throw .invalid("version") }
            self.init(count: count)
        }

        private init(count: Cardinal) {
            self.count = count
        }
    }
}

extension ECMA.`424`.BOM.Version {
    public static var first: Self { Self(count: .one) }

    public func successor() -> Self {
        Self(count: count + .one)
    }
}
