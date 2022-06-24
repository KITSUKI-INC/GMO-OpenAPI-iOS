import Foundation

public struct AccountsResponse: BaseModel {
    
    static var keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy {
        return .convertToSnakeCase
    }
    
    static var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy {
        return .convertFromSnakeCase
    }

    let accounts: [AccountModel]
}
