import ECMA_427
public import RFC_8259

extension ECMA.`424`.Component {
    static let keys: Set<String> = [
        "type", "mime-type", "bom-ref", "supplier", "manufacturer", "authors", "author", "publisher", "group", "name",
        "version", "versionRange", "isExternal", "description", "scope", "hashes", "licenses", "copyright",
        "patentAssertions", "cpe", "purl", "omniborId", "swhid", "swid", "modified", "pedigree", "externalReferences",
        "components", "evidence", "releaseNotes", "modelCard", "data", "cryptoProperties", "properties", "tags",
        "signature",
    ]

    public init(json: IETF.RFC.`8259`.Value) throws(ECMA.`424`.Error) {
        let members = try ECMA.`424`.Members(json, known: Self.keys)
        guard let kind = try members.value("type", Kind.init(json:)) else { throw .missing("type") }
        guard let name = try members.string("name") else { throw .missing("name") }
        try self.init(
            kind: kind,
            mime: try members.string("mime-type"),
            reference: try members.value("bom-ref", ECMA.`424`.Reference.init(json:)),
            supplier: try members.value("supplier", ECMA.`424`.Organization.init(json:)),
            manufacturer: try members.value("manufacturer", ECMA.`424`.Organization.init(json:)),
            authors: try members.values("authors", ECMA.`424`.Organization.Contact.init(json:)),
            publisher: try members.string("publisher"),
            group: try members.string("group"),
            name: name,
            version: try members.string("version"),
            description: try members.string("description"),
            scope: try members.value("scope", Scope.init(json:)),
            hashes: try members.values("hashes", ECMA.`424`.Hash.init(json:)),
            licenses: try members.values("licenses", ECMA.`424`.License.Choice.init(json:)),
            copyright: try members.string("copyright"),
            cpe: try members.string("cpe"),
            purl: try members.value("purl", Self.identifier),
            omnibor: try members.strings("omniborId"),
            swhid: try members.strings("swhid"),
            externalReferences: try members.values("externalReferences", ECMA.`424`.Reference.External.init(json:)),
            components: try members.unique("components", ECMA.`424`.Component.init(json:)),
            properties: try members.values("properties", ECMA.`424`.Property.init(json:)),
            tags: try members.unique("tags") { element throws(ECMA.`424`.Error) in try ECMA.`424`.Members.text(element, "tags") }
        )
    }

    static func identifier(_ json: IETF.RFC.`8259`.Value) throws(ECMA.`424`.Error) -> ECMA.`427`.PURL {
        guard let text = json.string else { throw .malformed }
        do throws(ECMA.`427`.Error) {
            return try ECMA.`427`.PURL(text)
        } catch {
            throw .malformed
        }
    }

    public var json: IETF.RFC.`8259`.Value {
        ECMA.`424`.Members.object([
            ("type", kind.json),
            ("mime-type", ECMA.`424`.Members.text(mime)),
            ("bom-ref", reference?.json),
            ("supplier", supplier?.json),
            ("manufacturer", manufacturer?.json),
            ("authors", ECMA.`424`.Members.array(authors.map(\.json))),
            ("publisher", ECMA.`424`.Members.text(publisher)),
            ("group", ECMA.`424`.Members.text(group)),
            ("name", .string(name)),
            ("version", ECMA.`424`.Members.text(version)),
            ("description", ECMA.`424`.Members.text(description)),
            ("scope", scope?.json),
            ("hashes", ECMA.`424`.Members.array(hashes.map(\.json))),
            ("licenses", ECMA.`424`.Members.array(licenses.map(\.json))),
            ("copyright", ECMA.`424`.Members.text(copyright)),
            ("cpe", ECMA.`424`.Members.text(cpe)),
            ("purl", ECMA.`424`.Members.text(purl?.description)),
            ("omniborId", ECMA.`424`.Members.strings(omnibor)),
            ("swhid", ECMA.`424`.Members.strings(swhid)),
            ("externalReferences", ECMA.`424`.Members.array(externalReferences.map(\.json))),
            ("components", ECMA.`424`.Members.array(components.map(\.json))),
            ("properties", ECMA.`424`.Members.array(properties.map(\.json))),
            ("tags", ECMA.`424`.Members.strings(tags)),
        ])
    }
}
