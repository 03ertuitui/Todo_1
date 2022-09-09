//
//  ViewController.swift
//  Todo_1
//
//  Created by 伊藤あかり on 2022/09/05.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource{
    
    @IBOutlet var table: UITableView!
    
    let realm = try! Realm()
    
    var receivelabel: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let Todo = realm.objects(Todo.self)
    
        print(Todo)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    //セルの個数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        let userData = realm.objects(Todo.self)
        
        return userData.count
        print(userData)
        
        
    }
    //セルの値を入力
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //セルの取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let userData = realm.objects(Todo.self)
        //表示する値の設定
        cell.textLabel?.text = "\(userData[indexPath.row].todo)"
        
        return cell
    }

}

