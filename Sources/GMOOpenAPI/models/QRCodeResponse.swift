import Foundation

public struct QRCodeResponse: BaseModel {
    static var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy {
        return .useDefaultKeys
    }
    
    static var keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy {
        return .useDefaultKeys
    }
    
    let iv: String
    let data: String
}
