public import RFC_8259

extension ECMA_424.Component {
    static let keys: Set<String> = [
        "type", "mime-type", "bom-ref", "supplier", "manufacturer", "authors", "author", "publisher", "group", "name",
        "version", "versionRange", "isExternal", "description", "scope", "hashes", "licenses", "copyright",
        "patentAssertions", "cpe", "purl", "omniborId", "swhid", "swid", "modified", "pedigree", "externalReferences",
        "components", "evidence", "releaseNotes", "modelCard", "data", "cryptoProperties", "properties", "tags",
        "signature",
    ]

    public init(json: RFC_8259.Value) throws(ECMA_424.Error) {
        let members = try ECMA_424.Members(json, known: Self.keys)
        guard let kind = try members.value("type", Kind.init(json:)) else { throw .missing("type") }
        guard let name = try members.string("name") else { throw .missing("name") }
        try self.init(
            kind: kind,
            mime: try members.string("mime-type"),
            reference: try members.value("bom-ref", ECMA_424.Reference.init(json:)),
            supplier: try members.value("supplier", ECMA_424.Organization.init(json:)),
            manufacturer: try members.value("manufacturer", ECMA_424.Organization.init(json:)),
            authors: try members.values("authors", ECMA_424.Organization.Contact.init(json:)),
            publisher: try members.string("publisher"),
            group: try members.string("group"),
            name: name,
            version: try members.string("version"),
            description: try members.string("description"),
            scope: try members.value("scope", Scope.init(json:)),
            hashes: try members.values("hashes", ECMA_424.Hash.init(json:)),
            licenses: try members.values("licenses", ECMA_424.License.Choice.init(json:)),
            copyright: try members.string("copyright"),
            cpe: try members.string("cpe"),
            purl: try members.string("purl"),
            omnibor: try members.strings("omniborId"),
            swhid: try members.strings("swhid"),
            externalReferences: try members.values("externalReferences", ECMA_424.Reference.External.init(json:)),
            components: try members.unique("components", ECMA_424.Component.init(json:)),
            properties: try members.values("properties", ECMA_424.Property.init(json:)),
            tags: try members.unique("tags") { element throws(ECMA_424.Error) in try ECMA_424.Members.text(element, "tags") }
        )
    }

    public var json: RFC_8259.Value {
        ECMA_424.Members.object([
            ("type", kind.json),
            ("mime-type", ECMA_424.Members.text(mime)),
            ("bom-ref", reference?.json),
            ("supplier", supplier?.json),
            ("manufacturer", manufacturer?.json),
            ("authors", ECMA_424.Members.array(authors.map(\.json))),
            ("publisher", ECMA_424.Members.text(publisher)),
            ("group", ECMA_424.Members.text(group)),
            ("name", .string(name)),
            ("version", ECMA_424.Members.text(version)),
            ("description", ECMA_424.Members.text(description)),
            ("scope", scope?.json),
            ("hashes", ECMA_424.Members.array(hashes.map(\.json))),
            ("licenses", ECMA_424.Members.array(licenses.map(\.json))),
            ("copyright", ECMA_424.Members.text(copyright)),
            ("cpe", ECMA_424.Members.text(cpe)),
            ("purl", ECMA_424.Members.text(purl)),
            ("omniborId", ECMA_424.Members.strings(omnibor)),
            ("swhid", ECMA_424.Members.strings(swhid)),
            ("externalReferences", ECMA_424.Members.array(externalReferences.map(\.json))),
            ("components", ECMA_424.Members.array(components.map(\.json))),
            ("properties", ECMA_424.Members.array(properties.map(\.json))),
            ("tags", ECMA_424.Members.strings(tags)),
        ])
    }
}
