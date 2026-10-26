// Transliterated from the CycloneDX 1.7 conformance suite (CycloneDX/specification, tools/src/test/resources/1.7), Apache-2.0.
import ECMA_424
import RFC_8259

extension ECMA_424.BOM.Test {
    enum Invalid {}
}

extension ECMA_424.BOM.Test.Invalid {
    static let bomformat: RFC_8259.Value = .object(
        RFC_8259.Object([
            ("$schema", .string("http://cyclonedx.org/schema/bom-1.7.schema.json")),
            ("bomFormat", .string("AnotherFormat")),
            ("specVersion", .string("1.7")),
            ("serialNumber", .string("urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79")),
            ("version", .number(RFC_8259.Number(1))),
            ("components", .array(RFC_8259.Array([]))),
        ])
    )

    static let componentRef: RFC_8259.Value = .object(
        RFC_8259.Object([
            ("$schema", .string("http://cyclonedx.org/schema/bom-1.7.schema.json")),
            ("bomFormat", .string("CycloneDX")),
            ("specVersion", .string("1.7")),
            ("serialNumber", .string("urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79")),
            ("version", .number(RFC_8259.Number(1))),
            (
                "components",
                .array(
                    RFC_8259.Array([
                        .object(
                            RFC_8259.Object([
                                ("type", .string("library")),
                                ("bom-ref", .string("123")),
                                ("name", .string("acme-library")),
                                ("version", .string("1.0.0")),
                            ])
                        ),
                        .object(
                            RFC_8259.Object([
                                ("type", .string("library")),
                                ("bom-ref", .string("")),
                                ("name", .string("acme-library")),
                                ("version", .string("1.0.0")),
                            ])
                        ),
                    ])
                )
            ),
        ])
    )

    static let componentType: RFC_8259.Value = .object(
        RFC_8259.Object([
            ("$schema", .string("http://cyclonedx.org/schema/bom-1.7.schema.json")),
            ("bomFormat", .string("CycloneDX")),
            ("specVersion", .string("1.7")),
            ("serialNumber", .string("urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79")),
            ("version", .number(RFC_8259.Number(1))),
            (
                "components",
                .array(
                    RFC_8259.Array([
                        .object(
                            RFC_8259.Object([
                                ("type", .string("foo")),
                                ("name", .string("acme-library")),
                                ("version", .string("1.0.0")),
                            ])
                        )
                    ])
                )
            ),
        ])
    )

    static let dependency: RFC_8259.Value = .object(
        RFC_8259.Object([
            ("$schema", .string("http://cyclonedx.org/schema/bom-1.7.schema.json")),
            ("bomFormat", .string("CycloneDX")),
            ("specVersion", .string("1.7")),
            ("serialNumber", .string("urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79")),
            ("version", .number(RFC_8259.Number(1))),
            (
                "components",
                .array(
                    RFC_8259.Array([
                        .object(
                            RFC_8259.Object([
                                ("bom-ref", .string("library-a")),
                                ("type", .string("library")),
                                ("name", .string("library-a")),
                                ("version", .string("1.0.0")),
                            ])
                        ),
                        .object(
                            RFC_8259.Object([
                                ("bom-ref", .string("library-b")),
                                ("type", .string("library")),
                                ("name", .string("library-b")),
                                ("version", .string("1.0.0")),
                            ])
                        ),
                        .object(
                            RFC_8259.Object([
                                ("bom-ref", .string("library-c")),
                                ("type", .string("library")),
                                ("name", .string("library-c")),
                                ("version", .string("1.0.0")),
                            ])
                        ),
                    ])
                )
            ),
            (
                "dependencies",
                .array(
                    RFC_8259.Array([
                        .object(
                            RFC_8259.Object([
                                ("dependsOn", .array(RFC_8259.Array([])))
                            ])
                        ),
                        .object(
                            RFC_8259.Object([
                                ("ref", .string("")),
                                (
                                    "dependsOn",
                                    .array(
                                        RFC_8259.Array([
                                            .string("library-a")
                                        ])
                                    )
                                ),
                            ])
                        ),
                        .object(
                            RFC_8259.Object([
                                ("ref", .string("library-b")),
                                (
                                    "dependsOn",
                                    .array(
                                        RFC_8259.Array([
                                            .string("library-c")
                                        ])
                                    )
                                ),
                            ])
                        ),
                    ])
                )
            ),
        ])
    )

    static let emptyComponent: RFC_8259.Value = .object(
        RFC_8259.Object([
            ("$schema", .string("http://cyclonedx.org/schema/bom-1.7.schema.json")),
            ("bomFormat", .string("CycloneDX")),
            ("specVersion", .string("1.7")),
            ("serialNumber", .string("urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79")),
            ("version", .number(RFC_8259.Number(1))),
            (
                "components",
                .array(
                    RFC_8259.Array([
                        .object(
                            RFC_8259.Object([
                                ("type", .string("library"))
                            ])
                        )
                    ])
                )
            ),
        ])
    )

    static let hashAlg: RFC_8259.Value = .object(
        RFC_8259.Object([
            ("$schema", .string("http://cyclonedx.org/schema/bom-1.7.schema.json")),
            ("bomFormat", .string("CycloneDX")),
            ("specVersion", .string("1.7")),
            ("serialNumber", .string("urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79")),
            ("version", .number(RFC_8259.Number(1))),
            (
                "components",
                .array(
                    RFC_8259.Array([
                        .object(
                            RFC_8259.Object([
                                ("type", .string("library")),
                                ("name", .string("acme-library")),
                                ("version", .string("1.0.0")),
                                ("scope", .string("required")),
                                (
                                    "hashes",
                                    .array(
                                        RFC_8259.Array([
                                            .object(
                                                RFC_8259.Object([
                                                    ("alg", .string("FOO")),
                                                    ("content", .string("3942447fac867ae5cdb3229b658f4d48")),
                                                ])
                                            ),
                                            .object(
                                                RFC_8259.Object([
                                                    ("alg", .string("SHA-1")),
                                                    ("content", .string("e6b1000b94e835ffd37f4c6dcbdad43f4b48a02a")),
                                                ])
                                            ),
                                            .object(
                                                RFC_8259.Object([
                                                    ("alg", .string("SHA-256")),
                                                    ("content", .string("f498a8ff2dd007e29c2074f5e4b01a9a01775c3ff3aeaf6906ea503bc5791b7b")),
                                                ])
                                            ),
                                            .object(
                                                RFC_8259.Object([
                                                    ("alg", .string("SHA-512")),
                                                    (
                                                        "content",
                                                        .string("e8f33e424f3f4ed6db76a482fde1a5298970e442c531729119e37991884bdffab4f9426b7ee11fccd074eeda0634d71697d6f88a460dce0ac8d627a29f7d1282")
                                                    ),
                                                ])
                                            ),
                                        ])
                                    )
                                ),
                            ])
                        )
                    ])
                )
            ),
        ])
    )

    static let hashMd5: RFC_8259.Value = .object(
        RFC_8259.Object([
            ("$schema", .string("http://cyclonedx.org/schema/bom-1.7.schema.json")),
            ("bomFormat", .string("CycloneDX")),
            ("specVersion", .string("1.7")),
            ("serialNumber", .string("urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79")),
            ("version", .number(RFC_8259.Number(1))),
            (
                "components",
                .array(
                    RFC_8259.Array([
                        .object(
                            RFC_8259.Object([
                                ("type", .string("library")),
                                ("name", .string("acme-library")),
                                ("version", .string("1.0.0")),
                                ("scope", .string("required")),
                                (
                                    "hashes",
                                    .array(
                                        RFC_8259.Array([
                                            .object(
                                                RFC_8259.Object([
                                                    ("alg", .string("MD5")),
                                                    ("content", .string("foo")),
                                                ])
                                            ),
                                            .object(
                                                RFC_8259.Object([
                                                    ("alg", .string("SHA-1")),
                                                    ("content", .string("e6b1000b94e835ffd37f4c6dcbdad43f4b48a02a")),
                                                ])
                                            ),
                                            .object(
                                                RFC_8259.Object([
                                                    ("alg", .string("SHA-256")),
                                                    ("content", .string("f498a8ff2dd007e29c2074f5e4b01a9a01775c3ff3aeaf6906ea503bc5791b7b")),
                                                ])
                                            ),
                                            .object(
                                                RFC_8259.Object([
                                                    ("alg", .string("SHA-512")),
                                                    (
                                                        "content",
                                                        .string("e8f33e424f3f4ed6db76a482fde1a5298970e442c531729119e37991884bdffab4f9426b7ee11fccd074eeda0634d71697d6f88a460dce0ac8d627a29f7d1282")
                                                    ),
                                                ])
                                            ),
                                        ])
                                    )
                                ),
                            ])
                        )
                    ])
                )
            ),
        ])
    )

    static let hashSha1: RFC_8259.Value = .object(
        RFC_8259.Object([
            ("$schema", .string("http://cyclonedx.org/schema/bom-1.7.schema.json")),
            ("bomFormat", .string("CycloneDX")),
            ("specVersion", .string("1.7")),
            ("serialNumber", .string("urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79")),
            ("version", .number(RFC_8259.Number(1))),
            (
                "components",
                .array(
                    RFC_8259.Array([
                        .object(
                            RFC_8259.Object([
                                ("type", .string("library")),
                                ("name", .string("acme-library")),
                                ("version", .string("1.0.0")),
                                ("scope", .string("required")),
                                (
                                    "hashes",
                                    .array(
                                        RFC_8259.Array([
                                            .object(
                                                RFC_8259.Object([
                                                    ("alg", .string("MD5")),
                                                    ("content", .string("3942447fac867ae5cdb3229b658f4d48")),
                                                ])
                                            ),
                                            .object(
                                                RFC_8259.Object([
                                                    ("alg", .string("SHA-1")),
                                                    ("content", .string("foo")),
                                                ])
                                            ),
                                            .object(
                                                RFC_8259.Object([
                                                    ("alg", .string("SHA-256")),
                                                    ("content", .string("f498a8ff2dd007e29c2074f5e4b01a9a01775c3ff3aeaf6906ea503bc5791b7b")),
                                                ])
                                            ),
                                            .object(
                                                RFC_8259.Object([
                                                    ("alg", .string("SHA-512")),
                                                    (
                                                        "content",
                                                        .string("e8f33e424f3f4ed6db76a482fde1a5298970e442c531729119e37991884bdffab4f9426b7ee11fccd074eeda0634d71697d6f88a460dce0ac8d627a29f7d1282")
                                                    ),
                                                ])
                                            ),
                                        ])
                                    )
                                ),
                            ])
                        )
                    ])
                )
            ),
        ])
    )

    static let hashSha256: RFC_8259.Value = .object(
        RFC_8259.Object([
            ("$schema", .string("http://cyclonedx.org/schema/bom-1.7.schema.json")),
            ("bomFormat", .string("CycloneDX")),
            ("specVersion", .string("1.7")),
            ("serialNumber", .string("urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79")),
            ("version", .number(RFC_8259.Number(1))),
            (
                "components",
                .array(
                    RFC_8259.Array([
                        .object(
                            RFC_8259.Object([
                                ("type", .string("library")),
                                ("name", .string("acme-library")),
                                ("version", .string("1.0.0")),
                                ("scope", .string("required")),
                                (
                                    "hashes",
                                    .array(
                                        RFC_8259.Array([
                                            .object(
                                                RFC_8259.Object([
                                                    ("alg", .string("MD5")),
                                                    ("content", .string("3942447fac867ae5cdb3229b658f4d48")),
                                                ])
                                            ),
                                            .object(
                                                RFC_8259.Object([
                                                    ("alg", .string("SHA-1")),
                                                    ("content", .string("e6b1000b94e835ffd37f4c6dcbdad43f4b48a02a")),
                                                ])
                                            ),
                                            .object(
                                                RFC_8259.Object([
                                                    ("alg", .string("SHA-256")),
                                                    ("content", .string("foo")),
                                                ])
                                            ),
                                            .object(
                                                RFC_8259.Object([
                                                    ("alg", .string("SHA-512")),
                                                    (
                                                        "content",
                                                        .string("e8f33e424f3f4ed6db76a482fde1a5298970e442c531729119e37991884bdffab4f9426b7ee11fccd074eeda0634d71697d6f88a460dce0ac8d627a29f7d1282")
                                                    ),
                                                ])
                                            ),
                                        ])
                                    )
                                ),
                            ])
                        )
                    ])
                )
            ),
        ])
    )

    static let hashSha512: RFC_8259.Value = .object(
        RFC_8259.Object([
            ("$schema", .string("http://cyclonedx.org/schema/bom-1.7.schema.json")),
            ("bomFormat", .string("CycloneDX")),
            ("specVersion", .string("1.7")),
            ("serialNumber", .string("urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79")),
            ("version", .number(RFC_8259.Number(1))),
            (
                "components",
                .array(
                    RFC_8259.Array([
                        .object(
                            RFC_8259.Object([
                                ("type", .string("library")),
                                ("name", .string("acme-library")),
                                ("version", .string("1.0.0")),
                                ("scope", .string("required")),
                                (
                                    "hashes",
                                    .array(
                                        RFC_8259.Array([
                                            .object(
                                                RFC_8259.Object([
                                                    ("alg", .string("MD5")),
                                                    ("content", .string("3942447fac867ae5cdb3229b658f4d48")),
                                                ])
                                            ),
                                            .object(
                                                RFC_8259.Object([
                                                    ("alg", .string("SHA-1")),
                                                    ("content", .string("e6b1000b94e835ffd37f4c6dcbdad43f4b48a02a")),
                                                ])
                                            ),
                                            .object(
                                                RFC_8259.Object([
                                                    ("alg", .string("SHA-256")),
                                                    ("content", .string("f498a8ff2dd007e29c2074f5e4b01a9a01775c3ff3aeaf6906ea503bc5791b7b")),
                                                ])
                                            ),
                                            .object(
                                                RFC_8259.Object([
                                                    ("alg", .string("SHA-512")),
                                                    ("content", .string("foo")),
                                                ])
                                            ),
                                        ])
                                    )
                                ),
                            ])
                        )
                    ])
                )
            ),
        ])
    )

    static let licenseChoice: RFC_8259.Value = .object(
        RFC_8259.Object([
            ("$schema", .string("http://cyclonedx.org/schema/bom-1.7.schema.json")),
            ("bomFormat", .string("CycloneDX")),
            ("specVersion", .string("1.7")),
            ("serialNumber", .string("urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79")),
            ("version", .number(RFC_8259.Number(1))),
            (
                "components",
                .array(
                    RFC_8259.Array([
                        .object(
                            RFC_8259.Object([
                                ("type", .string("library")),
                                ("publisher", .string("Acme Inc")),
                                ("group", .string("com.acme")),
                                ("name", .string("tomcat-catalina")),
                                ("version", .string("9.0.14")),
                                (
                                    "licenses",
                                    .array(
                                        RFC_8259.Array([
                                            .object(
                                                RFC_8259.Object([
                                                    ("expression", .string("EPL-2.0 OR GPL-2.0 WITH Classpath-exception-2.0")),
                                                    (
                                                        "license",
                                                        .object(
                                                            RFC_8259.Object([
                                                                ("name", .string("Apache License 2.0"))
                                                            ])
                                                        )
                                                    ),
                                                ])
                                            )
                                        ])
                                    )
                                ),
                            ])
                        )
                    ])
                )
            ),
        ])
    )

    static let licenseId: RFC_8259.Value = .object(
        RFC_8259.Object([
            ("$schema", .string("http://cyclonedx.org/schema/bom-1.7.schema.json")),
            ("bomFormat", .string("CycloneDX")),
            ("specVersion", .string("1.7")),
            ("serialNumber", .string("urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79")),
            ("version", .number(RFC_8259.Number(1))),
            (
                "components",
                .array(
                    RFC_8259.Array([
                        .object(
                            RFC_8259.Object([
                                ("type", .string("library")),
                                ("publisher", .string("Acme Inc")),
                                ("group", .string("com.acme")),
                                ("name", .string("tomcat-catalina")),
                                ("version", .string("9.0.14")),
                                (
                                    "licenses",
                                    .array(
                                        RFC_8259.Array([
                                            .object(
                                                RFC_8259.Object([
                                                    (
                                                        "license",
                                                        .object(
                                                            RFC_8259.Object([
                                                                ("id", .string("Apache-2"))
                                                            ])
                                                        )
                                                    )
                                                ])
                                            )
                                        ])
                                    )
                                ),
                            ])
                        )
                    ])
                )
            ),
        ])
    )

    static let licenseMissingIdAndName: RFC_8259.Value = .object(
        RFC_8259.Object([
            ("$schema", .string("http://cyclonedx.org/schema/bom-1.7.schema.json")),
            ("bomFormat", .string("CycloneDX")),
            ("specVersion", .string("1.7")),
            ("serialNumber", .string("urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79")),
            ("version", .number(RFC_8259.Number(1))),
            (
                "components",
                .array(
                    RFC_8259.Array([
                        .object(
                            RFC_8259.Object([
                                ("type", .string("library")),
                                ("name", .string("license-with-no-id-nor-name")),
                                ("version", .string("23")),
                                ("description", .string("testcase for issue#288")),
                                (
                                    "licenses",
                                    .array(
                                        RFC_8259.Array([
                                            .object(
                                                RFC_8259.Object([
                                                    ("license", .object(RFC_8259.Object([])))
                                                ])
                                            )
                                        ])
                                    )
                                ),
                            ])
                        )
                    ])
                )
            ),
        ])
    )

    static let metadataTimestamp: RFC_8259.Value = .object(
        RFC_8259.Object([
            ("$schema", .string("http://cyclonedx.org/schema/bom-1.7.schema.json")),
            ("bomFormat", .string("CycloneDX")),
            ("specVersion", .string("1.7")),
            ("serialNumber", .string("urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79")),
            ("version", .number(RFC_8259.Number(1))),
            (
                "metadata",
                .object(
                    RFC_8259.Object([
                        ("timestamp", .string("2020-04-13"))
                    ])
                )
            ),
            ("components", .array(RFC_8259.Array([]))),
        ])
    )

    static let missingComponentType: RFC_8259.Value = .object(
        RFC_8259.Object([
            ("$schema", .string("http://cyclonedx.org/schema/bom-1.7.schema.json")),
            ("bomFormat", .string("CycloneDX")),
            ("specVersion", .string("1.7")),
            ("serialNumber", .string("urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79")),
            ("version", .number(RFC_8259.Number(1))),
            (
                "components",
                .array(
                    RFC_8259.Array([
                        .object(
                            RFC_8259.Object([
                                ("name", .string("acme-library")),
                                ("version", .string("1.0.0")),
                            ])
                        )
                    ])
                )
            ),
        ])
    )

    static let properties: RFC_8259.Value = .object(
        RFC_8259.Object([
            ("$schema", .string("http://cyclonedx.org/schema/bom-1.7.schema.json")),
            ("bomFormat", .string("CycloneDX")),
            ("specVersion", .string("1.7")),
            ("serialNumber", .string("urn:uuid:bcb403ae-91fa-436e-bc93-84d1078cdeed")),
            ("version", .number(RFC_8259.Number(1))),
            (
                "metadata",
                .object(
                    RFC_8259.Object([
                        (
                            "properties",
                            .array(
                                RFC_8259.Array([
                                    .object(
                                        RFC_8259.Object([
                                            ("value", .string("missing a name"))
                                        ])
                                    ),
                                    .object(
                                        RFC_8259.Object([
                                            ("unexpected-property", .string("foo"))
                                        ])
                                    ),
                                    .object(RFC_8259.Object([])),
                                ])
                            )
                        )
                    ])
                )
            ),
            (
                "components",
                .array(
                    RFC_8259.Array([
                        .object(
                            RFC_8259.Object([
                                ("type", .string("library")),
                                ("name", .string("acme-library")),
                                ("version", .string("1.0.0")),
                                (
                                    "licenses",
                                    .array(
                                        RFC_8259.Array([
                                            .object(
                                                RFC_8259.Object([
                                                    (
                                                        "license",
                                                        .object(
                                                            RFC_8259.Object([
                                                                ("id", .string("Apache-2.0")),
                                                                (
                                                                    "properties",
                                                                    .array(
                                                                        RFC_8259.Array([
                                                                            .object(
                                                                                RFC_8259.Object([
                                                                                    ("value", .string("missing a name"))
                                                                                ])
                                                                            ),
                                                                            .object(
                                                                                RFC_8259.Object([
                                                                                    ("unexpected-property", .string("foo"))
                                                                                ])
                                                                            ),
                                                                            .object(RFC_8259.Object([])),
                                                                        ])
                                                                    )
                                                                ),
                                                            ])
                                                        )
                                                    )
                                                ])
                                            )
                                        ])
                                    )
                                ),
                                (
                                    "properties",
                                    .array(
                                        RFC_8259.Array([
                                            .object(
                                                RFC_8259.Object([
                                                    ("value", .string("missing a name"))
                                                ])
                                            ),
                                            .object(
                                                RFC_8259.Object([
                                                    ("unexpected-property", .string("foo"))
                                                ])
                                            ),
                                            .object(RFC_8259.Object([])),
                                        ])
                                    )
                                ),
                            ])
                        )
                    ])
                )
            ),
            (
                "services",
                .array(
                    RFC_8259.Array([
                        .object(
                            RFC_8259.Object([
                                ("bom-ref", .string("b2a46a4b-8367-4bae-9820-95557cfe03a8")),
                                ("group", .string("org.partner")),
                                ("name", .string("Stock ticker service")),
                                (
                                    "endpoints",
                                    .array(
                                        RFC_8259.Array([
                                            .string("https://partner.org/api/v1/stock")
                                        ])
                                    )
                                ),
                                (
                                    "properties",
                                    .array(
                                        RFC_8259.Array([
                                            .object(
                                                RFC_8259.Object([
                                                    ("value", .string("missing a name"))
                                                ])
                                            ),
                                            .object(
                                                RFC_8259.Object([
                                                    ("unexpected-property", .string("foo"))
                                                ])
                                            ),
                                            .object(RFC_8259.Object([])),
                                        ])
                                    )
                                ),
                            ])
                        )
                    ])
                )
            ),
        ])
    )

    static let scope: RFC_8259.Value = .object(
        RFC_8259.Object([
            ("$schema", .string("http://cyclonedx.org/schema/bom-1.7.schema.json")),
            ("bomFormat", .string("CycloneDX")),
            ("specVersion", .string("1.7")),
            ("serialNumber", .string("urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79")),
            ("version", .number(RFC_8259.Number(1))),
            (
                "components",
                .array(
                    RFC_8259.Array([
                        .object(
                            RFC_8259.Object([
                                ("type", .string("library")),
                                ("name", .string("acme-library")),
                                ("version", .string("1.0.0")),
                                ("scope", .string("foo")),
                            ])
                        )
                    ])
                )
            ),
        ])
    )

    static let serialnumber: RFC_8259.Value = .object(
        RFC_8259.Object([
            ("$schema", .string("http://cyclonedx.org/schema/bom-1.7.schema.json")),
            ("bomFormat", .string("CycloneDX")),
            ("specVersion", .string("1.7")),
            ("serialNumber", .string("urn:uuid:3e671687-395b-41f5-a30f")),
            ("version", .number(RFC_8259.Number(1))),
            ("components", .array(RFC_8259.Array([]))),
        ])
    )
}
