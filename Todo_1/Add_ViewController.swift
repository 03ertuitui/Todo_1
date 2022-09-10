//
//  Add_ViewController.swift
//  Todo_1
//
//  Created by 伊藤あかり on 2022/09/05.
//

import UIKit
import RealmSwift

class Add_ViewController: UIViewController {
    
    @IBOutlet var todotextField: UITextField!
    @IBOutlet var detailtextView:UITextView!
    
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let todolist: Todo? = read()
        
        todotextField.text = todolist?.todo
        detailtextView.text = todolist?.detail
        // Do any additional setup after loading the view.
    }
    
    func read() -> Todo? {
        return realm.objects(Todo.self).first
    }
    
   /* @IBAction func save (){
        let todo: String = todotextField.text!
        let detail: String = detailtextView.text!

        let todolist: Todo? = read()
        
        if todolist != nil {
            try! realm.write{
                todolist!.todo = todo
                todolist!.detail = detail}
            
        }else {
            let newtodolist = Todo()
                newtodolist.todo = todo
                newtodolist.detail = detail
                
                try! realm.write{
                    realm.add(newtodolist)}
            }
        
        let alert = UIAlertController(title: "成功", message: "保存しました", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
        self.navigationController?.popViewController(animated: true)
        
        }*/
    @IBAction func save() {
        let todo = Todo()
        todo.todo = todotextField.text!
        todo.detail = detailtextView.text!
        
        try! realm.write {
            realm.add(todo)
        }
        self.navigationController?.popToRootViewController(animated: true)

    }
    
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let ViewController: ViewController = segue.destination as! ViewController
       // ViewController.receivelabel = self.todo
    }
    }

    */
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
