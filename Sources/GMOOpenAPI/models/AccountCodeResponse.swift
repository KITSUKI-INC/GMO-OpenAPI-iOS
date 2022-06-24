import Foundation

public struct AccountQRCodeResponse: BaseModel {
    static var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy {
        return .convertFromSnakeCase
    }
    
    static var keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy {
        return .convertToSnakeCase
    }
    
    let accountId: String
    let accountName: String
    let accountNameKana: String
    let accountNumber: String
    let accountTypeCode: String
    let accountTypeName: String
    let branchCode: String
    let branchName: String
    let currencyCode: String
    let currencyName: String
    let primaryAccountCode: String
    let primaryAccountCodeName: String
    let transferLimitAmount: String?
    let amount: String?
    let designatedDate: String?
    let qrcodeId: String
    let qrcodeType: String // -> accountType
}
