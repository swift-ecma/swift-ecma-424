// Verbatim from the CycloneDX 1.7 conformance suite (CycloneDX/specification, tools/src/test/resources/1.7), Apache-2.0.
import ECMA_424

extension ECMA_424.BOM.Test {
    enum Invalid {}
}

extension ECMA_424.BOM.Test.Invalid {
    static let bomformat = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "AnotherFormat",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "components": [
          ]
        }
        """#

    static let componentRef = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "components": [
            {
              "type": "library",
              "bom-ref": "123",
              "name": "acme-library",
              "version": "1.0.0"
            },
            {
              "type": "library",
              "bom-ref": "",
              "name": "acme-library",
              "version": "1.0.0"
            }
          ]
        }
        """#

    static let componentType = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "components": [
            {
              "type": "foo",
              "name": "acme-library",
              "version": "1.0.0"
            }
          ]
        }
        """#

    static let dependency = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "components": [
            {
              "bom-ref": "library-a",
              "type": "library",
              "name": "library-a",
              "version": "1.0.0"
            },
            {
              "bom-ref": "library-b",
              "type": "library",
              "name": "library-b",
              "version": "1.0.0"
            },
            {
              "bom-ref": "library-c",
              "type": "library",
              "name": "library-c",
              "version": "1.0.0"
            }
          ],
          "dependencies": [
            {
              "dependsOn": []
            },
            {
              "ref": "",
              "dependsOn": [
                "library-a"
              ]
            },
            {
              "ref": "library-b",
              "dependsOn": [
                "library-c"
              ]
            }
          ]
        }
        """#

    static let emptyComponent = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "components": [
            {
              "type": "library"
            }
          ]
        }
        """#

    static let hashAlg = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "components": [
            {
              "type": "library",
              "name": "acme-library",
              "version": "1.0.0",
              "scope": "required",
              "hashes": [
                {
                  "alg": "FOO",
                  "content": "3942447fac867ae5cdb3229b658f4d48"
                },
                {
                  "alg": "SHA-1",
                  "content": "e6b1000b94e835ffd37f4c6dcbdad43f4b48a02a"
                },
                {
                  "alg": "SHA-256",
                  "content": "f498a8ff2dd007e29c2074f5e4b01a9a01775c3ff3aeaf6906ea503bc5791b7b"
                },
                {
                  "alg": "SHA-512",
                  "content": "e8f33e424f3f4ed6db76a482fde1a5298970e442c531729119e37991884bdffab4f9426b7ee11fccd074eeda0634d71697d6f88a460dce0ac8d627a29f7d1282"
                }
              ]
            }
          ]
        }
        """#

    static let hashMd5 = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "components": [
            {
              "type": "library",
              "name": "acme-library",
              "version": "1.0.0",
              "scope": "required",
              "hashes": [
                {
                  "alg": "MD5",
                  "content": "foo"
                },
                {
                  "alg": "SHA-1",
                  "content": "e6b1000b94e835ffd37f4c6dcbdad43f4b48a02a"
                },
                {
                  "alg": "SHA-256",
                  "content": "f498a8ff2dd007e29c2074f5e4b01a9a01775c3ff3aeaf6906ea503bc5791b7b"
                },
                {
                  "alg": "SHA-512",
                  "content": "e8f33e424f3f4ed6db76a482fde1a5298970e442c531729119e37991884bdffab4f9426b7ee11fccd074eeda0634d71697d6f88a460dce0ac8d627a29f7d1282"
                }
              ]
            }
          ]
        }
        """#

    static let hashSha1 = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "components": [
            {
              "type": "library",
              "name": "acme-library",
              "version": "1.0.0",
              "scope": "required",
              "hashes": [
                {
                  "alg": "MD5",
                  "content": "3942447fac867ae5cdb3229b658f4d48"
                },
                {
                  "alg": "SHA-1",
                  "content": "foo"
                },
                {
                  "alg": "SHA-256",
                  "content": "f498a8ff2dd007e29c2074f5e4b01a9a01775c3ff3aeaf6906ea503bc5791b7b"
                },
                {
                  "alg": "SHA-512",
                  "content": "e8f33e424f3f4ed6db76a482fde1a5298970e442c531729119e37991884bdffab4f9426b7ee11fccd074eeda0634d71697d6f88a460dce0ac8d627a29f7d1282"
                }
              ]
            }
          ]
        }
        """#

    static let hashSha256 = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "components": [
            {
              "type": "library",
              "name": "acme-library",
              "version": "1.0.0",
              "scope": "required",
              "hashes": [
                {
                  "alg": "MD5",
                  "content": "3942447fac867ae5cdb3229b658f4d48"
                },
                {
                  "alg": "SHA-1",
                  "content": "e6b1000b94e835ffd37f4c6dcbdad43f4b48a02a"
                },
                {
                  "alg": "SHA-256",
                  "content": "foo"
                },
                {
                  "alg": "SHA-512",
                  "content": "e8f33e424f3f4ed6db76a482fde1a5298970e442c531729119e37991884bdffab4f9426b7ee11fccd074eeda0634d71697d6f88a460dce0ac8d627a29f7d1282"
                }
              ]
            }
          ]
        }
        """#

    static let hashSha512 = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "components": [
            {
              "type": "library",
              "name": "acme-library",
              "version": "1.0.0",
              "scope": "required",
              "hashes": [
                {
                  "alg": "MD5",
                  "content": "3942447fac867ae5cdb3229b658f4d48"
                },
                {
                  "alg": "SHA-1",
                  "content": "e6b1000b94e835ffd37f4c6dcbdad43f4b48a02a"
                },
                {
                  "alg": "SHA-256",
                  "content": "f498a8ff2dd007e29c2074f5e4b01a9a01775c3ff3aeaf6906ea503bc5791b7b"
                },
                {
                  "alg": "SHA-512",
                  "content": "foo"
                }
              ]
            }
          ]
        }
        """#

    static let licenseChoice = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "components": [
            {
              "type": "library",
              "publisher": "Acme Inc",
              "group": "com.acme",
              "name": "tomcat-catalina",
              "version": "9.0.14",
              "licenses": [
                {
                  "expression": "EPL-2.0 OR GPL-2.0 WITH Classpath-exception-2.0",
                  "license": {
                    "name": "Apache License 2.0"
                  }
                }
              ]
            }
          ]
        }
        """#

    static let licenseId = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "components": [
            {
              "type": "library",
              "publisher": "Acme Inc",
              "group": "com.acme",
              "name": "tomcat-catalina",
              "version": "9.0.14",
              "licenses": [
                {
                  "license": {
                    "id": "Apache-2"
                  }
                }
              ]
            }
          ]
        }
        """#

    static let licenseMissingIdAndName = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "components": [
            {
              "type": "library",
              "name": "license-with-no-id-nor-name",
              "version": "23",
              "description": "testcase for issue#288",
              "licenses": [
                {
                  "license": {}
                }
              ]
            }
          ]
        }
        """#

    static let metadataTimestamp = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "metadata": {
            "timestamp": "2020-04-13"
          },
          "components": []
        }
        """#

    static let missingComponentType = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "components": [
            {
              "name": "acme-library",
              "version": "1.0.0"
            }
          ]
        }
        """#

    static let properties = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:bcb403ae-91fa-436e-bc93-84d1078cdeed",
          "version": 1,
          "metadata": {
            "properties": [
              {
                "value": "missing a name"
              },
              {
                "unexpected-property": "foo"
              },
              {}
            ]
          },
          "components": [
            {
              "type": "library",
              "name": "acme-library",
              "version": "1.0.0",
              "licenses": [
                {
                  "license": {
                    "id": "Apache-2.0",
                    "properties": [
                      {
                        "value": "missing a name"
                      },
                      {
                        "unexpected-property": "foo"
                      },
                      {}
                    ]
                  }
                }
              ],
              "properties": [
                {
                  "value": "missing a name"
                },
                {
                  "unexpected-property": "foo"
                },
                {}
              ]
            }
          ],
          "services": [
            {
              "bom-ref": "b2a46a4b-8367-4bae-9820-95557cfe03a8",
              "group": "org.partner",
              "name": "Stock ticker service",
              "endpoints": [
                "https://partner.org/api/v1/stock"
              ],
              "properties": [
                {
                  "value": "missing a name"
                },
                {
                  "unexpected-property": "foo"
                },
                {}
              ]
            }
          ]
        }
        """#

    static let scope = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "components": [
            {
              "type": "library",
              "name": "acme-library",
              "version": "1.0.0",
              "scope": "foo"
            }
          ]
        }
        """#

    static let serialnumber = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f",
          "version": 1,
          "components": [
          ]
        }
        """#
}
