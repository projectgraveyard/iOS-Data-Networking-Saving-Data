import Foundation

let remindersDataUrl = URL(
  fileURLWithPath: "Reminders",
  relativeTo: FileManager.documentsDirectoryURL
)

let stringURL = FileManager.documentsDirectoryURL
  .appendingPathComponent("String")
  .appendingPathExtension("txt")

stringURL.path
