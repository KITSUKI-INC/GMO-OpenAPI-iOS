public class Configuration {
    
    /// 開発環境モード
    private var DEVELOP = true

    private let HOST: String
    
    private let DEVELOP_HOST: String?
    
    /// GMO Aozora OpenAPI Auth にて取得できる アクセストークン
    /// 基本的には使用することがないパラメーターになります
    /// sunabar 管理コンソールから直接アクセストークンを取得する場合などに利用します
    private var ACCESS_TOKEN: String?
    
    /// アプリケーションによるユーザー識別ID
    /// ユーザーユニークである必要があります
    private var SESSION_ID: String?
    
    public init(host: String, developHost: String? = nil, develop: Bool = true) {
        HOST = host
        DEVELOP_HOST = developHost
        DEVELOP = develop
    }
    
    var host: String {
        if DEVELOP_HOST == nil {
            return HOST
        }
        
        if DEVELOP {
            return DEVELOP_HOST!
        }
        
        return HOST
    }
    
    
    func getAuthHeader() -> [String: String] {
        if let SESSION_ID = SESSION_ID {
            return ["sessionId": SESSION_ID]
        }
        
        if let ACCESS_TOKEN = ACCESS_TOKEN {
            return ["accessToken": ACCESS_TOKEN]
        }
        
        return [:]
    }
}

public extension Configuration {

    func setDevelop(_ develop: Bool) {
        DEVELOP = develop
    }

    func setAccessToken(accessToken: String) {
        ACCESS_TOKEN = accessToken
    }
    
    func setSessionId(sessionId: String) {
        SESSION_ID = sessionId
    }

}
