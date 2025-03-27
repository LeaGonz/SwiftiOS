//
//  ContentView.swift
//  AppTaskList
//
//  Created by MultiLab PRT 14 on 25/03/2025.
//

import SwiftUI

struct ContentView: View {
    @State var formClicked = false
    @State var listTasks = TasksList().allTasksJSON

    var body: some View {
        VStack {
            NavigationStack {
                List(listTasks) { task in
                    NavigationLink {
                        TasksListDetail(allTasks: $listTasks, task: task)
                    } label: {
                        HStack {
                            Image(task.image)
                                .resizable()
                                .frame(width: 100, height: 100)
                            Text(task.title)
                                .fontWeight(.bold)
                        }
                    }
                }
                .navigationTitle("Lista Tarefas")
                VStack {
                    Button {
                        formClicked = true
                    } label: {
                        Image(systemName: "document.badge.plus.fill")
                        Text("Adicionar Tarefa")
                    }
                    .foregroundStyle(.green)
                    .fontWeight(.bold)
                    .font(.title)
                }
                .sheet(isPresented: $formClicked) {
                    AddTask(allTasks: $listTasks, formClicked: $formClicked)
                }
            }
            .preferredColorScheme(.dark)

        }
    }
}

#Preview {
    ContentView()
}
