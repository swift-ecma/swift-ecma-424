# swift-ecma-424

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Swift implementation of ECMA-424, the CycloneDX Bill of Materials specification.

## Overview

ECMA-424 2nd edition (December 2025) standardises CycloneDX 1.7. This package models the software bill of materials (SBOM) part of its JSON format: the BOM, its metadata, components, hashes, licenses, external references, dependencies and properties. Each type reads from and writes to an `RFC_8259.Value`, and reading refuses what the CycloneDX 1.7 JSON schema refuses for the modelled members: a missing required member, a value outside an enumeration, a malformed serial number, timestamp or digest, a duplicate where the schema demands unique items, and a member the schema does not define.

```swift
import ECMA_424

let bom = try ECMA_424.BOM(json: value)
bom.serialNumber             // RFC_4122.UUID
bom.metadata?.timestamp      // RFC_3339.DateTime
bom.components.first?.hashes // [ECMA_424.Hash]
try ECMA_424.BOM(json: bom.json) == bom
```

Timestamps are `RFC_3339.DateTime`, serial numbers `RFC_4122.UUID`, URLs `RFC_3986.URI`, and digests are bytes, so a `FIPS_180_4.Digest`'s `bytes` can be used as an `ECMA_424.Hash`'s content directly.

## What is left out

Members the schema defines but this package does not model are accepted and dropped when read: services, vulnerabilities, compositions, annotations, formulation, declarations, definitions, citations and signatures; and on components pedigree, evidence, SWID tags, release notes, model cards, data, cryptographic properties, patent assertions, the external-component markers and the deprecated `author` and `modified` members.

License expressions are `ISO_5962.Expression`, the SPDX license expression grammar from swift-iso-5962's `ISO 5962 License Expression` product, because CycloneDX defines `expression` as an SPDX license expression. License identifiers are kept as text: the SPDX license list is a separately released data set and is not modelled. The package URL (purl) grammar of ECMA-427 is not modelled yet. Email addresses and media types are kept as text. URLs are read as RFC 3986 URI references, so an IRI with non-ASCII characters is refused.

The tests transliterate the CycloneDX 1.7 conformance documents from the CycloneDX specification repository (Apache 2.0).

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
