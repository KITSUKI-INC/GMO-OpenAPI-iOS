import Foundation

public struct AccountModel: BaseModel {
    
    static var keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy {
        return .convertToSnakeCase
    }
    
    static var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy {
        return .convertFromSnakeCase
    }
    
    
    var accountId: String
    var accountName: String
    var accountNameKana: String
    var accountNumber: String
    var accountTypeCode: String
    var accountTypeName: String
    var branchCode: String
    var branchName: String
    var currencyCode: String
    var currencyName: String
    var primaryAccountCode: String
    var primaryAccountCodeName: String
    var transferLimitAmount: String?
}
