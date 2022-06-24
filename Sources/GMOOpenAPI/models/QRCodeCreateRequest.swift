import Foundation

public struct QRCodeCreateRequest: BaseModel {
    static var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy {
        return .useDefaultKeys
    }
    
    static var keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy {
        return .useDefaultKeys
    }
    
    let accountId: String
    let amount: String?
    let designatedDate: String?
}
