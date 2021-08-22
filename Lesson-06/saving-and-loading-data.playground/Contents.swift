import Foundation
//: ## Sample
let remindersDataURL = URL(fileURLWithPath: "Reminders", relativeTo: FileManager.documentsDirectoryURL)
//: ## URLs & Paths
let stringURL = FileManager.documentsDirectoryURL
  .appendingPathComponent("String")
  .appendingPathExtension("txt")

stringURL.path
//: ## Challenge
let challengeString: String = "To Do List"
let challengeURL: URL = URL(fileURLWithPath: challengeString,
                            relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("txt")

challengeURL.lastPathComponent
//: ## Data Types
//: ### Integers
//let age: UInt8 = 300
let age: UInt8 = 32
MemoryLayout.size(ofValue: age)
MemoryLayout<UInt8>.size
UInt8.min
UInt8.max

let height: Int8 = 72
MemoryLayout.size(ofValue: height)
Int8.min
Int8.max
//: ### Floats
let weight: Float = 154.5
MemoryLayout.size(ofValue: weight)
Float.leastNormalMagnitude
Float.greatestFiniteMagnitude
//: ### Doubles
let earthRadius: Double = 3958.8
MemoryLayout.size(ofValue: earthRadius)
Double.leastNormalMagnitude
Double.greatestFiniteMagnitude
//: ### Binary & Hexadecimal
let ageBinary: UInt8 = 0b0010_0000
let ageBinaryNegative: Int8 = -0b0010_0000
let weightHexadecimal: UInt16 = 0x9B
let weightHexadecimalNegative: Int16 = -0x9B
//: ## Bytes
let favoriteBytes: [UInt8] = [
  240,          159,          152,          184,
  240,          159,          152,          185,
  0b1111_0000,  0b1001_1111,  0b1001_1000,  186,
  0xF0,         0x9F,         0x98,         187
]

MemoryLayout<UInt8>.size * favoriteBytes.count
//: ## Saving & Loading Data
let favouriteByesData = Data(favoriteBytes)
let favouriteBytesURL = URL(
  fileURLWithPath: "Favourite Bytes",
  relativeTo: FileManager.documentsDirectoryURL
)
try favouriteByesData.write(to: favouriteBytesURL)
let savedFavouriteByesData = try Data(contentsOf: favouriteBytesURL)
let savedFavouriteByes = Array(savedFavouriteByesData)

favoriteBytes == savedFavouriteByes
favouriteByesData == savedFavouriteByesData
