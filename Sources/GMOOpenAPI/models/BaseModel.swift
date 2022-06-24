import Foundation

protocol BaseModel: Codable {
    
    static var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy { get }
    
    static var keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy { get }
}
