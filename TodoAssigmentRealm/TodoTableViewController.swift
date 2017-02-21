//
//  TodoTableViewController.swift
//  TodoAssigmentRealm
// id : 300906092
//  Created by Prashant Pol on 2017-02-21.
//  Copyright © 2017 Polorg. All rights reserved.
//

import UIKit
import RealmSwift

class TodoTableViewController:  UITableViewController {

    //var todo=[Todo]()
      var todos : [Todo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    
       
        //Loading Database data 
            print("testing")
       
       
    }
    
    func fetchData()
    {
        let realm = try! Realm()
        todos =  Array(realm.objects(Todo.self))
        print(todos.count)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
        
        self.tableView?.reloadData()   // ...and it is also visible here.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(todos.count)

        return todos.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomViewCell
         
        //configuring table cell
        
        let todo = self.todos[indexPath.row]

        cell.lblname.text=todo.name
        if(todo.status==true)
        {
            cell.switchTodo.setOn(true, animated: true)

        }
        
        cell.switchTodo.tag = indexPath.row
        cell.switchTodo.addTarget(self, action: #selector(TodoTableViewController.switchChanged(_:)), for: UIControlEvents.valueChanged)
        
        // Configure the cell...

        return cell
    }
    
    
    
    func switchChanged(_ mySwitch: UISwitch!) {
        let value = mySwitch.isOn
        print(value)
        print(mySwitch.tag)
        let realm = try! Realm()
        try! realm.write {
            todos[mySwitch.tag].status = value
        }
        // Do something
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier=="addSegue")
        {
             if let destinationViewController = segue.destination as? SaveTodoViewController {
                //            let indexPath = self.tableView.indexPathForSelectedRow
              //  let row = self.tableView.indexPathForSelectedRow!.row
                let action = "Save"
                
                destinationViewController.action = action
                
            }
        }
        else{
        if let destinationViewController = segue.destination as? SaveTodoViewController {
//            let indexPath = self.tableView.indexPathForSelectedRow
            let row = self.tableView.indexPathForSelectedRow!.row
            let name = todos[row].name;
     
            destinationViewController.todosingle = todos[row]

        }
        }
//        if segue.identifier == "editSegue" {
//            var nextScene =  segue.destination as! SaveTodoViewController
//            
//            // Pass the selected object to the new view controller.
//            if let indexPath = self.tableView.indexPathForSelectedRow {
//                let todosingle = todos[indexPath.row]
//                print(todosingle.name)
//                nextScene.todosingle = todosingle
//            }
//        }
        
        //print( self.tableView.indexPathForSelectedRow!.row)

       
        
        //if let dvc = segue.destination as? SaveTodoViewController {

        //Transfer data from one page to other
        //let row = self.tableView.indexPathForSelectedRow!.row
             // your new view controller should have property that will store passed value
         //   viewController.name = (todos[(self.tableView.indexPathForSelectedRow?.row)!] as AnyObject) as! String
         //}
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
