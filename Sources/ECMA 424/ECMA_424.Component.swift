public import ECMA_427

extension ECMA_424 {
    public struct Component: Sendable, Hashable {
        public let kind: ECMA_424.Component.Kind
        public let mime: String?
        public let reference: ECMA_424.Reference?
        public let supplier: ECMA_424.Organization?
        public let manufacturer: ECMA_424.Organization?
        public let authors: [ECMA_424.Organization.Contact]
        public let publisher: String?
        public let group: String?
        public let name: String
        public let version: String?
        public let description: String?
        public let scope: ECMA_424.Component.Scope?
        public let hashes: [ECMA_424.Hash]
        public let licenses: [ECMA_424.License.Choice]
        public let copyright: String?
        public let cpe: String?
        public let purl: ECMA_427.PURL?
        public let omnibor: [String]
        public let swhid: [String]
        public let externalReferences: [ECMA_424.Reference.External]
        public let components: [ECMA_424.Component]
        public let properties: [ECMA_424.Property]
        public let tags: [String]

        public init(
            kind: ECMA_424.Component.Kind,
            mime: String? = nil,
            reference: ECMA_424.Reference? = nil,
            supplier: ECMA_424.Organization? = nil,
            manufacturer: ECMA_424.Organization? = nil,
            authors: [ECMA_424.Organization.Contact] = [],
            publisher: String? = nil,
            group: String? = nil,
            name: String,
            version: String? = nil,
            description: String? = nil,
            scope: ECMA_424.Component.Scope? = nil,
            hashes: [ECMA_424.Hash] = [],
            licenses: [ECMA_424.License.Choice] = [],
            copyright: String? = nil,
            cpe: String? = nil,
            purl: ECMA_427.PURL? = nil,
            omnibor: [String] = [],
            swhid: [String] = [],
            externalReferences: [ECMA_424.Reference.External] = [],
            components: [ECMA_424.Component] = [],
            properties: [ECMA_424.Property] = [],
            tags: [String] = []
        ) throws(ECMA_424.Error) {
            self.kind = kind
            self.mime = mime
            self.reference = reference
            self.supplier = supplier
            self.manufacturer = manufacturer
            self.authors = authors
            self.publisher = publisher
            self.group = group
            self.name = name
            self.version = version
            self.description = description
            self.scope = scope
            self.hashes = hashes
            self.licenses = licenses
            self.copyright = copyright
            self.cpe = cpe
            self.purl = purl
            self.omnibor = omnibor
            self.swhid = swhid
            self.externalReferences = externalReferences
            self.components = try ECMA_424.Members.distinct(components, "components")
            self.properties = properties
            self.tags = try ECMA_424.Members.distinct(tags, "tags")
        }
    }
}
