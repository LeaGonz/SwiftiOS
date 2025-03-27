//
//  TasksListDetail.swift
//  AppTaskList
//
//  Created by MultiLab PRT 14 on 25/03/2025.
//

import SwiftUI

struct TasksListDetail: View {
    @Environment(\.dismiss) var dismiss
    @Binding var allTasks: [Task]
    @State var formClicked = false
    @State var showAlert = false
    let task: Task

    var body: some View {
        VStack {

            Spacer()
            
            Text(task.title)
                .font(.title)
                .fontWeight(.bold)

            ZStack {

                Image(task.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
                    .offset(y: 0)
                    .cornerRadius(10)
            }
            .padding()

            Text(task.description)
                .padding()
                .multilineTextAlignment(.center)

            Spacer()

            HStack {

                Spacer()

                // Update function
                Button(action: {
                    formClicked = true
                }) {
                    Image(systemName: "pencil")
                    Text("Atualizar")
                }
                .fontWeight(.bold)
                .font(.title)
                .foregroundStyle(.green)
                .sheet(isPresented: $formClicked) {
                    UpdateTask(
                        allTasks: $allTasks, formClicked: $formClicked,
                        task: task)
                }

                Spacer()

                // Delete function
                Button(action: {
                    showAlert = true
                }) {
                    Image(systemName: "xmark.bin.fill")
                    Text("Apagar")
                }
                .fontWeight(.bold)
                .font(.title)
                .foregroundStyle(.red)
                .alert(
                    "Apagar Tarefa",
                    isPresented: $showAlert
                ) {
                    Button("Apagar") {
                        allTasks.removeAll(where: { at in at.id == task.id })
                        dismiss()
                    }
                    Button("Cancelar") {}
                } message: {
                    Text(
                        "Tem certeza que deseja apagar '\(task.title)'? Esta ação não pode ser desfeita."
                    )
                }

                Spacer()
            }

            Spacer()

        }
    }
}

#Preview {
    @State var allTasks: [Task] = []
    TasksListDetail(allTasks: $allTasks, task: TasksList().allTasksJSON[0])
}
