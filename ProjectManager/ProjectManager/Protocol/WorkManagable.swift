import Foundation


protocol WorkManagable {
    
    // MARK: - Properties
    var todoList: [Work] { get }
    var doingList: [Work] { get }
    var doneList: [Work] { get }
    
    // MARK: - Methods
    func create(title: String, body: String, dueDate: Date)
    func delete(_ data: Work)
    func update(_ data: Work, title: String?, body: String?, date: Date?, category: Int16)
    
}
