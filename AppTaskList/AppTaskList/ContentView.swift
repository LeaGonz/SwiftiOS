//
//  ContentView.swift
//  AppTaskList
//
//  Created by MultiLab PRT 14 on 25/03/2025.
//

import SwiftUI

struct ContentView: View {
    @State var formClicked = false
    
    let listTasks = TasksList().allTasks
    
    var body: some View {
        VStack{
            NavigationStack {
                List(listTasks){ task in
                    NavigationLink{
                        TasksListDetail(task: task)
                    }label:{
                        HStack{
                            Image(task.image)
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text(task.title)
                                .fontWeight(.bold)
                        }
                    }
                }
                .navigationTitle("Lista Tarefas")
            }
            .preferredColorScheme(.dark)
        }
        VStack{
            Button{
                formClicked = true
            }label:{
                Image(systemName: "widget.small.badge.plus")
                Text("Add Task")
                    .fontWeight(.bold)
            }.foregroundStyle(.green)
        }
        .sheet(isPresented: $formClicked){
            AddTask()
        }
    }
}

#Preview {
    ContentView()
}
