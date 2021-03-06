//
//  ContentView.swift
//  To Do List
//
//  Created by    wuniutian on 25/6/22.
//

import SwiftUI

struct ContentView: View {
    @State var todos = [
        Todo(title: "Watch some paw patrol!", isCompleted: true, details: "Episode 5 - 10"),
        Todo(title: "Pay attention to YJ in class"),
        Todo(title: "Go get free points in giveaways"),
        Todo(title: "Slap Ruiyi!!!")]
    
    @State var isSheetPresented = false
    
    @StateObject var todoManager = TodoManager()
    
    var body: some View {
        //NavigationView is going to contain every single thing
        NavigationView {
            List {
                ForEach($todoManager.todos) { $todo in
                    NavigationLink{
                        ToDoDetailView(todo: $todo)
                    } label: {
                        HStack {
                            Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                            //the WTF thing yes
                            
                            VStack (alignment: .leading) {
                                Text(todo.title)
                                    .font(.system(size: 15, weight: .bold, design: .serif))
                                    .strikethrough(todo.isCompleted)
                                    .foregroundColor(todo.isCompleted ? .green : .red)
                                    .cornerRadius(10)
                                if !todo.details.isEmpty {
                                    Text(todo.details)
                                        .font(.caption)
                                        .foregroundColor(.black)
                                    
                                }
                            }
                        }
                    }
                }.onDelete { indexSet in
                    todoManager.todos.remove(atOffsets: indexSet)
                }
                .onMove { indices, newOffset in
                    todoManager.todos.move(fromOffsets: indices, toOffset: newOffset)
                    
                }
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                    // EditButton is a special thing to use directly
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isSheetPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $isSheetPresented) {
            NewTodoView(todos: $todoManager.todos)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
