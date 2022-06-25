//
//  Todo.swift
//  To Do List
//
//  Created by    wuniutian on 25/6/22.
//

import Foundation

struct Todo: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted = false
    var details = ""
    
}
