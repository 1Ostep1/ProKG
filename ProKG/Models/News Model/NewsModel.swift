import Foundation

struct NewsModel: Codable {
  let user : Int?
  let title : String?
  let image : String?
  let createdAt : String?
  let text : String?
  
  enum CodingKeys: String, CodingKey {
    
    case user
    case title
    case image 
    case createdAt = "created_at"
    case text
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    user = try? values.decodeIfPresent(Int.self, forKey: .user)
    title = try? values.decodeIfPresent(String.self, forKey: .title)
    image = try? values.decodeIfPresent(String.self, forKey: .image)
    createdAt = try? values.decodeIfPresent(String.self, forKey: .createdAt)
    text = try? values.decodeIfPresent(String.self, forKey: .text)
  }
}
