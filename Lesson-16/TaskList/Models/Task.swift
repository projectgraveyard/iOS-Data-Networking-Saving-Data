import Foundation

struct Task: Identifiable, Codable {
  let id = UUID()
  
  var name: String
  var completed = false
  
  enum CodingKeys: String, CodingKey {
    case id = "identifier"
    case name
    case completed = "isComplete"
  }
}
