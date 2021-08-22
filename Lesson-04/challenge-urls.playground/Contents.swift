import Foundation
//: ## Sample
let remindersDataURL = URL(fileURLWithPath: "Reminders", relativeTo: FileManager.documentsDirectoryURL)
//: ## URLs & Paths
let stringURL = FileManager.documentsDirectoryURL
  .appendingPathComponent("String")
  .appendingPathExtension("txt")

stringURL.path
//: ## Challenge
let challengeString: String = "cabbage"

let challengeURL: URL = URL(
  fileURLWithPath: challengeString,
  relativeTo: FileManager.documentsDirectoryURL
)
.appendingPathExtension("txt")

challengeURL.lastPathComponent
