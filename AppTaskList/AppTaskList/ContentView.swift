//
//  ContentView.swift
//  AppTaskList
//
//  Created by MultiLab PRT 14 on 25/03/2025.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false

    @State var formClicked = false
    @State var allTasks = TasksList().allTasksJSON
    @State var showAlert = false

    var body: some View {
        VStack {
            NavigationStack {
                List(allTasks) { task in
                    NavigationLink {
                        TasksListDetail(allTasks: $allTasks, task: task)
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

                Spacer()

                HStack {

                    Spacer()

                    // Add function
                    Button {
                        formClicked = true
                    } label: {
                        Image(systemName: "document.badge.plus.fill")
                    }
                    .foregroundStyle(.green)
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .sheet(isPresented: $formClicked) {
                        AddTask(allTasks: $allTasks, formClicked: $formClicked)
                    }

                    Spacer()

                    // Delete All function
                    Button(action: {
                        showAlert = true
                    }) {
                        Image(systemName: "xmark.bin.fill")
                    }
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .foregroundStyle(.red)
                    .alert(
                        "Apagar Todas as Tarefa",
                        isPresented: $showAlert
                    ) {
                        Button("Apagar") {
                            allTasks.removeAll()
                        }
                        Button("Cancelar") {}
                    } message: {
                        Text(
                            "Tem certeza que deseja apagar todas as tarefas? Esta ação não pode ser desfeita."
                        )
                    }

                    Spacer()

                    // Info button
                    Button {
                        //
                    } label: {
                        Image(systemName: "info.square.fill")
                    }
                    .foregroundStyle(.blue)
                    .fontWeight(.bold)
                    .font(.largeTitle)

                    Spacer()

                    // Dark / Light mode
                    Button {
                            isDarkMode.toggle()
                        } label: {
                            Image(systemName: isDarkMode ? "moon.fill" : "sun.max.fill")
                        }
                        .foregroundStyle(.yellow)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    

                    Spacer()
                }

                Spacer()

            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
            .multilineTextAlignment(.center)

        }

    }

}

#Preview {
    ContentView()
}
