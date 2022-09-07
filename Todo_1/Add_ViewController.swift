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
    @IBOutlet var limitdatapicker: UIDatePicker!
    
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let todoo: Todo? = read()
        
        
        todotextField.text = todoo?.todo
        detailtextView.text = todoo?.detail

        // Do any additional setup after loading the view.
    }
    func read() -> Todo? {
        return realm.objects(Todo.self).first
    }
    
    @IBAction func save (){
        let todo: String = todotextField.text!
        let detail: String = detailtextView.text!

        let todoo: Todo? = read()
        
        if todo != nil{
            try!realm.write{
                todoo!.todo = todo
                todoo!.detail = detail}
            
        }else {
                let newtodoo = Todo()
                newtodoo.todo = todo
                newtodoo.detail = detail
                
                try! realm.write{
                    realm.add(newtodoo)}
                
            }
        
        /*self.navigationController?.popViewController(animated: true)*/
        
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let ViewController: ViewController = segue.destination as! ViewController
        ViewController.receivelabel = self.todotextField
    }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

