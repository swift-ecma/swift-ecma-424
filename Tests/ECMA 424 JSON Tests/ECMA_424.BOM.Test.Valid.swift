// Verbatim from the CycloneDX 1.7 conformance suite (CycloneDX/specification, tools/src/test/resources/1.7), Apache-2.0.
import ECMA_424

extension ECMA_424.BOM.Test {
    enum Valid {}
}

extension ECMA_424.BOM.Test.Valid {
    static let bom = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "metadata": {
            "timestamp": "2020-04-13T20:20:39+00:00",
            "tools": [
              {
                "vendor": "Awesome Vendor",
                "name": "Awesome Tool",
                "version": "9.1.2",
                "hashes": [
                  {
                    "alg": "SHA-1",
                    "content": "25ed8e31b995bb927966616df2a42b979a2717f0"
                  },
                  {
                    "alg": "SHA-256",
                    "content": "a74f733635a19aefb1f73e5947cef59cd7440c6952ef0f03d09d974274cbd6df"
                  }
                ]
              }
            ],
            "authors": [
              {
                "name": "Samantha Wright",
                "email": "samantha.wright@example.com",
                "phone": "800-555-1212"
              }
            ],
            "component": {
              "type": "application",
              "author": "Acme Super Heros",
              "name": "Acme Application",
              "version": "9.1.1",
              "swid": {
                "tagId": "swidgen-242eb18a-503e-ca37-393b-cf156ef09691_9.1.1",
                "name": "Acme Application",
                "version": "9.1.1",
                "text": {
                  "contentType": "text/xml",
                  "encoding": "base64",
                  "content": "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiID8+CjxTb2Z0d2FyZUlkZW50aXR5IHhtbDpsYW5nPSJFTiIgbmFtZT0iQWNtZSBBcHBsaWNhdGlvbiIgdmVyc2lvbj0iOS4xLjEiIAogdmVyc2lvblNjaGVtZT0ibXVsdGlwYXJ0bnVtZXJpYyIgCiB0YWdJZD0ic3dpZGdlbi1iNTk1MWFjOS00MmMwLWYzODItM2YxZS1iYzdhMmE0NDk3Y2JfOS4xLjEiIAogeG1sbnM9Imh0dHA6Ly9zdGFuZGFyZHMuaXNvLm9yZy9pc28vMTk3NzAvLTIvMjAxNS9zY2hlbWEueHNkIj4gCiB4bWxuczp4c2k9Imh0dHA6Ly93d3cudzMub3JnLzIwMDEvWE1MU2NoZW1hLWluc3RhbmNlIiAKIHhzaTpzY2hlbWFMb2NhdGlvbj0iaHR0cDovL3N0YW5kYXJkcy5pc28ub3JnL2lzby8xOTc3MC8tMi8yMDE1LWN1cnJlbnQvc2NoZW1hLnhzZCBzY2hlbWEueHNkIiA+CiAgPE1ldGEgZ2VuZXJhdG9yPSJTV0lEIFRhZyBPbmxpbmUgR2VuZXJhdG9yIHYwLjEiIC8+IAogIDxFbnRpdHkgbmFtZT0iQWNtZSwgSW5jLiIgcmVnaWQ9ImV4YW1wbGUuY29tIiByb2xlPSJ0YWdDcmVhdG9yIiAvPiAKPC9Tb2Z0d2FyZUlkZW50aXR5Pg=="
                }
              }
            },
            "manufacturer": {
              "name": "Acme, Inc.",
              "url": [
                "https://example.com"
              ],
              "contact": [
                {
                  "name": "Acme Professional Services",
                  "email": "professional.services@example.com"
                }
              ]
            },
            "supplier": {
              "name": "Acme, Inc.",
              "url": [
                "https://example.com"
              ],
              "contact": [
                {
                  "name": "Acme Distribution",
                  "email": "distribution@example.com"
                }
              ]
            }
          },
          "components": [
            {
              "bom-ref": "pkg:maven/com.acme/tomcat-catalina@9.0.14?packaging=jar",
              "type": "application",
              "author": "Joane Doe et al.",
              "publisher": "Acme Inc",
              "group": "com.acme",
              "name": "tomcat-catalina",
              "version": "9.0.14",
              "description": "Modified version of Apache Catalina",
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
                  "content": "e8f33e424f3f4ed6db76a482fde1a5298970e442c531729119e37991884bdffab4f9426b7ee11fccd074eeda0634d71697d6f88a460dce0ac8d627a29f7d1282"
                }
              ],
              "licenses": [
                {
                  "license": {
                    "id": "Apache-2.0",
                    "text": {
                      "contentType": "text/plain",
                      "encoding": "base64",
                      "content": "CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFwYWNoZSBMaWNlbnNlCiAgICAgICAgICAgICAgICAgICAgICAgICAgIFZlcnNpb24gMi4wLCBKYW51YXJ5IDIwMDQKICAgICAgICAgICAgICAgICAgICAgICAgaHR0cDovL3d3dy5hcGFjaGUub3JnL2xpY2Vuc2VzLwoKICAgVEVSTVMgQU5EIENPTkRJVElPTlMgRk9SIFVTRSwgUkVQUk9EVUNUSU9OLCBBTkQgRElTVFJJQlVUSU9OCgogICAxLiBEZWZpbml0aW9ucy4KCiAgICAgICJMaWNlbnNlIiBzaGFsbCBtZWFuIHRoZSB0ZXJtcyBhbmQgY29uZGl0aW9ucyBmb3IgdXNlLCByZXByb2R1Y3Rpb24sCiAgICAgIGFuZCBkaXN0cmlidXRpb24gYXMgZGVmaW5lZCBieSBTZWN0aW9ucyAxIHRocm91Z2ggOSBvZiB0aGlzIGRvY3VtZW50LgoKICAgICAgIkxpY2Vuc29yIiBzaGFsbCBtZWFuIHRoZSBjb3B5cmlnaHQgb3duZXIgb3IgZW50aXR5IGF1dGhvcml6ZWQgYnkKICAgICAgdGhlIGNvcHlyaWdodCBvd25lciB0aGF0IGlzIGdyYW50aW5nIHRoZSBMaWNlbnNlLgoKICAgICAgIkxlZ2FsIEVudGl0eSIgc2hhbGwgbWVhbiB0aGUgdW5pb24gb2YgdGhlIGFjdGluZyBlbnRpdHkgYW5kIGFsbAogICAgICBvdGhlciBlbnRpdGllcyB0aGF0IGNvbnRyb2wsIGFyZSBjb250cm9sbGVkIGJ5LCBvciBhcmUgdW5kZXIgY29tbW9uCiAgICAgIGNvbnRyb2wgd2l0aCB0aGF0IGVudGl0eS4gRm9yIHRoZSBwdXJwb3NlcyBvZiB0aGlzIGRlZmluaXRpb24sCiAgICAgICJjb250cm9sIiBtZWFucyAoaSkgdGhlIHBvd2VyLCBkaXJlY3Qgb3IgaW5kaXJlY3QsIHRvIGNhdXNlIHRoZQogICAgICBkaXJlY3Rpb24gb3IgbWFuYWdlbWVudCBvZiBzdWNoIGVudGl0eSwgd2hldGhlciBieSBjb250cmFjdCBvcgogICAgICBvdGhlcndpc2UsIG9yIChpaSkgb3duZXJzaGlwIG9mIGZpZnR5IHBlcmNlbnQgKDUwJSkgb3IgbW9yZSBvZiB0aGUKICAgICAgb3V0c3RhbmRpbmcgc2hhcmVzLCBvciAoaWlpKSBiZW5lZmljaWFsIG93bmVyc2hpcCBvZiBzdWNoIGVudGl0eS4KCiAgICAgICJZb3UiIChvciAiWW91ciIpIHNoYWxsIG1lYW4gYW4gaW5kaXZpZHVhbCBvciBMZWdhbCBFbnRpdHkKICAgICAgZXhlcmNpc2luZyBwZXJtaXNzaW9ucyBncmFudGVkIGJ5IHRoaXMgTGljZW5zZS4KCiAgICAgICJTb3VyY2UiIGZvcm0gc2hhbGwgbWVhbiB0aGUgcHJlZmVycmVkIGZvcm0gZm9yIG1ha2luZyBtb2RpZmljYXRpb25zLAogICAgICBpbmNsdWRpbmcgYnV0IG5vdCBsaW1pdGVkIHRvIHNvZnR3YXJlIHNvdXJjZSBjb2RlLCBkb2N1bWVudGF0aW9uCiAgICAgIHNvdXJjZSwgYW5kIGNvbmZpZ3VyYXRpb24gZmlsZXMuCgogICAgICAiT2JqZWN0IiBmb3JtIHNoYWxsIG1lYW4gYW55IGZvcm0gcmVzdWx0aW5nIGZyb20gbWVjaGFuaWNhbAogICAgICB0cmFuc2Zvcm1hdGlvbiBvciB0cmFuc2xhdGlvbiBvZiBhIFNvdXJjZSBmb3JtLCBpbmNsdWRpbmcgYnV0CiAgICAgIG5vdCBsaW1pdGVkIHRvIGNvbXBpbGVkIG9iamVjdCBjb2RlLCBnZW5lcmF0ZWQgZG9jdW1lbnRhdGlvbiwKICAgICAgYW5kIGNvbnZlcnNpb25zIHRvIG90aGVyIG1lZGlhIHR5cGVzLgoKICAgICAgIldvcmsiIHNoYWxsIG1lYW4gdGhlIHdvcmsgb2YgYXV0aG9yc2hpcCwgd2hldGhlciBpbiBTb3VyY2Ugb3IKICAgICAgT2JqZWN0IGZvcm0sIG1hZGUgYXZhaWxhYmxlIHVuZGVyIHRoZSBMaWNlbnNlLCBhcyBpbmRpY2F0ZWQgYnkgYQogICAgICBjb3B5cmlnaHQgbm90aWNlIHRoYXQgaXMgaW5jbHVkZWQgaW4gb3IgYXR0YWNoZWQgdG8gdGhlIHdvcmsKICAgICAgKGFuIGV4YW1wbGUgaXMgcHJvdmlkZWQgaW4gdGhlIEFwcGVuZGl4IGJlbG93KS4KCiAgICAgICJEZXJpdmF0aXZlIFdvcmtzIiBzaGFsbCBtZWFuIGFueSB3b3JrLCB3aGV0aGVyIGluIFNvdXJjZSBvciBPYmplY3QKICAgICAgZm9ybSwgdGhhdCBpcyBiYXNlZCBvbiAob3IgZGVyaXZlZCBmcm9tKSB0aGUgV29yayBhbmQgZm9yIHdoaWNoIHRoZQogICAgICBlZGl0b3JpYWwgcmV2aXNpb25zLCBhbm5vdGF0aW9ucywgZWxhYm9yYXRpb25zLCBvciBvdGhlciBtb2RpZmljYXRpb25zCiAgICAgIHJlcHJlc2VudCwgYXMgYSB3aG9sZSwgYW4gb3JpZ2luYWwgd29yayBvZiBhdXRob3JzaGlwLiBGb3IgdGhlIHB1cnBvc2VzCiAgICAgIG9mIHRoaXMgTGljZW5zZSwgRGVyaXZhdGl2ZSBXb3JrcyBzaGFsbCBub3QgaW5jbHVkZSB3b3JrcyB0aGF0IHJlbWFpbgogICAgICBzZXBhcmFibGUgZnJvbSwgb3IgbWVyZWx5IGxpbmsgKG9yIGJpbmQgYnkgbmFtZSkgdG8gdGhlIGludGVyZmFjZXMgb2YsCiAgICAgIHRoZSBXb3JrIGFuZCBEZXJpdmF0aXZlIFdvcmtzIHRoZXJlb2YuCgogICAgICAiQ29udHJpYnV0aW9uIiBzaGFsbCBtZWFuIGFueSB3b3JrIG9mIGF1dGhvcnNoaXAsIGluY2x1ZGluZwogICAgICB0aGUgb3JpZ2luYWwgdmVyc2lvbiBvZiB0aGUgV29yayBhbmQgYW55IG1vZGlmaWNhdGlvbnMgb3IgYWRkaXRpb25zCiAgICAgIHRvIHRoYXQgV29yayBvciBEZXJpdmF0aXZlIFdvcmtzIHRoZXJlb2YsIHRoYXQgaXMgaW50ZW50aW9uYWxseQogICAgICBzdWJtaXR0ZWQgdG8gTGljZW5zb3IgZm9yIGluY2x1c2lvbiBpbiB0aGUgV29yayBieSB0aGUgY29weXJpZ2h0IG93bmVyCiAgICAgIG9yIGJ5IGFuIGluZGl2aWR1YWwgb3IgTGVnYWwgRW50aXR5IGF1dGhvcml6ZWQgdG8gc3VibWl0IG9uIGJlaGFsZiBvZgogICAgICB0aGUgY29weXJpZ2h0IG93bmVyLiBGb3IgdGhlIHB1cnBvc2VzIG9mIHRoaXMgZGVmaW5pdGlvbiwgInN1Ym1pdHRlZCIKICAgICAgbWVhbnMgYW55IGZvcm0gb2YgZWxlY3Ryb25pYywgdmVyYmFsLCBvciB3cml0dGVuIGNvbW11bmljYXRpb24gc2VudAogICAgICB0byB0aGUgTGljZW5zb3Igb3IgaXRzIHJlcHJlc2VudGF0aXZlcywgaW5jbHVkaW5nIGJ1dCBub3QgbGltaXRlZCB0bwogICAgICBjb21tdW5pY2F0aW9uIG9uIGVsZWN0cm9uaWMgbWFpbGluZyBsaXN0cywgc291cmNlIGNvZGUgY29udHJvbCBzeXN0ZW1zLAogICAgICBhbmQgaXNzdWUgdHJhY2tpbmcgc3lzdGVtcyB0aGF0IGFyZSBtYW5hZ2VkIGJ5LCBvciBvbiBiZWhhbGYgb2YsIHRoZQogICAgICBMaWNlbnNvciBmb3IgdGhlIHB1cnBvc2Ugb2YgZGlzY3Vzc2luZyBhbmQgaW1wcm92aW5nIHRoZSBXb3JrLCBidXQKICAgICAgZXhjbHVkaW5nIGNvbW11bmljYXRpb24gdGhhdCBpcyBjb25zcGljdW91c2x5IG1hcmtlZCBvciBvdGhlcndpc2UKICAgICAgZGVzaWduYXRlZCBpbiB3cml0aW5nIGJ5IHRoZSBjb3B5cmlnaHQgb3duZXIgYXMgIk5vdCBhIENvbnRyaWJ1dGlvbi4iCgogICAgICAiQ29udHJpYnV0b3IiIHNoYWxsIG1lYW4gTGljZW5zb3IgYW5kIGFueSBpbmRpdmlkdWFsIG9yIExlZ2FsIEVudGl0eQogICAgICBvbiBiZWhhbGYgb2Ygd2hvbSBhIENvbnRyaWJ1dGlvbiBoYXMgYmVlbiByZWNlaXZlZCBieSBMaWNlbnNvciBhbmQKICAgICAgc3Vic2VxdWVudGx5IGluY29ycG9yYXRlZCB3aXRoaW4gdGhlIFdvcmsuCgogICAyLiBHcmFudCBvZiBDb3B5cmlnaHQgTGljZW5zZS4gU3ViamVjdCB0byB0aGUgdGVybXMgYW5kIGNvbmRpdGlvbnMgb2YKICAgICAgdGhpcyBMaWNlbnNlLCBlYWNoIENvbnRyaWJ1dG9yIGhlcmVieSBncmFudHMgdG8gWW91IGEgcGVycGV0dWFsLAogICAgICB3b3JsZHdpZGUsIG5vbi1leGNsdXNpdmUsIG5vLWNoYXJnZSwgcm95YWx0eS1mcmVlLCBpcnJldm9jYWJsZQogICAgICBjb3B5cmlnaHQgbGljZW5zZSB0byByZXByb2R1Y2UsIHByZXBhcmUgRGVyaXZhdGl2ZSBXb3JrcyBvZiwKICAgICAgcHVibGljbHkgZGlzcGxheSwgcHVibGljbHkgcGVyZm9ybSwgc3VibGljZW5zZSwgYW5kIGRpc3RyaWJ1dGUgdGhlCiAgICAgIFdvcmsgYW5kIHN1Y2ggRGVyaXZhdGl2ZSBXb3JrcyBpbiBTb3VyY2Ugb3IgT2JqZWN0IGZvcm0uCgogICAzLiBHcmFudCBvZiBQYXRlbnQgTGljZW5zZS4gU3ViamVjdCB0byB0aGUgdGVybXMgYW5kIGNvbmRpdGlvbnMgb2YKICAgICAgdGhpcyBMaWNlbnNlLCBlYWNoIENvbnRyaWJ1dG9yIGhlcmVieSBncmFudHMgdG8gWW91IGEgcGVycGV0dWFsLAogICAgICB3b3JsZHdpZGUsIG5vbi1leGNsdXNpdmUsIG5vLWNoYXJnZSwgcm95YWx0eS1mcmVlLCBpcnJldm9jYWJsZQogICAgICAoZXhjZXB0IGFzIHN0YXRlZCBpbiB0aGlzIHNlY3Rpb24pIHBhdGVudCBsaWNlbnNlIHRvIG1ha2UsIGhhdmUgbWFkZSwKICAgICAgdXNlLCBvZmZlciB0byBzZWxsLCBzZWxsLCBpbXBvcnQsIGFuZCBvdGhlcndpc2UgdHJhbnNmZXIgdGhlIFdvcmssCiAgICAgIHdoZXJlIHN1Y2ggbGljZW5zZSBhcHBsaWVzIG9ubHkgdG8gdGhvc2UgcGF0ZW50IGNsYWltcyBsaWNlbnNhYmxlCiAgICAgIGJ5IHN1Y2ggQ29udHJpYnV0b3IgdGhhdCBhcmUgbmVjZXNzYXJpbHkgaW5mcmluZ2VkIGJ5IHRoZWlyCiAgICAgIENvbnRyaWJ1dGlvbihzKSBhbG9uZSBvciBieSBjb21iaW5hdGlvbiBvZiB0aGVpciBDb250cmlidXRpb24ocykKICAgICAgd2l0aCB0aGUgV29yayB0byB3aGljaCBzdWNoIENvbnRyaWJ1dGlvbihzKSB3YXMgc3VibWl0dGVkLiBJZiBZb3UKICAgICAgaW5zdGl0dXRlIHBhdGVudCBsaXRpZ2F0aW9uIGFnYWluc3QgYW55IGVudGl0eSAoaW5jbHVkaW5nIGEKICAgICAgY3Jvc3MtY2xhaW0gb3IgY291bnRlcmNsYWltIGluIGEgbGF3c3VpdCkgYWxsZWdpbmcgdGhhdCB0aGUgV29yawogICAgICBvciBhIENvbnRyaWJ1dGlvbiBpbmNvcnBvcmF0ZWQgd2l0aGluIHRoZSBXb3JrIGNvbnN0aXR1dGVzIGRpcmVjdAogICAgICBvciBjb250cmlidXRvcnkgcGF0ZW50IGluZnJpbmdlbWVudCwgdGhlbiBhbnkgcGF0ZW50IGxpY2Vuc2VzCiAgICAgIGdyYW50ZWQgdG8gWW91IHVuZGVyIHRoaXMgTGljZW5zZSBmb3IgdGhhdCBXb3JrIHNoYWxsIHRlcm1pbmF0ZQogICAgICBhcyBvZiB0aGUgZGF0ZSBzdWNoIGxpdGlnYXRpb24gaXMgZmlsZWQuCgogICA0LiBSZWRpc3RyaWJ1dGlvbi4gWW91IG1heSByZXByb2R1Y2UgYW5kIGRpc3RyaWJ1dGUgY29waWVzIG9mIHRoZQogICAgICBXb3JrIG9yIERlcml2YXRpdmUgV29ya3MgdGhlcmVvZiBpbiBhbnkgbWVkaXVtLCB3aXRoIG9yIHdpdGhvdXQKICAgICAgbW9kaWZpY2F0aW9ucywgYW5kIGluIFNvdXJjZSBvciBPYmplY3QgZm9ybSwgcHJvdmlkZWQgdGhhdCBZb3UKICAgICAgbWVldCB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6CgogICAgICAoYSkgWW91IG11c3QgZ2l2ZSBhbnkgb3RoZXIgcmVjaXBpZW50cyBvZiB0aGUgV29yayBvcgogICAgICAgICAgRGVyaXZhdGl2ZSBXb3JrcyBhIGNvcHkgb2YgdGhpcyBMaWNlbnNlOyBhbmQKCiAgICAgIChiKSBZb3UgbXVzdCBjYXVzZSBhbnkgbW9kaWZpZWQgZmlsZXMgdG8gY2FycnkgcHJvbWluZW50IG5vdGljZXMKICAgICAgICAgIHN0YXRpbmcgdGhhdCBZb3UgY2hhbmdlZCB0aGUgZmlsZXM7IGFuZAoKICAgICAgKGMpIFlvdSBtdXN0IHJldGFpbiwgaW4gdGhlIFNvdXJjZSBmb3JtIG9mIGFueSBEZXJpdmF0aXZlIFdvcmtzCiAgICAgICAgICB0aGF0IFlvdSBkaXN0cmlidXRlLCBhbGwgY29weXJpZ2h0LCBwYXRlbnQsIHRyYWRlbWFyaywgYW5kCiAgICAgICAgICBhdHRyaWJ1dGlvbiBub3RpY2VzIGZyb20gdGhlIFNvdXJjZSBmb3JtIG9mIHRoZSBXb3JrLAogICAgICAgICAgZXhjbHVkaW5nIHRob3NlIG5vdGljZXMgdGhhdCBkbyBub3QgcGVydGFpbiB0byBhbnkgcGFydCBvZgogICAgICAgICAgdGhlIERlcml2YXRpdmUgV29ya3M7IGFuZAoKICAgICAgKGQpIElmIHRoZSBXb3JrIGluY2x1ZGVzIGEgIk5PVElDRSIgdGV4dCBmaWxlIGFzIHBhcnQgb2YgaXRzCiAgICAgICAgICBkaXN0cmlidXRpb24sIHRoZW4gYW55IERlcml2YXRpdmUgV29ya3MgdGhhdCBZb3UgZGlzdHJpYnV0ZSBtdXN0CiAgICAgICAgICBpbmNsdWRlIGEgcmVhZGFibGUgY29weSBvZiB0aGUgYXR0cmlidXRpb24gbm90aWNlcyBjb250YWluZWQKICAgICAgICAgIHdpdGhpbiBzdWNoIE5PVElDRSBmaWxlLCBleGNsdWRpbmcgdGhvc2Ugbm90aWNlcyB0aGF0IGRvIG5vdAogICAgICAgICAgcGVydGFpbiB0byBhbnkgcGFydCBvZiB0aGUgRGVyaXZhdGl2ZSBXb3JrcywgaW4gYXQgbGVhc3Qgb25lCiAgICAgICAgICBvZiB0aGUgZm9sbG93aW5nIHBsYWNlczogd2l0aGluIGEgTk9USUNFIHRleHQgZmlsZSBkaXN0cmlidXRlZAogICAgICAgICAgYXMgcGFydCBvZiB0aGUgRGVyaXZhdGl2ZSBXb3Jrczsgd2l0aGluIHRoZSBTb3VyY2UgZm9ybSBvcgogICAgICAgICAgZG9jdW1lbnRhdGlvbiwgaWYgcHJvdmlkZWQgYWxvbmcgd2l0aCB0aGUgRGVyaXZhdGl2ZSBXb3Jrczsgb3IsCiAgICAgICAgICB3aXRoaW4gYSBkaXNwbGF5IGdlbmVyYXRlZCBieSB0aGUgRGVyaXZhdGl2ZSBXb3JrcywgaWYgYW5kCiAgICAgICAgICB3aGVyZXZlciBzdWNoIHRoaXJkLXBhcnR5IG5vdGljZXMgbm9ybWFsbHkgYXBwZWFyLiBUaGUgY29udGVudHMKICAgICAgICAgIG9mIHRoZSBOT1RJQ0UgZmlsZSBhcmUgZm9yIGluZm9ybWF0aW9uYWwgcHVycG9zZXMgb25seSBhbmQKICAgICAgICAgIGRvIG5vdCBtb2RpZnkgdGhlIExpY2Vuc2UuIFlvdSBtYXkgYWRkIFlvdXIgb3duIGF0dHJpYnV0aW9uCiAgICAgICAgICBub3RpY2VzIHdpdGhpbiBEZXJpdmF0aXZlIFdvcmtzIHRoYXQgWW91IGRpc3RyaWJ1dGUsIGFsb25nc2lkZQogICAgICAgICAgb3IgYXMgYW4gYWRkZW5kdW0gdG8gdGhlIE5PVElDRSB0ZXh0IGZyb20gdGhlIFdvcmssIHByb3ZpZGVkCiAgICAgICAgICB0aGF0IHN1Y2ggYWRkaXRpb25hbCBhdHRyaWJ1dGlvbiBub3RpY2VzIGNhbm5vdCBiZSBjb25zdHJ1ZWQKICAgICAgICAgIGFzIG1vZGlmeWluZyB0aGUgTGljZW5zZS4KCiAgICAgIFlvdSBtYXkgYWRkIFlvdXIgb3duIGNvcHlyaWdodCBzdGF0ZW1lbnQgdG8gWW91ciBtb2RpZmljYXRpb25zIGFuZAogICAgICBtYXkgcHJvdmlkZSBhZGRpdGlvbmFsIG9yIGRpZmZlcmVudCBsaWNlbnNlIHRlcm1zIGFuZCBjb25kaXRpb25zCiAgICAgIGZvciB1c2UsIHJlcHJvZHVjdGlvbiwgb3IgZGlzdHJpYnV0aW9uIG9mIFlvdXIgbW9kaWZpY2F0aW9ucywgb3IKICAgICAgZm9yIGFueSBzdWNoIERlcml2YXRpdmUgV29ya3MgYXMgYSB3aG9sZSwgcHJvdmlkZWQgWW91ciB1c2UsCiAgICAgIHJlcHJvZHVjdGlvbiwgYW5kIGRpc3RyaWJ1dGlvbiBvZiB0aGUgV29yayBvdGhlcndpc2UgY29tcGxpZXMgd2l0aAogICAgICB0aGUgY29uZGl0aW9ucyBzdGF0ZWQgaW4gdGhpcyBMaWNlbnNlLgoKICAgNS4gU3VibWlzc2lvbiBvZiBDb250cmlidXRpb25zLiBVbmxlc3MgWW91IGV4cGxpY2l0bHkgc3RhdGUgb3RoZXJ3aXNlLAogICAgICBhbnkgQ29udHJpYnV0aW9uIGludGVudGlvbmFsbHkgc3VibWl0dGVkIGZvciBpbmNsdXNpb24gaW4gdGhlIFdvcmsKICAgICAgYnkgWW91IHRvIHRoZSBMaWNlbnNvciBzaGFsbCBiZSB1bmRlciB0aGUgdGVybXMgYW5kIGNvbmRpdGlvbnMgb2YKICAgICAgdGhpcyBMaWNlbnNlLCB3aXRob3V0IGFueSBhZGRpdGlvbmFsIHRlcm1zIG9yIGNvbmRpdGlvbnMuCiAgICAgIE5vdHdpdGhzdGFuZGluZyB0aGUgYWJvdmUsIG5vdGhpbmcgaGVyZWluIHNoYWxsIHN1cGVyc2VkZSBvciBtb2RpZnkKICAgICAgdGhlIHRlcm1zIG9mIGFueSBzZXBhcmF0ZSBsaWNlbnNlIGFncmVlbWVudCB5b3UgbWF5IGhhdmUgZXhlY3V0ZWQKICAgICAgd2l0aCBMaWNlbnNvciByZWdhcmRpbmcgc3VjaCBDb250cmlidXRpb25zLgoKICAgNi4gVHJhZGVtYXJrcy4gVGhpcyBMaWNlbnNlIGRvZXMgbm90IGdyYW50IHBlcm1pc3Npb24gdG8gdXNlIHRoZSB0cmFkZQogICAgICBuYW1lcywgdHJhZGVtYXJrcywgc2VydmljZSBtYXJrcywgb3IgcHJvZHVjdCBuYW1lcyBvZiB0aGUgTGljZW5zb3IsCiAgICAgIGV4Y2VwdCBhcyByZXF1aXJlZCBmb3IgcmVhc29uYWJsZSBhbmQgY3VzdG9tYXJ5IHVzZSBpbiBkZXNjcmliaW5nIHRoZQogICAgICBvcmlnaW4gb2YgdGhlIFdvcmsgYW5kIHJlcHJvZHVjaW5nIHRoZSBjb250ZW50IG9mIHRoZSBOT1RJQ0UgZmlsZS4KCiAgIDcuIERpc2NsYWltZXIgb2YgV2FycmFudHkuIFVubGVzcyByZXF1aXJlZCBieSBhcHBsaWNhYmxlIGxhdyBvcgogICAgICBhZ3JlZWQgdG8gaW4gd3JpdGluZywgTGljZW5zb3IgcHJvdmlkZXMgdGhlIFdvcmsgKGFuZCBlYWNoCiAgICAgIENvbnRyaWJ1dG9yIHByb3ZpZGVzIGl0cyBDb250cmlidXRpb25zKSBvbiBhbiAiQVMgSVMiIEJBU0lTLAogICAgICBXSVRIT1VUIFdBUlJBTlRJRVMgT1IgQ09ORElUSU9OUyBPRiBBTlkgS0lORCwgZWl0aGVyIGV4cHJlc3Mgb3IKICAgICAgaW1wbGllZCwgaW5jbHVkaW5nLCB3aXRob3V0IGxpbWl0YXRpb24sIGFueSB3YXJyYW50aWVzIG9yIGNvbmRpdGlvbnMKICAgICAgb2YgVElUTEUsIE5PTi1JTkZSSU5HRU1FTlQsIE1FUkNIQU5UQUJJTElUWSwgb3IgRklUTkVTUyBGT1IgQQogICAgICBQQVJUSUNVTEFSIFBVUlBPU0UuIFlvdSBhcmUgc29sZWx5IHJlc3BvbnNpYmxlIGZvciBkZXRlcm1pbmluZyB0aGUKICAgICAgYXBwcm9wcmlhdGVuZXNzIG9mIHVzaW5nIG9yIHJlZGlzdHJpYnV0aW5nIHRoZSBXb3JrIGFuZCBhc3N1bWUgYW55CiAgICAgIHJpc2tzIGFzc29jaWF0ZWQgd2l0aCBZb3VyIGV4ZXJjaXNlIG9mIHBlcm1pc3Npb25zIHVuZGVyIHRoaXMgTGljZW5zZS4KCiAgIDguIExpbWl0YXRpb24gb2YgTGlhYmlsaXR5LiBJbiBubyBldmVudCBhbmQgdW5kZXIgbm8gbGVnYWwgdGhlb3J5LAogICAgICB3aGV0aGVyIGluIHRvcnQgKGluY2x1ZGluZyBuZWdsaWdlbmNlKSwgY29udHJhY3QsIG9yIG90aGVyd2lzZSwKICAgICAgdW5sZXNzIHJlcXVpcmVkIGJ5IGFwcGxpY2FibGUgbGF3IChzdWNoIGFzIGRlbGliZXJhdGUgYW5kIGdyb3NzbHkKICAgICAgbmVnbGlnZW50IGFjdHMpIG9yIGFncmVlZCB0byBpbiB3cml0aW5nLCBzaGFsbCBhbnkgQ29udHJpYnV0b3IgYmUKICAgICAgbGlhYmxlIHRvIFlvdSBmb3IgZGFtYWdlcywgaW5jbHVkaW5nIGFueSBkaXJlY3QsIGluZGlyZWN0LCBzcGVjaWFsLAogICAgICBpbmNpZGVudGFsLCBvciBjb25zZXF1ZW50aWFsIGRhbWFnZXMgb2YgYW55IGNoYXJhY3RlciBhcmlzaW5nIGFzIGEKICAgICAgcmVzdWx0IG9mIHRoaXMgTGljZW5zZSBvciBvdXQgb2YgdGhlIHVzZSBvciBpbmFiaWxpdHkgdG8gdXNlIHRoZQogICAgICBXb3JrIChpbmNsdWRpbmcgYnV0IG5vdCBsaW1pdGVkIHRvIGRhbWFnZXMgZm9yIGxvc3Mgb2YgZ29vZHdpbGwsCiAgICAgIHdvcmsgc3RvcHBhZ2UsIGNvbXB1dGVyIGZhaWx1cmUgb3IgbWFsZnVuY3Rpb24sIG9yIGFueSBhbmQgYWxsCiAgICAgIG90aGVyIGNvbW1lcmNpYWwgZGFtYWdlcyBvciBsb3NzZXMpLCBldmVuIGlmIHN1Y2ggQ29udHJpYnV0b3IKICAgICAgaGFzIGJlZW4gYWR2aXNlZCBvZiB0aGUgcG9zc2liaWxpdHkgb2Ygc3VjaCBkYW1hZ2VzLgoKICAgOS4gQWNjZXB0aW5nIFdhcnJhbnR5IG9yIEFkZGl0aW9uYWwgTGlhYmlsaXR5LiBXaGlsZSByZWRpc3RyaWJ1dGluZwogICAgICB0aGUgV29yayBvciBEZXJpdmF0aXZlIFdvcmtzIHRoZXJlb2YsIFlvdSBtYXkgY2hvb3NlIHRvIG9mZmVyLAogICAgICBhbmQgY2hhcmdlIGEgZmVlIGZvciwgYWNjZXB0YW5jZSBvZiBzdXBwb3J0LCB3YXJyYW50eSwgaW5kZW1uaXR5LAogICAgICBvciBvdGhlciBsaWFiaWxpdHkgb2JsaWdhdGlvbnMgYW5kL29yIHJpZ2h0cyBjb25zaXN0ZW50IHdpdGggdGhpcwogICAgICBMaWNlbnNlLiBIb3dldmVyLCBpbiBhY2NlcHRpbmcgc3VjaCBvYmxpZ2F0aW9ucywgWW91IG1heSBhY3Qgb25seQogICAgICBvbiBZb3VyIG93biBiZWhhbGYgYW5kIG9uIFlvdXIgc29sZSByZXNwb25zaWJpbGl0eSwgbm90IG9uIGJlaGFsZgogICAgICBvZiBhbnkgb3RoZXIgQ29udHJpYnV0b3IsIGFuZCBvbmx5IGlmIFlvdSBhZ3JlZSB0byBpbmRlbW5pZnksCiAgICAgIGRlZmVuZCwgYW5kIGhvbGQgZWFjaCBDb250cmlidXRvciBoYXJtbGVzcyBmb3IgYW55IGxpYWJpbGl0eQogICAgICBpbmN1cnJlZCBieSwgb3IgY2xhaW1zIGFzc2VydGVkIGFnYWluc3QsIHN1Y2ggQ29udHJpYnV0b3IgYnkgcmVhc29uCiAgICAgIG9mIHlvdXIgYWNjZXB0aW5nIGFueSBzdWNoIHdhcnJhbnR5IG9yIGFkZGl0aW9uYWwgbGlhYmlsaXR5LgoKICAgRU5EIE9GIFRFUk1TIEFORCBDT05ESVRJT05TCgogICBBUFBFTkRJWDogSG93IHRvIGFwcGx5IHRoZSBBcGFjaGUgTGljZW5zZSB0byB5b3VyIHdvcmsuCgogICAgICBUbyBhcHBseSB0aGUgQXBhY2hlIExpY2Vuc2UgdG8geW91ciB3b3JrLCBhdHRhY2ggdGhlIGZvbGxvd2luZwogICAgICBib2lsZXJwbGF0ZSBub3RpY2UsIHdpdGggdGhlIGZpZWxkcyBlbmNsb3NlZCBieSBicmFja2V0cyAiW10iCiAgICAgIHJlcGxhY2VkIHdpdGggeW91ciBvd24gaWRlbnRpZnlpbmcgaW5mb3JtYXRpb24uIChEb24ndCBpbmNsdWRlCiAgICAgIHRoZSBicmFja2V0cyEpICBUaGUgdGV4dCBzaG91bGQgYmUgZW5jbG9zZWQgaW4gdGhlIGFwcHJvcHJpYXRlCiAgICAgIGNvbW1lbnQgc3ludGF4IGZvciB0aGUgZmlsZSBmb3JtYXQuIFdlIGFsc28gcmVjb21tZW5kIHRoYXQgYQogICAgICBmaWxlIG9yIGNsYXNzIG5hbWUgYW5kIGRlc2NyaXB0aW9uIG9mIHB1cnBvc2UgYmUgaW5jbHVkZWQgb24gdGhlCiAgICAgIHNhbWUgInByaW50ZWQgcGFnZSIgYXMgdGhlIGNvcHlyaWdodCBub3RpY2UgZm9yIGVhc2llcgogICAgICBpZGVudGlmaWNhdGlvbiB3aXRoaW4gdGhpcmQtcGFydHkgYXJjaGl2ZXMuCgogICBDb3B5cmlnaHQgW3l5eXldIFtuYW1lIG9mIGNvcHlyaWdodCBvd25lcl0KCiAgIExpY2Vuc2VkIHVuZGVyIHRoZSBBcGFjaGUgTGljZW5zZSwgVmVyc2lvbiAyLjAgKHRoZSAiTGljZW5zZSIpOwogICB5b3UgbWF5IG5vdCB1c2UgdGhpcyBmaWxlIGV4Y2VwdCBpbiBjb21wbGlhbmNlIHdpdGggdGhlIExpY2Vuc2UuCiAgIFlvdSBtYXkgb2J0YWluIGEgY29weSBvZiB0aGUgTGljZW5zZSBhdAoKICAgICAgIGh0dHA6Ly93d3cuYXBhY2hlLm9yZy9saWNlbnNlcy9MSUNFTlNFLTIuMAoKICAgVW5sZXNzIHJlcXVpcmVkIGJ5IGFwcGxpY2FibGUgbGF3IG9yIGFncmVlZCB0byBpbiB3cml0aW5nLCBzb2Z0d2FyZQogICBkaXN0cmlidXRlZCB1bmRlciB0aGUgTGljZW5zZSBpcyBkaXN0cmlidXRlZCBvbiBhbiAiQVMgSVMiIEJBU0lTLAogICBXSVRIT1VUIFdBUlJBTlRJRVMgT1IgQ09ORElUSU9OUyBPRiBBTlkgS0lORCwgZWl0aGVyIGV4cHJlc3Mgb3IgaW1wbGllZC4KICAgU2VlIHRoZSBMaWNlbnNlIGZvciB0aGUgc3BlY2lmaWMgbGFuZ3VhZ2UgZ292ZXJuaW5nIHBlcm1pc3Npb25zIGFuZAogICBsaW1pdGF0aW9ucyB1bmRlciB0aGUgTGljZW5zZS4="
                    },
                    "url": "https://www.apache.org/licenses/LICENSE-2.0.txt"
                  }
                }
              ],
              "purl": "pkg:maven/com.acme/tomcat-catalina@9.0.14?packaging=jar",
              "pedigree": {
                "ancestors": [
                  {
                    "type": "application",
                    "author": "Apache Super Heros",
                    "publisher": "Apache",
                    "group": "org.apache.tomcat",
                    "name": "tomcat-catalina",
                    "version": "9.0.14",
                    "description": "Apache Catalina",
                    "licenses": [
                      {
                        "license": {
                          "id": "Apache-2.0"
                        }
                      }
                    ],
                    "purl": "pkg:maven/org.apache.tomcat/tomcat-catalina@9.0.14?packaging=jar"
                  }
                ],
                "commits": [
                  {
                    "uid": "7638417db6d59f3c431d3e1f261cc637155684cd",
                    "url": "https://location/to/7638417db6d59f3c431d3e1f261cc637155684cd",
                    "author": {
                      "timestamp": "2018-11-13T20:20:39+00:00",
                      "name": "John Doe",
                      "email": "john.doe@example.com"
                    },
                    "committer": {
                      "timestamp": "2018-11-07T22:01:45Z",
                      "name": "Jane Doe",
                      "email": "jane.doe@example.com"
                    },
                    "message": "Initial commit"
                  }
                ],
                "notes": "Commentary here"
              }
            },
            {
              "type": "library",
              "bom-ref": "pkg:maven/com.example/myapplication@1.0.0?packaging=war",
              "supplier": {
                "name": "Example, Inc.",
                "url": [
                  "https://example.com",
                  "https://example.net"
                ],
                "contact": [
                  {
                    "name": "Example Support AMER",
                    "email": "support@example.com",
                    "phone": "800-555-1212"
                  },
                  {
                    "name": "Example Support APAC",
                    "email": "support@apac.example.com"
                  }
                ]
              },
              "manufacturer": {
                "name": "Example-2, Inc.",
                "url": [
                  "https://example.org"
                ],
                "contact": [
                  {
                    "email": "support@example.org"
                  }
                ]
              },
              "authors": [
                {
                  "name": "Anthony Edward Stark",
                  "phone": "555-212-970-4133",
                  "email": "ironman@example.org"
                },
                {
                  "name": "Peter Benjamin Parker",
                  "email": "spiderman@example.org"
                }
              ],
              "group": "org.example",
              "name": "mylibrary",
              "version": "1.0.0",
              "scope": "required",
              "hashes": [
                {
                  "alg": "MD5",
                  "content": "2342c2eaf1feb9a80195dbaddf2ebaa3"
                },
                {
                  "alg": "SHA-1",
                  "content": "68b78babe00a053f9e35ec6a2d9080f5b90122b0"
                },
                {
                  "alg": "SHA-256",
                  "content": "708f1f53b41f11f02d12a11b1a38d2905d47b099afc71a0f1124ef8582ec7313"
                },
                {
                  "alg": "SHA-512",
                  "content": "387b7ae16b9cae45f830671541539bf544202faae5aac544a93b7b0a04f5f846fa2f4e81ef3f1677e13aed7496408a441f5657ab6d54423e56bf6f38da124aef"
                }
              ],
              "licenses": [
                {
                  "expression": "EPL-2.0 OR GPL-2.0-with-classpath-exception"
                }
              ],
              "copyright": "Copyright Example Inc. All rights reserved.",
              "cpe": "cpe:/a:example:myapplication:1.0.0",
              "purl": "pkg:maven/com.example/myapplication@1.0.0?packaging=war",
              "modified": false,
              "externalReferences": [
                {
                  "url": "http://example.org/docs",
                  "type": "documentation",
                  "comment": "All component versions are documented here"
                },
                {
                  "url": "http://example.org/security",
                  "type": "advisories"
                }
              ]
            },
            {
              "type": "framework",
              "author": "Example Super Heros",
              "group": "com.example",
              "name": "myframework",
              "version": "1.0.0",
              "description": "Example Inc, enterprise framework",
              "scope": "required",
              "hashes": [
                {
                  "alg": "MD5",
                  "content": "cfcb0b64aacd2f81c1cd546543de965a"
                },
                {
                  "alg": "SHA-1",
                  "content": "7fbeef2346c45d565c3341f037bce4e088af8a52"
                },
                {
                  "alg": "SHA-256",
                  "content": "0384db3cec55d86a6898c489fdb75a8e75fe66b26639634983d2f3c3558493d1"
                },
                {
                  "alg": "SHA-512",
                  "content": "854909cdb9e3ca183056837144aab6d8069b377bd66445087cc7157bf0c3f620418705dd0b83bdc2f73a508c2bdb316ca1809d75ee6972d02023a3e7dd655c79"
                }
              ],
              "licenses": [
                {
                  "license": {
                    "name": "Some random license"
                  }
                }
              ],
              "purl": "pkg:maven/com.example/myframework@1.0.0?packaging=war",
              "modified": false,
              "externalReferences": [
                {
                  "type": "website",
                  "url": "http://example.com/myframework"
                },
                {
                  "type": "advisories",
                  "url": "http://example.com/security"
                }
              ]
            }
          ],
          "dependencies": [
            {
              "ref": "pkg:maven/com.acme/tomcat-catalina@9.0.14?packaging=jar",
              "dependsOn": [
                "pkg:maven/com.example/myapplication@1.0.0?packaging=war"
              ]
            }
          ]
        }
        """#

    static let minimalViable = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "components": [
            {
              "type": "library",
              "name": "acme-library"
            }
          ]
        }
        """#

    static let componentHashes = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "components": [
            {
              "type": "library",
              "name": "acme-example",
              "version": "1.0.0",
              "hashes": [
                {
                  "alg": "MD5",
                  "content": "641b6e166f8b33c5e959e2adcc18b1c7"
                },
                {
                  "alg": "SHA-1",
                  "content": "9188560f22e0b73070d2efce670c74af2bdf30af"
                },
                {
                  "alg": "SHA-256",
                  "content": "d88bc4e70bfb34d18b5542136639acbb26a8ae2429aa1e47489332fb389cc964"
                },
                {
                  "alg": "SHA-384",
                  "content": "d4835048a0f57c74b8fb617d5366ab81376fc92bebe9a93bf24ba7f9da6c9aeeb6179f5d1361f6533211b15f3224cbad"
                },
                {
                  "alg": "SHA-512",
                  "content": "74a51ff45e4c11df9ba1f0094282c80489649cb157a75fa337992d2d4592a5a1b8cb4525de8db0ae25233553924d76c36e093ea7fa9df4e5b8b07fd2e074efd6"
                },
                {
                  "alg": "SHA3-256",
                  "content": "7478c7cf41c883a04ee89f1813f687886d53fa86f791fff90690c6221e3853aa"
                },
                {
                  "alg": "SHA3-384",
                  "content": "a1eea7229716487ad2ebe96b2f997a8408f32f14047994fbcc99b49012cf86c96dbd518e5d57a61b0e57dd37dd0b48f5"
                },
                {
                  "alg": "SHA3-512",
                  "content": "7d584825bc1767dfabe7e82b45ccb7a1119b145fa17e76b885e71429c706cef0a3171bc6575b968eec5da56a7966c02fec5402fcee55097ac01d40c550de9d20"
                },
                {
                  "alg": "BLAKE2b-256",
                  "content": "d8779633380c050bccf4e733b763ab2abd8ad2db60b517d47fd29bbf76433237"
                },
                {
                  "alg": "BLAKE2b-384",
                  "content": "e728ba56c2da995a559a178116c594e8bee4894a79ceb4399d8f479e5563cb1942b85936f646d14170717c576b14db7a"
                },
                {
                  "alg": "BLAKE2b-512",
                  "content": "f8ce8d612a6c85c96cf7cebc230f6ddef26e6cedcfbc4a41c766033cc08c6ba097d1470948226807fb2d88d2a2b6fc0ff5e5440e93a603086fdd568bafcd1a9d"
                },
                {
                  "alg": "BLAKE3",
                  "content": "26cdc7fb3fd65fc3b621a4ef70bc7d2489d5c19e70c76cf7ec20e538df0047cf"
                }
              ]
            }
          ]
        }
        """#

    static let componentTypes = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "components": [
            {
              "type": "application",
              "name": "application-a",
              "version": "1.0"
            },
            {
              "type": "library",
              "name": "library-a",
              "version": "1.0"
            },
            {
              "type": "framework",
              "name": "framework-a",
              "version": "1.0"
            },
            {
              "type": "container",
              "name": "container-a",
              "version": "1.0"
            },
            {
              "type": "operating-system",
              "name": "operating-system-a",
              "version": "1.0"
            },
            {
              "type": "firmware",
              "name": "firmware-a",
              "version": "1.0"
            },
            {
              "type": "device",
              "name": "device-a",
              "version": "1.0"
            },
            {
              "type": "file",
              "name": "file-a",
              "version": "1.0"
            },
            {
              "type": "data",
              "name": "data-a",
              "version": "1.0"
            }
          ]
        }
        """#

    static let componentIdentifiers = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "components": [
            {
              "type": "library",
              "group": "com.example",
              "name": "acme-library",
              "version": "1.0.0",
              "cpe": "cpe:2.3:a:example:acme-library:1.0.0:*:*:*:*:*:*:*",
              "purl": "pkg:maven/com.example/acme-library@1.0.0",
              "omniborId": [
                "gitoid:blob:sha1:261eeb9e9f8b2b4b0d119366dda99c6fd7d35c64",
                "gitoid:blob:sha256:9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08"
              ],
              "swhid": [
                "swh:1:cnt:94a9ed024d3859793618152ea559a168bbcbb5e2",
                "swh:1:dir:d198bc9d7a6bcf6db04f476d29314f157507d505"
              ]
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
              "ref": "library-a",
              "dependsOn": []
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

    static let emptyComponents = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "components": [
          ]
        }
        """#

    static let externalReference = #"""
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
              "group": "org.example",
              "name": "mylibrary",
              "version": "1.0.0",
              "externalReferences": [
                {
                  "type": "advisories",
                  "url": "https://example.org/security/feed/csaf",
                  "comment": "Security advisories from the vendor"
                },
                {
                  "type": "bom",
                  "url": "https://example.org/support/sbom/portal-server/1.0.0",
                  "comment": "An external SBOM that describes what this component includes",
                  "hashes": [
                    {
                      "alg": "SHA-256",
                      "content": "708f1f53b41f11f02d12a11b1a38d2905d47b099afc71a0f1124ef8582ec7313"
                    }
                  ]
                },
                {
                  "type": "documentation",
                  "url": "https://example.org/support/documentation/portal-server/1.0.0",
                  "comment": "Vendor provided documentation for the product"
                }
              ]
            },
            {
              "type": "application",
              "name": "dummy",
              "description": "this component has all external reference types possible",
              "externalReferences": [
                {
                  "type": "vcs",
                  "url": "http://example.com/extref/vcs"
                },
                {
                  "type": "issue-tracker",
                  "url": "http://example.com/extref/issue-tracker"
                },
                {
                  "type": "website",
                  "url": "http://example.com/extref/website"
                },
                {
                  "type": "advisories",
                  "url": "http://example.com/extref/advisories"
                },
                {
                  "type": "bom",
                  "url": "http://example.com/extref/bom"
                },
                {
                  "type": "mailing-list",
                  "url": "http://example.com/extref/mailing-list"
                },
                {
                  "type": "social",
                  "url": "http://example.com/extref/social"
                },
                {
                  "type": "chat",
                  "url": "http://example.com/extref/chat"
                },
                {
                  "type": "documentation",
                  "url": "http://example.com/extref/documentation"
                },
                {
                  "type": "support",
                  "url": "http://example.com/extref/support"
                },
                {
                  "type": "source-distribution",
                  "url": "http://example.com/extref/source-distribution"
                },
                {
                  "type": "distribution",
                  "url": "http://example.com/extref/distribution"
                },
                {
                  "type": "distribution-intake",
                  "url": "http://example.com/extref/distribution-intake"
                },
                {
                  "type": "license",
                  "url": "http://example.com/extref/license"
                },
                {
                  "type": "build-meta",
                  "url": "http://example.com/extref/build-meta"
                },
                {
                  "type": "build-system",
                  "url": "http://example.com/extref/build-system"
                },
                {
                  "type": "release-notes",
                  "url": "http://example.com/extref/release-notes"
                },
                {
                  "type": "security-contact",
                  "url": "http://example.com/extref/security-contact"
                },
                {
                  "type": "model-card",
                  "url": "http://example.com/extref/model-card"
                },
                {
                  "type": "log",
                  "url": "http://example.com/extref/log"
                },
                {
                  "type": "configuration",
                  "url": "http://example.com/extref/configuration"
                },
                {
                  "type": "evidence",
                  "url": "http://example.com/extref/evidence"
                },
                {
                  "type": "formulation",
                  "url": "http://example.com/extref/formulation"
                },
                {
                  "type": "attestation",
                  "url": "http://example.com/extref/attestation"
                },
                {
                  "type": "threat-model",
                  "url": "http://example.com/extref/threat-model"
                },
                {
                  "type": "adversary-model",
                  "url": "http://example.com/extref/adversary-model"
                },
                {
                  "type": "risk-assessment",
                  "url": "http://example.com/extref/risk-assessment"
                },
                {
                  "type": "vulnerability-assertion",
                  "url": "http://example.com/extref/vulnerability-assertion"
                },
                {
                  "type": "exploitability-statement",
                  "url": "http://example.com/extref/exploitability-statement"
                },
                {
                  "type": "pentest-report",
                  "url": "http://example.com/extref/pentest-report"
                },
                {
                  "type": "static-analysis-report",
                  "url": "http://example.com/extref/static-analysis-report"
                },
                {
                  "type": "dynamic-analysis-report",
                  "url": "http://example.com/extref/dynamic-analysis-report"
                },
                {
                  "type": "runtime-analysis-report",
                  "url": "http://example.com/extref/runtime-analysis-report"
                },
                {
                  "type": "component-analysis-report",
                  "url": "http://example.com/extref/component-analysis-report"
                },
                {
                  "type": "maturity-report",
                  "url": "http://example.com/extref/maturity-report"
                },
                {
                  "type": "certification-report",
                  "url": "http://example.com/extref/certification-report"
                },
                {
                  "type": "quality-metrics",
                  "url": "http://example.com/extref/quality-metrics"
                },
                {
                  "type": "codified-infrastructure",
                  "url": "http://example.com/extref/codified-infrastructure"
                },
                {
                  "type": "poam",
                  "url": "http://example.com/extref/poam"
                },
                {
                  "type": "electronic-signature",
                  "url": "http://example.com/extref/electronic-signature"
                },
                {
                  "type": "digital-signature",
                  "url": "http://example.com/extref/digital-signature"
                },
                {
                  "type": "rfc-9116",
                  "url": "http://example.com/extref/rfc-9116"
                },
                {
                  "type": "other",
                  "url": "http://example.com/extref/other"
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
          "serialNumber": "urn:uuid:b1ef52c6-7cd8-43d5-9e42-5e69044bbe9e",
          "version": 1,
          "components": [
            {
              "type": "application",
              "publisher": "Acme Inc",
              "group": "com.acme",
              "name": "tomcat-catalina",
              "version": "9.0.14",
              "description": "Modified version of Apache Catalina",
              "scope": "required",
              "licenses": [
                {
                  "license": {
                    "id": "Apache-2.0"
                  }
                },
                {
                  "expression": "EPL-2.0 OR GPL-2.0 WITH Classpath-exception-2.0"
                },
                {
                  "license": {
                    "name": "My Own License",
                    "text": {
                      "content": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
                    }
                  }
                },
                {
                  "expression": "LicenseRef-MIT-Style-2",
                  "expressionDetails": [
                    {
                      "licenseIdentifier": "LicenseRef-MIT-Style-2",
                      "url": "https://example.com/license"
                    }
                  ]
                }
              ]
            }
          ]
        }
        """#

    static let licenseExpression = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "components": [
            {
              "type": "application",
              "publisher": "Acme Inc",
              "group": "com.acme",
              "name": "tomcat-catalina",
              "version": "9.0.14",
              "description": "Modified version of Apache Catalina",
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
                  "content": "e8f33e424f3f4ed6db76a482fde1a5298970e442c531729119e37991884bdffab4f9426b7ee11fccd074eeda0634d71697d6f88a460dce0ac8d627a29f7d1282"
                }
              ],
              "licenses": [
                {
                  "expression": "EPL-2.0 OR GPL-2.0 WITH Classpath-exception-2.0",
                  "acknowledgement": "declared",
                  "bom-ref": "my-license"
                }
              ],
              "purl": "pkg:maven/com.acme/tomcat-catalina@9.0.14?packaging=jar"
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
              "type": "application",
              "publisher": "Acme Inc",
              "group": "com.acme",
              "name": "tomcat-catalina",
              "version": "9.0.14",
              "description": "Modified version of Apache Catalina",
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
                  "content": "e8f33e424f3f4ed6db76a482fde1a5298970e442c531729119e37991884bdffab4f9426b7ee11fccd074eeda0634d71697d6f88a460dce0ac8d627a29f7d1282"
                }
              ],
              "licenses": [
                {
                  "license": {
                    "id": "Apache-2.0",
                    "acknowledgement": "declared",
                    "bom-ref": "my-license"
                  }
                }
              ],
              "purl": "pkg:maven/com.acme/tomcat-catalina@9.0.14?packaging=jar"
            }
          ]
        }
        """#

    static let licenseName = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "components": [
            {
              "type": "application",
              "publisher": "Acme Inc",
              "group": "com.acme",
              "name": "tomcat-catalina",
              "version": "9.0.14",
              "description": "Modified version of Apache Catalina",
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
                  "content": "e8f33e424f3f4ed6db76a482fde1a5298970e442c531729119e37991884bdffab4f9426b7ee11fccd074eeda0634d71697d6f88a460dce0ac8d627a29f7d1282"
                }
              ],
              "licenses": [
                {
                  "license": {
                    "name": "Apache License 2.0",
                    "bom-ref": "my-license"
                  }
                }
              ],
              "purl": "pkg:maven/com.acme/tomcat-catalina@9.0.14?packaging=jar"
            }
          ]
        }
        """#

    static let metadataAuthor = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "metadata": {
            "authors": [
              {
                "name": "Samantha Wright",
                "email": "samantha.wright@example.com",
                "phone": "800-555-1212"
              }
            ]
          },
          "components": []
        }
        """#

    static let metadataLifecycle = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "metadata": {
            "lifecycles": [
              {
                "phase": "build"
              },
              {
                "phase": "post-build"
              },
              {
                "name": "platform-integration-testing",
                "description": "Integration testing specific to the runtime platform"
              }
            ]
          },
          "components": []
        }
        """#

    static let metadataManufacturer = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "metadata": {
            "manufacturer": {
              "bom-ref": "manufacturer-1",
              "name": "Acme, Inc.",
              "url": [
                "https://example.com"
              ],
              "contact": [
                {
                  "bom-ref": "contact-1",
                  "name": "Acme Professional Services",
                  "email": "professional.services@example.com"
                }
              ]
            }
          },
          "components": []
        }
        """#

    static let metadataSupplier = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "metadata": {
            "supplier": {
              "bom-ref": "supplier-1",
              "name": "Acme, Inc.",
              "url": [
                "https://example.com"
              ],
              "contact": [
                {
                  "bom-ref": "contact-1",
                  "name": "Acme Distribution",
                  "email": "distribution@example.com"
                }
              ]
            }
          },
          "components": []
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
            "timestamp": "2020-04-13T20:20:39+00:00"
          },
          "components": []
        }
        """#

    static let metadataTool = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "metadata": {
            "tools": {
              "components": [
                {
                  "type": "application",
                  "group": "Awesome Vendor",
                  "name": "Awesome Tool",
                  "version": "9.1.2",
                  "hashes": [
                    {
                      "alg": "SHA-1",
                      "content": "25ed8e31b995bb927966616df2a42b979a2717f0"
                    },
                    {
                      "alg": "SHA-256",
                      "content": "a74f733635a19aefb1f73e5947cef59cd7440c6952ef0f03d09d974274cbd6df"
                    }
                  ]
                }
              ],
              "services": [
                {
                  "provider": {
                    "name": "Acme Org",
                    "url": [
                      "https://example.com"
                    ]
                  },
                  "group": "com.example",
                  "name": "Acme Signing Server",
                  "description": "Signs artifacts",
                  "endpoints": [
                    "https://example.com/sign",
                    "https://example.com/verify",
                    "https://example.com/tsa"
                  ]
                }
              ]
            }
          },
          "components": []
        }
        """#

    static let properties = #"""
        {
          "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
          "bomFormat": "CycloneDX",
          "specVersion": "1.7",
          "serialNumber": "urn:uuid:3e671687-395b-41f5-a30f-a58921a69b79",
          "version": 1,
          "metadata": {
            "properties": [
              {
                "name": "Foo",
                "value": "Bar"
              },
              {
                "name": "Foo",
                "value": "Two"
              },
              {
                "name": "Bar",
                "value": "Foo"
              },
              {
                "name": "value-is-optional"
              }
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
                        "name": "Foo",
                        "value": "Bar"
                      },
                      {
                        "name": "Foo",
                        "value": "Two"
                      },
                      {
                        "name": "Bar",
                        "value": "Foo"
                      },
                      {
                        "name": "value-is-optional"
                      }
                    ]
                  }
                }
              ],
              "properties": [
                {
                  "name": "Foo",
                  "value": "Bar"
                },
                {
                  "name": "Foo",
                  "value": "Two"
                },
                {
                  "name": "Bar",
                  "value": "Foo"
                },
                {
                  "name": "value-is-optional"
                }
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
                  "name": "Foo",
                  "value": "Bar"
                },
                {
                  "name": "Foo",
                  "value": "Two"
                },
                {
                  "name": "Bar",
                  "value": "Foo"
                },
                {
                  "name": "value-is-optional"
                }
              ]
            }
          ]
        }
        """#
}
