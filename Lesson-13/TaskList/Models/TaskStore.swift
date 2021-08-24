import Combine
import Foundation

class TaskStore: ObservableObject {    
  @Published var prioritizedTasks: [PrioritizedTasks] = []
  
  init() {
    loadJSONPrioritizedTasks()
  }
  
  func getIndex(for priority: Task.Priority) -> Int {
    prioritizedTasks.firstIndex { $0.priority == priority }!
  }
  
  private func loadJSONPrioritizedTasks() {
    print(Bundle.main.bundleURL)
    print(FileManager.documentsDirectoryURL)
    
    let temporaryDirectoryURL = FileManager.default.temporaryDirectory
    print(temporaryDirectoryURL)
    
    let tasksJSONURL = URL(
      fileURLWithPath: "PrioritizedTasks",
      relativeTo: FileManager.documentsDirectoryURL
    ).appendingPathExtension("json")
    
    print((try? FileManager.default.contentsOfDirectory(atPath: FileManager.documentsDirectoryURL.path)) ?? [])
          
    let decoder = JSONDecoder()
    
    do {
      let tasksData = try Data(contentsOf: tasksJSONURL)
      
      prioritizedTasks = try decoder.decode([PrioritizedTasks].self, from: tasksData)
    } catch let error {
      print(error)
    }
  }
}

private extension TaskStore.PrioritizedTasks {
  init(priority: Task.Priority, names: [String]) {
    self.init(
      priority: priority,
      tasks: names.map { Task(name: $0) }
    )
  }
}
