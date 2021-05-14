import Foundation

struct NewsModel:Codable {
    let id: Int?
    let title, body: String?
    let date, time: String?
    let preview: String?
    let images: [Image]
}
struct Image: Codable {
    let id: Int
    let image: String
}
