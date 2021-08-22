import Foundation

extension FileManager {
  public static var documentDirectoryURL: URL {
    `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
  }
}
