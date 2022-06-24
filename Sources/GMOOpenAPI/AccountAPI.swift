import Foundation

public class AccountAPI {
    
    @discardableResult
    public static func corporation(success: @escaping (_ model: AccountsResponse) -> Void, failure: @escaping (_ error: Error) -> Void) -> URLSessionDataTask? {
        return GMOOpenAPI.shared.getRequest(path: "/corporation/v1/accounts", success: success, failure: failure)
    }
    
    @discardableResult
    public static func personal(success: @escaping (_ model: AccountsResponse) -> Void, failure: @escaping (_ error: Error) -> Void) -> URLSessionDataTask? {
        return GMOOpenAPI.shared.getRequest(path: "/personal/v1/accounts", success: success, failure: failure)
    }
}

