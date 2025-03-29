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

            // Title
            Text(task.title)
                .font(.title)
                .fontWeight(.bold)

            // Category
            Text(task.category)
                .fontWeight(.ultraLight)
                .multilineTextAlignment(.center)

            // Image and description
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
                    Text("Atualizar")
                        .padding()
                }
                .frame(maxWidth: .infinity)
                .background(.green)
                .cornerRadius(40)
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .font(.callout)
                .sheet(isPresented: $formClicked) {
                    UpdateTask(
                        allTasks: $allTasks, formClicked: $formClicked,
                        task: task)
                }

                // Delete function
                Button(action: {
                    showAlert = true
                }) {
                    Text("Apagar")
                        .padding()
                }
                .frame(maxWidth: .infinity)
                .background(.red)
                .cornerRadius(40)
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .font(.callout)
                .alert(
                    "Apagar Tarefa",
                    isPresented: $showAlert
                ) {
                    Button("Apagar") {
                        if let i = allTasks.firstIndex(where: { at in at.id == task.id }) {
                            allTasks.remove(at: i)
                        }
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
            .padding()

            Spacer()

        }
    }
}

#Preview {
    TasksListDetail(
        allTasks: .constant([Task]([])), task: TasksList().allTasksJSON[0])
}
