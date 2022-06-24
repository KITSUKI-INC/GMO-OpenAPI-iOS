import Foundation

public struct PublicQRCodeRequest: BaseModel {
    
    static var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy {
        return .useDefaultKeys
    }
    
    static var keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy {
        return .useDefaultKeys
    }
    
    let code: String
    let key: String
}
