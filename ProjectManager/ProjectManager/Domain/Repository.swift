import Foundation

class Repository: DataManager {
    private var workList: [Work] = []
    
    var todoList: [Work] {
        workList.filter { work in
            work.sort == .todo
        }
    }
    var doingList: [Work] {
        workList.filter { work in
            work.sort == .doing
        }
    }
    var doneList: [Work] {
        workList.filter { work in
            work.sort == .done
        }
    }
    
    init() {
        // Dummy Data
        let works: [Work] = [
            Work(title: "a", body: "a", dueDate: Date()),
            Work(title: "abdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasf",
                 body: """
                       asdfasdf
                       asdfasdf
                       asdfasdfasdf
                       asdfasdfasdf
                       sadfasdfasdf
                       asdf
                       asdf
                       asdf
                       asdfasdfasdf
                       asddfa
                       """,
                 dueDate: Date()),
            Work(title: "b", body: "c", dueDate: Date(), sort: .doing),
            Work(title: "bbbbb", body: "xxxxx", dueDate: Date(), sort: .done)
        ]
        workList = works
    }
    
    func create(_ data: Work) {
        workList.append(data)
    }
    
    func delete(_ data: Work) throws {
        guard let index = workList.firstIndex(where: { $0.id == data.id }) else { return }
        workList.remove(at: index)
    }
    
    func update(_ data: Work, title: String?, body: String?, date: Date?) {
        guard let index = workList.firstIndex(where: { $0.id == data.id }) else { return }
        workList[index].title = title
        workList[index].body = body
        workList[index].dueDate = date
    }
    
    func fetchAll() -> [Work] {
        return workList
    }
}
