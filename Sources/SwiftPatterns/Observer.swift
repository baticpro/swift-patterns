import Foundation

protocol Subject {
    func add(observer: PropertyObserver)
    func remove(observer: PropertyObserver)
    func message(taskText: String)
}

protocol PropertyObserver {
    func makeTask(task: String)
    func getCurrentTask() -> String
}

class ProjectManager: Subject {
    var developerCollection = NSMutableSet()
    var clientTask = "" {
        didSet{
            message(taskText: clientTask)
        }
    }
    
    func add(observer: PropertyObserver) {
        developerCollection.add(observer)
    }
    
    func remove(observer: PropertyObserver) {
        developerCollection.remove(observer)
    }
    
    func message(taskText: String) {
        for developer in developerCollection{
            (developer as! PropertyObserver).makeTask(task: taskText)
        }
    }
}


class Developer: NSObject, PropertyObserver {
    private var currentTask = "sleep"
    
    func makeTask(task: String) {
        currentTask = task
    }
    
    func getCurrentTask() -> String {
        return currentTask
    }
}
