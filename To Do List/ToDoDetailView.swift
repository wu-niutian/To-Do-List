//
//  ToDoDetailView.swift
//  To Do List
//
//  Created by    wuniutian on 25/6/22.
//

import SwiftUI

struct ToDoDetailView: View {
    @Binding var todo: Todo
    
    var body: some View {
        VStack{
            //TextField is kool!
            TextField("Todo tiitle", text: $todo.title)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .padding()
//                .background(Color(.systemGray2))
            
            Button{
                withAnimation{
                    todo.isCompleted.toggle()
                    
                }
            } label: {
                Text("Mark as \(todo.isCompleted ? "incompleted" : "completed" )")
            }
            .padding()
            
        }
    }
}

struct ToDoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoDetailView(todo: .constant(Todo(title: "Water the cat demo")))
    }
}
