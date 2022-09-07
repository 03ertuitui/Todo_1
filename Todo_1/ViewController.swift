//
//  ViewController.swift
//  Todo_1
//
//  Created by 伊藤あかり on 2022/09/05.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{
    
    @IBOutlet var table: UITableView!
    
    
    var receivelabel: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
       
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = "テスト"
        
        return cell!
    }

}

