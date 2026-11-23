public import ECMA_427

extension ECMA.`424` {
    public struct Component: Sendable, Hashable {
        public let kind: ECMA.`424`.Component.Kind
        public let mime: String?
        public let reference: ECMA.`424`.Reference?
        public let supplier: ECMA.`424`.Organization?
        public let manufacturer: ECMA.`424`.Organization?
        public let authors: [ECMA.`424`.Organization.Contact]
        public let publisher: String?
        public let group: String?
        public let name: String
        // swift-linter:disable:next raw concept
        // REASON: CycloneDX leaves a component's version free-form, often a hash or a date; looked at Version.Semantic and Version.Tools, which would refuse real BOMs.
        public let version: String?
        public let description: String?
        public let scope: ECMA.`424`.Component.Scope?
        public let hashes: [ECMA.`424`.Hash]
        public let licenses: [ECMA.`424`.License.Choice]
        public let copyright: String?
        public let cpe: String?
        public let purl: ECMA.`427`.PURL?
        public let omnibor: [String]
        public let swhid: [String]
        public let externalReferences: [ECMA.`424`.Reference.External]
        public let components: [ECMA.`424`.Component]
        public let properties: [ECMA.`424`.Property]
        public let tags: [String]

        public init(
            kind: ECMA.`424`.Component.Kind,
            mime: String? = nil,
            reference: ECMA.`424`.Reference? = nil,
            supplier: ECMA.`424`.Organization? = nil,
            manufacturer: ECMA.`424`.Organization? = nil,
            authors: [ECMA.`424`.Organization.Contact] = [],
            publisher: String? = nil,
            group: String? = nil,
            name: String,
            // swift-linter:disable:next raw concept
            // REASON: CycloneDX leaves a component's version free-form, often a hash or a date; looked at Version.Semantic and Version.Tools, which would refuse real BOMs.
            version: String? = nil,
            description: String? = nil,
            scope: ECMA.`424`.Component.Scope? = nil,
            hashes: [ECMA.`424`.Hash] = [],
            licenses: [ECMA.`424`.License.Choice] = [],
            copyright: String? = nil,
            cpe: String? = nil,
            purl: ECMA.`427`.PURL? = nil,
            omnibor: [String] = [],
            swhid: [String] = [],
            externalReferences: [ECMA.`424`.Reference.External] = [],
            components: [ECMA.`424`.Component] = [],
            properties: [ECMA.`424`.Property] = [],
            tags: [String] = []
        ) throws(ECMA.`424`.Error) {
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
            self.components = try ECMA.`424`.Members.distinct(components, "components")
            self.properties = properties
            self.tags = try ECMA.`424`.Members.distinct(tags, "tags")
        }
    }
}
