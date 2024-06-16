import Foundation
import SwiftData
@Model
class TodoIteam: Identifiable {
    var id: String
    var name: String
    var isCheck : Bool = false
    var dueDate: Date
    
    init(name: String = "", dueData: Date = Date.now){
        id = UUID().uuidString
        self.name = name
        self.dueDate = dueData
    }
}
