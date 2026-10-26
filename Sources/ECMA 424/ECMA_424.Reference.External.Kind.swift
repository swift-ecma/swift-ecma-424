extension ECMA_424.Reference.External {
    public enum Kind: String, Sendable, Hashable, CaseIterable {
        case vcs
        case issueTracker = "issue-tracker"
        case website
        case advisories
        case bom
        case mailingList = "mailing-list"
        case social
        case chat
        case documentation
        case support
        case sourceDistribution = "source-distribution"
        case distribution
        case distributionIntake = "distribution-intake"
        case license
        case buildMeta = "build-meta"
        case buildSystem = "build-system"
        case releaseNotes = "release-notes"
        case securityContact = "security-contact"
        case modelCard = "model-card"
        case log
        case configuration
        case evidence
        case formulation
        case attestation
        case threatModel = "threat-model"
        case adversaryModel = "adversary-model"
        case riskAssessment = "risk-assessment"
        case vulnerabilityAssertion = "vulnerability-assertion"
        case exploitabilityStatement = "exploitability-statement"
        case pentestReport = "pentest-report"
        case staticAnalysisReport = "static-analysis-report"
        case dynamicAnalysisReport = "dynamic-analysis-report"
        case runtimeAnalysisReport = "runtime-analysis-report"
        case componentAnalysisReport = "component-analysis-report"
        case maturityReport = "maturity-report"
        case certificationReport = "certification-report"
        case codifiedInfrastructure = "codified-infrastructure"
        case qualityMetrics = "quality-metrics"
        case poam
        case electronicSignature = "electronic-signature"
        case digitalSignature = "digital-signature"
        case rfc9116 = "rfc-9116"
        case patent
        case patentFamily = "patent-family"
        case patentAssertion = "patent-assertion"
        case citation
        case other
    }
}
