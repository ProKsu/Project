
import Foundation

//var ToDoItems: [[String: Any]] = [["Name" : "Call mum", "isCompleted" : true], ["Name" : "Create the app", "isCompleted" : false], ["Name" : "Discuss with friends", "isCompleted" : true] ]

var ToDoItems: [[String: Any]] {
    set {
       
        UserDefaults.standard.set(newValue, forKey: "ToDoDataKey")
        UserDefaults.standard.synchronize()
        
    }
    get {
        if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String:Any]]{
            //print("hello i am here")
            return array
        } else {
            return []
        }
  }
}

func addItem(nameItem:String , isCompleted: Bool = false){
    ToDoItems.append(["Name" : nameItem, "isCompleted": isCompleted])
   // saveData()
    
}

func removeItem(at index: Int){
    ToDoItems.remove(at: index)
   // saveData()
    
}

func moveItem(fromIndex: Int , toIndex: Int ){
    let from = ToDoItems[fromIndex]
    ToDoItems.remove(at: fromIndex)
    ToDoItems.insert(from, at: toIndex)
}

func changeState(at item: Int) -> Bool{
    
    ToDoItems[item]["isCompleted"] = !(ToDoItems[item]["isCompleted"]  as! Bool)
   // saveData()
    return ToDoItems[item]["isCompleted"] as! Bool

}

//func saveData(){
//    UserDefaults.standard.set(ToDoItems, forKey: "ToDoDataKey")
//    UserDefaults.standard.synchronize()
//    
//}
//
//func loadData(){
//    if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String:Any]]{
//        ToDoItems = array
//    }else {
//        ToDoItems = []
//    }
//}
