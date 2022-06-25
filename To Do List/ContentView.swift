//
//  ContentView.swift
//  To Do List
//
//  Created by    wuniutian on 25/6/22.
//

import SwiftUI

struct ContentView: View {
    @State var todos = [
        Todo(title: "Watch some paw patrol!"),
        Todo(title: "Conduct a giveaway"),
        Todo(title: "Randomly deduct points")
    ]
    
    
    var body: some View {
        //NavigationView is going to contain every single thing
        NavigationView {
            List(todos) { todo in
                Text(todo.title)
                
            }
            .navigationTitle("My Important Things")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
