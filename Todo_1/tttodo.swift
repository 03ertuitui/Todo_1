//
//  Todo.swift
//  Todo_1
//
//  Created by 伊藤あかり on 2022/09/05.
//

import Foundation
import RealmSwift

class Todo: Object{
    @objc dynamic var todo: String = ""
    @objc dynamic var detail: String = ""
   // @objc dynamic var day: Date 
}
