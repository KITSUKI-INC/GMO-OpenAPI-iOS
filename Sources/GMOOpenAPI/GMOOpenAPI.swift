import Foundation
import UIKit

public class GMOOpenAPI {
    
    public private(set) var configuration: Configuration?
    
    public static let shared = GMOOpenAPI()

    init() {
        print("GMO Open API Init !!")
    }

    public func setConfiguration(_ configuration: Configuration) {
        self.configuration = configuration
    }
    
    @discardableResult
    func getRequest<D: BaseModel>(path: String, success: @escaping (_ model: D) -> Void, failure: @escaping (_ error: Error) -> Void) -> URLSessionDataTask? {
        if configuration == nil {
            assertionFailure("GMO Open API Confifuration is nil.")
        }
            
        let url: URL = URL(string: "https://\(configuration!.host)")!.appendingPathComponent(path, isDirectory: false)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = configuration?.getAuthHeader()
        print(request.debugDescription)
        let sessionDataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                failure(error)
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = D.keyDecodingStrategy
                    let model = try decoder.decode(D.self, from: data)
                    success(model)
                } catch let jsonError {
                    failure(jsonError)
                }
            } else {
                failure(NSError(domain: "Response Data is None.", code: 9999))
            }
        }
        sessionDataTask.resume()
        return sessionDataTask
    }

    @discardableResult
    func getRequest<D: BaseModel, E: BaseModel>(path: String, queryParam: E, success: @escaping (_ model: D) -> Void, failure: @escaping (_ error: Error) -> Void) -> URLSessionDataTask? {
        if configuration == nil {
            assertionFailure("GMO Open API Confifuration is nil.")
        }
            
        var queryItems: [URLQueryItem] = []
        do {
            let encoder = JSONEncoder()
            encoder.keyEncodingStrategy = E.keyEncodingStrategy
            let jsonData = try encoder.encode(queryParam)
            let json = try JSONSerialization.jsonObject(with: jsonData) as! [String: Any]
            queryItems = json.map { (key: String, value: Any) in
                if value is String {
                    return URLQueryItem(name: key, value: value as? String)
                } else {
                    return URLQueryItem(name: key, value: "\(value)")
                }
            }
            
        } catch let jsonError {
            failure(jsonError)
            return nil
        }

        let url: URL = URL(string: configuration!.host)!.appendingPathComponent(path, isDirectory: false).queryItemsAdded(queryItems)!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = configuration?.getAuthHeader()
        print(request.debugDescription)
        let sessionDataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                failure(error)
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = D.keyDecodingStrategy
                    let model = try decoder.decode(D.self, from: data)
                    success(model)
                } catch let jsonError {
                    failure(jsonError)
                }
            } else {
                failure(NSError(domain: "Response Data is None.", code: 9999))
            }
        }
        sessionDataTask.resume()
        return sessionDataTask
    }

    @discardableResult
    func getRequest<E: BaseModel>(path: String, queryParam: E, success: @escaping (_ image: UIImage?) -> Void, failure: @escaping (_ error: Error) -> Void) -> URLSessionDataTask? {
        if configuration == nil {
            assertionFailure("GMO Open API Confifuration is nil.")
        }
            
        var queryItems: [URLQueryItem] = []
        do {
            let encoder = JSONEncoder()
            encoder.keyEncodingStrategy = E.keyEncodingStrategy
            let jsonData = try encoder.encode(queryParam)
            let json = try JSONSerialization.jsonObject(with: jsonData) as! [String: Any]
            queryItems = json.map { (key: String, value: Any) in
                if value is String {
                    return URLQueryItem(name: key, value: value as? String)
                } else {
                    return URLQueryItem(name: key, value: "\(value)")
                }
            }
            
        } catch let jsonError {
            failure(jsonError)
            return nil
        }

        let url: URL = URL(string: configuration!.host)!.appendingPathComponent(path, isDirectory: false).queryItemsAdded(queryItems)!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = configuration?.getAuthHeader()
        print(request.debugDescription)
        let sessionDataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                failure(error)
            } else if let data = data {
                success(UIImage(data: data))
            } else {
                failure(NSError(domain: "Response Data is None.", code: 9999))
            }
        }
        sessionDataTask.resume()
        return sessionDataTask
    }

    @discardableResult
    func postRequest<D: BaseModel, E: BaseModel>(path: String, body: E, success: @escaping (_ model: D) -> Void, failure: @escaping (_ error: Error) -> Void) -> URLSessionDataTask? {
        if configuration == nil {
            assertionFailure("GMO Open API Confifuration is nil.")
        }
        
        let url: URL = URL(string: configuration!.host)!.appendingPathComponent(path, isDirectory: false)
        var request = URLRequest(url: url)

        do {
            let encoder = JSONEncoder()
            encoder.keyEncodingStrategy = E.keyEncodingStrategy
            request.httpBody = try encoder.encode(body)
        } catch let jsonError {
            failure(jsonError)
            return nil
        }
        
        request.allHTTPHeaderFields = configuration?.getAuthHeader()
        print(request.debugDescription)
        return URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                failure(error)
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = D.keyDecodingStrategy
                    let model = try decoder.decode(D.self, from: data)
                    success(model)
                } catch let jsonError {
                    failure(jsonError)
                }
            } else {
                failure(NSError(domain: "Response Data is None.", code: 9999))
            }
        }
    }

    @discardableResult
    func postRequest<E: BaseModel>(path: String, body: E, success: @escaping () -> Void, failure: @escaping (_ error: Error) -> Void) -> URLSessionDataTask? {
        if configuration == nil {
            assertionFailure("GMO Open API Confifuration is nil.")
        }
        
        let url: URL = URL(string: configuration!.host)!.appendingPathComponent(path, isDirectory: false)
        var request = URLRequest(url: url)

        do {
            let encoder = JSONEncoder()
            encoder.keyEncodingStrategy = E.keyEncodingStrategy
            request.httpBody = try encoder.encode(body)
        } catch let jsonError {
            failure(jsonError)
            return nil
        }
        
        request.allHTTPHeaderFields = configuration?.getAuthHeader()
        print(request.debugDescription)
        return URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                failure(error)
            } else {
                if let httpResponse = response as? HTTPURLResponse {
                    if (httpResponse.statusCode == 200) {
                        success()
                    } else {
                        failure(NSError(domain: "Response Status Code is \(httpResponse.statusCode)", code: httpResponse.statusCode))
                    }
                } else {
                    failure(NSError(domain: "Response Data is None.", code: 9999))
                }
            }
        }
    }

    @discardableResult
    func postRequest<E: BaseModel>(path: String, body: E, success: @escaping (_ image: UIImage?) -> Void, failure: @escaping (_ error: Error) -> Void) -> URLSessionDataTask? {
        if configuration == nil {
            assertionFailure("GMO Open API Confifuration is nil.")
        }
        
        let url: URL = URL(string: configuration!.host)!.appendingPathComponent(path, isDirectory: false)
        var request = URLRequest(url: url)

        do {
            let encoder = JSONEncoder()
            encoder.keyEncodingStrategy = E.keyEncodingStrategy
            request.httpBody = try encoder.encode(body)
        } catch let jsonError {
            failure(jsonError)
            return nil
        }
        
        request.allHTTPHeaderFields = configuration?.getAuthHeader()
        print(request.debugDescription)
        return URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                failure(error)
            } else if let data = data {
                success(UIImage(data: data))
            } else {
                failure(NSError(domain: "Response Data is None.", code: 9999))
            }
        }
    }

}

extension GMOOpenAPI {
    public func reset(completionHandler: @escaping () -> Void) {
        URLSession.shared.reset(completionHandler: completionHandler)
    }
    
    public func flush(completionHandler: @escaping () -> Void) {
        URLSession.shared.flush(completionHandler: completionHandler)
    }
}

extension URL {

    // クエリを一つ追加した新しいURLを返す
    func queryItemAdded(name: String,  value: String?) -> URL? {
        return self.queryItemsAdded([URLQueryItem(name: name, value: value)])
    }

    // クエリを複数追加した新しいURLを返す
    func queryItemsAdded(_ queryItems: [URLQueryItem]) -> URL? {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: self.baseURL != nil) else {
            return nil
        }
        components.queryItems = queryItems + (components.queryItems ?? [])
        return components.url
    }
}
