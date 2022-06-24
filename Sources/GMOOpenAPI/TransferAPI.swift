import Foundation

public class TransferAPI {
    
    @discardableResult
    static func corporation(model: TransferRequest, success: @escaping () -> Void, failure: @escaping (_ error: Error) -> Void) -> URLSessionDataTask? {
        return GMOOpenAPI.shared.postRequest(path: "/corporation/v1/transfer/request", body: model, success: success, failure: failure)
    }
    
    @discardableResult
    static func personal(model: TransferRequest, success: @escaping () -> Void, failure: @escaping (_ error: Error) -> Void) -> URLSessionDataTask? {
        return GMOOpenAPI.shared.postRequest(path: "/personal/v1/transfer/request", body: model, success: success, failure: failure)
    }
}
