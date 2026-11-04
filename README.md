# swift-ecma-424

Use this package when you need to read, check or write a CycloneDX 1.7 software bill of materials in JSON, the format ECMA-424 standardises. Start from `ECMA_424.BOM`, which you read with `ECMA_424.BOM.init(json:)` and write with `ECMA_424.BOM.json`. It works on `RFC_8259.Value`, so parse and serialize the JSON text with a JSON library. If you only need package URLs, use swift-ecma-427. If you only need SPDX license expressions, use swift-iso-5962.

## Laws

- Reading refuses any member the CycloneDX 1.7 schema doesn't define. Members the schema defines but this package doesn't model, such as `services`, `vulnerabilities` or a component's `pedigree`, are accepted and dropped, so they are gone after a round trip.
- `bomFormat` must be exactly `CycloneDX`. `specVersion` is required, but it is kept as read and not checked against `1.7`.
- A missing `version` reads as 1, and `version` is always written, even when it is 1. A version below 1 is refused.
- `serialNumber` is `urn:uuid:` followed by a UUID in lowercase canonical form. An uppercase UUID is refused.
- `components` at every level, `dependencies`, a component's `tags`, and a dependency's `dependsOn` and `provides` may not hold two equal elements. This is checked both when reading and when building a value.
- An empty array is not written, and an absent array reads as empty.
- Hash content is hexadecimal. Any case is accepted when reading, and it is always written lowercase.
- A license has an SPDX `id` or a `name`, never both. SPDX identifiers are not checked against the SPDX license list, so `Apache-2` is accepted.
- A license entry that holds `license` may hold nothing else. Any other entry is read as an `expression`, which must parse as an SPDX license expression.
- `metadata.tools` is read as the current form, an object of components, when it is an object, and as the legacy array of tools when it is an array. It is written back in the form it was read. `services` in the object form are dropped.
- URLs are IRI references. Relative references and non-ASCII characters are accepted and written back unchanged.
- A timestamp must be a full RFC 3339 date-time. A date alone is refused.
- A failure names the member at fault. A nested value of the wrong JSON kind, or text that doesn't parse, fails with `ECMA_424.Error.invalid(_:)` under the key that holds it. Only a document that is not an object fails with `ECMA_424.Error.malformed`.
