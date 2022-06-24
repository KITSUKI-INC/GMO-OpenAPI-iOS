import Foundation
import UIKit

public class QRCodeAPI {

    @discardableResult
    public static func publicAccount(model: PublicQRCodeRequest, success: @escaping (_ model: AccountQRCodeResponse) -> Void, failure: @escaping (_ error: Error) -> Void) -> URLSessionDataTask? {
        return GMOOpenAPI.shared.getRequest(path: "/v1/qrcode/account/public", queryParam: model,  success: success, failure: failure)
    }

    @discardableResult
    public static func account(model: QRCodeRequest, success: @escaping (_ model: QRCodeResponse) -> Void, failure: @escaping (_ error: Error) -> Void) -> URLSessionDataTask? {
        return GMOOpenAPI.shared.getRequest(path: "/v1/qrcode/account", queryParam: model,  success: success, failure: failure)
    }
    
    @discardableResult
    public static func createCorporationQRCode(model: QRCodeCreateRequest, success: @escaping (_ image: UIImage?) -> Void, failure: @escaping (_ error: Error) -> Void) -> URLSessionDataTask? {
        return GMOOpenAPI.shared.postRequest(path: "/corporation/v1/qrcode/create", body: model,  success: success, failure: failure)

    }

    @discardableResult
    public static func createPersonalQRCode(model: QRCodeCreateRequest, success: @escaping (_ image: UIImage?) -> Void, failure: @escaping (_ error: Error) -> Void) -> URLSessionDataTask? {
        return GMOOpenAPI.shared.postRequest(path: "/personal/v1/qrcode/create", body: model,  success: success, failure: failure)

    }

    @discardableResult
    public static func createCorporationPublicQRCode(model: QRCodeCreateRequest, success: @escaping (_ image: UIImage?) -> Void, failure: @escaping (_ error: Error) -> Void) -> URLSessionDataTask? {
        return GMOOpenAPI.shared.postRequest(path: "/corporation/v1/qrcode/create/public", body: model,  success: success, failure: failure)

    }

    @discardableResult
    public static func createPersonalPublicQRCode(model: QRCodeCreateRequest, success: @escaping (_ image: UIImage?) -> Void, failure: @escaping (_ error: Error) -> Void) -> URLSessionDataTask? {
        return GMOOpenAPI.shared.postRequest(path: "/personal/v1/qrcode/create/public", body: model,  success: success, failure: failure)

    }
}
