import Foundation

public struct TransferRequest: BaseModel {
    static var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy {
        return .useDefaultKeys
    }
    
    static var keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy {
        return .useDefaultKeys
    }
    
    let accountId: String
    let transferDesignatedDate: String
    let accountTypeCode: String
    let accountNumber: String
    let beneficiaryName: String
    let transferAmount: String
    let beneficiaryBankCode: String
    let beneficiaryBranchCode: String    
}
