extension ECMA_424.Component {
    public enum Kind: String, Sendable, Hashable, CaseIterable {
        case application
        case framework
        case library
        case container
        case platform
        case operatingSystem = "operating-system"
        case device
        case deviceDriver = "device-driver"
        case firmware
        case file
        case machineLearningModel = "machine-learning-model"
        case data
        case cryptographicAsset = "cryptographic-asset"
    }
}
