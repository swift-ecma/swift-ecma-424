import Binary
import Byte
import RFC_3986
import RFC_8259

extension ECMA_424 {
    struct Members {
        let object: RFC_8259.Object

        init(_ json: RFC_8259.Value, known: Swift::Set<Swift::String>) throws(ECMA_424.Error) {
            guard let object = json.object else { throw .malformed }
            if let unknown = object.keys.first(where: { !known.contains($0) }) {
                throw .unexpected(unknown)
            }
            self.object = object
        }
    }
}

extension ECMA_424.Members {
    func string(_ key: String) throws(ECMA_424.Error) -> String? {
        guard let member = object[key] else { return nil }
        guard let text = member.string else { throw .invalid(key) }
        return text
    }

    func integer(_ key: String) throws(ECMA_424.Error) -> Int? {
        guard let member = object[key] else { return nil }
        guard let number = member.number?.int else { throw .invalid(key) }
        return number
    }

    func uri(_ key: String) throws(ECMA_424.Error) -> RFC_3986.URI? {
        try value(key, Self.uri)
    }

    func value<Value>(
        _ key: String,
        _ decode: (RFC_8259.Value) throws(ECMA_424.Error) -> Value
    ) throws(ECMA_424.Error) -> Value? {
        guard let member = object[key] else { return nil }
        return try Self.within(key, member, decode)
    }

    func values<Value>(
        _ key: String,
        _ decode: (RFC_8259.Value) throws(ECMA_424.Error) -> Value
    ) throws(ECMA_424.Error) -> [Value] {
        guard let member = object[key] else { return [] }
        guard let array = member.array else { throw .invalid(key) }
        return try array.map { element throws(ECMA_424.Error) in
            try Self.within(key, element, decode)
        }
    }

    func unique<Value: Hashable>(
        _ key: String,
        _ decode: (RFC_8259.Value) throws(ECMA_424.Error) -> Value
    ) throws(ECMA_424.Error) -> [Value] {
        let elements = try values(key, decode)
        return try Self.distinct(elements, key)
    }

    func strings(_ key: String) throws(ECMA_424.Error) -> [String] {
        try values(key) { element throws(ECMA_424.Error) in try Self.text(element, key) }
    }
}

extension ECMA_424.Members {
    static func within<Value>(
        _ key: String,
        _ json: RFC_8259.Value,
        _ decode: (RFC_8259.Value) throws(ECMA_424.Error) -> Value
    ) throws(ECMA_424.Error) -> Value {
        do throws(ECMA_424.Error) {
            return try decode(json)
        } catch {
            throw error == .malformed ? .invalid(key) : error
        }
    }

    static func text(_ json: RFC_8259.Value, _ key: String) throws(ECMA_424.Error) -> String {
        guard let text = json.string else { throw .invalid(key) }
        return text
    }

    static func uri(_ json: RFC_8259.Value) throws(ECMA_424.Error) -> RFC_3986.URI {
        guard let text = json.string else { throw .malformed }
        do throws(RFC_3986.Error) {
            return try RFC_3986.URI(text)
        } catch {
            throw .malformed
        }
    }

    static func distinct<Value: Hashable>(
        _ elements: [Value],
        _ key: String
    ) throws(ECMA_424.Error) -> [Value] {
        guard Swift::Set(elements).count == elements.count else { throw .duplicate(key) }
        return elements
    }
}

extension ECMA_424.Members {
    static let alphabet: [Byte] = "0123456789abcdef".utf8.map(Byte.init(bitPattern:))

    static func bytes(_ text: String, _ key: String) throws(ECMA_424.Error) -> [Byte] {
        guard let bytes = Binary.Base.`16`.decode(text.lowercased(), alphabet: alphabet) else {
            throw .invalid(key)
        }
        return bytes
    }

    static func hex(_ bytes: [Byte]) -> String {
        Binary.Base.`16`.encode(bytes, alphabet: alphabet)
    }
}

extension ECMA_424.Members {
    static func object(_ members: [(key: String, value: RFC_8259.Value?)]) -> RFC_8259.Value {
        .object(
            RFC_8259.Object(
                members.compactMap { member in member.value.map { (key: member.key, value: $0) } }
            )
        )
    }

    static func text(_ value: String?) -> RFC_8259.Value? {
        value.map { RFC_8259.Value.string($0) }
    }

    static func array(_ elements: [RFC_8259.Value]) -> RFC_8259.Value? {
        elements.isEmpty ? nil : .array(RFC_8259.Array(elements))
    }

    static func strings(_ elements: [String]) -> RFC_8259.Value? {
        array(elements.map { RFC_8259.Value.string($0) })
    }
}
