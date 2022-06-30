//
//  NewTodoView.swift
//  To Do List
//
//  Created by    wuniutian on 25/6/22.
//

import SwiftUI
@State var todo = ""

@Binding var todos: [Todo]

@Environment(\.presentationMode) var presentationMode

struct NewwTodoView: View {
    var body: some View {
        Form {
            TextField("Task Name", text: $todo)
            
            Button("Save Todo") {
                // do sth magic to save to do
                todos.append(Todo(title: todo))
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct NewwTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewwTodoView(todos: .constant([]))
    }
}
