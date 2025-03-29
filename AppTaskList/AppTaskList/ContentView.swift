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
        ZStack {

            VStack {
                NavigationStack {
                    HStack {
                        // Tittle
                        Text("Lista Tarefas")
                            .font(.largeTitle)
                            .fontWeight(.bold)

                        Spacer()

                        // Dark / Light mode button
                        Button {
                            isDarkMode.toggle()
                        } label: {
                            Image(
                                systemName: isDarkMode
                                    ? "moon.fill" : "sun.max.fill")
                        }
                        .foregroundStyle(.yellow)
                        .fontWeight(.bold)
                        .font(.title)
                    }
                    .padding(.horizontal)

                    // Task List
                    List(allTasks) { task in
                        NavigationLink {
                            TasksListDetail(allTasks: $allTasks, task: task)
                        } label: {
                            HStack {
                                // Image
                                Image(task.image)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(10)
                                    .shadow(
                                        color: isDarkMode ? .white : .black,
                                        radius: 3
                                    )
                                    .padding(.vertical)

                                // Vertical space with title and category
                                VStack(alignment: .leading) {
                                    Text(task.title)
                                        .font(.title)
                                        .fontWeight(.bold)

                                    Text(task.category)
                                        .fontWeight(.ultraLight)
                                }
                                .padding(.leading, 10)
                                .multilineTextAlignment(.leading)

                                Spacer()
                            }
                        }
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                if let i = allTasks.firstIndex(where: { at in
                                    at.id == task.id
                                }) {
                                    allTasks.remove(at: i)
                                }
                            } label: {
                                Label("Apagar", systemImage: "trash")
                            }
                        }
                    }

                    HStack {

                        Spacer()

                        // Add function
                        Button {
                            formClicked = true
                        } label: {
                            Image(systemName: "plus.rectangle.fill")
                        }
                        .foregroundStyle(.green)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .sheet(isPresented: $formClicked) {
                            AddTask(
                                allTasks: $allTasks, formClicked: $formClicked)
                        }
                        Spacer()

                        // Delete All function
                        Button(action: {
                            showAlert = true
                        }) {
                            Image(systemName: "minus.rectangle.fill")
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

                        // All taks text on bottom
                        Text("Total Tarefas \(allTasks.count)")
                            .font(.callout)
                            .fontWeight(.light)

                        Spacer()
                        
                        // Info button
                        Button {
                            // FALTA CRIAR VIEW
                        } label: {
                            Image(systemName: "person.2.fill")
                        }
                        .foregroundStyle(isDarkMode ? .white : .black)
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

}

#Preview {
    ContentView()
}
