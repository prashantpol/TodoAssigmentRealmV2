//
//  SaveTodoViewController.swift
//  TodoAssigmentRealm
// id : 300906092

//  Created by Prashant Pol on 2017-02-21.
//  Copyright © 2017 Polorg. All rights reserved.
//

import UIKit
import RealmSwift

protocol SaveDelegate {
    func saveTask(data: Todo)
}

class SaveTodoViewController: UIViewController {

    @IBOutlet weak var lblnotes: UITextField!
    @IBOutlet weak var lblname: UITextField!
    var action :String = ""

    
    var rownum=0
    var name:String = ""
    var notes:String = ""
      var todos : [Todo] = []
    var todosingle :Todo = Todo()
    var delegate: SaveDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(todosingle.name)
        if(todosingle.name != nil)
        {
            lblname.text=todosingle.name
            lblnotes.text=todosingle.notes
        }
        
        let realm = try! Realm()
        todos =  Array(realm.objects(Todo.self))
        print(todos.count)
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btn_save(_ sender: UIButton) {
        print("Enter Here.....")

        let realm = try! Realm()
        
        if(action != "Save"){
            try! realm.write {
                //Updating Object Realm DB
                todosingle.name = lblname.text!
                todosingle.notes = lblnotes.text!
                //Calling delgate function in Tableview for updating List.
                delegate?.saveTask(data: todosingle)
                //Pop up last activity
                self.navigationController?.popViewController(animated: true)
             }
        }
        else{
            print("Saving.....")
            let newTodo=Todo()
            newTodo.name=lblname.text!
            newTodo.notes=lblnotes.text!
            newTodo.status=false
            // Persist your data easily
            try! realm.write {
                //Adding Object Realm DB
                realm.add(newTodo)
                //Calling delgate function in Tableview for updating List.
                delegate?.saveTask(data: newTodo)
                //Pop up last activity
                self.navigationController?.popViewController(animated: true)
                action = ""
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
