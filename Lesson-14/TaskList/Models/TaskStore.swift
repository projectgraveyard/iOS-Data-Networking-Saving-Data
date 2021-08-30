import Combine
import Foundation

class TaskStore: ObservableObject {
  let tasksJSONURL = URL(
    fileURLWithPath: "PrioritizedTasks",
    relativeTo: FileManager.documentsDirectoryURL
  ).appendingPathExtension("json")
  
  @Published var prioritizedTasks: [PrioritizedTasks] = [] {
    didSet {saveJSONPrioritizedTask()}
  }
  
  init() {
    loadJSONPrioritizedTasks()
    //print(FileManager.documentsDirectoryURL)
  }
  
  func getIndex(for priority: Task.Priority) -> Int {
    prioritizedTasks.firstIndex { $0.priority == priority }!
  }
  
  private func loadJSONPrioritizedTasks() {
    let decoder = JSONDecoder()
    
    do {
      let tasksData = try Data(contentsOf: tasksJSONURL)
      prioritizedTasks = try decoder.decode([PrioritizedTasks].self, from: tasksData)
    } catch let error {
      print(error)
    }
  }
  
  private func saveJSONPrioritizedTask() {
    let encoder = JSONEncoder()
    do {
      let taskData = try encoder.encode(prioritizedTasks.first?.tasks.last)
      
      let taskJSONURL = URL(
        fileURLWithPath: "Task",
        relativeTo: FileManager.documentsDirectoryURL
      ).appendingPathExtension("json")
      
      try taskData.write(to: taskJSONURL, options: .atomicWrite)
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
