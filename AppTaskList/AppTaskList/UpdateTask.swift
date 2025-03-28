//
//  UpdateTask.swift
//  AppTaskList
//
//  Created by MultiLab PRT 14 on 27/03/2025.
//

import SwiftUI

struct UpdateTask: View {
    @Binding var allTasks: [Task]
    @Binding var formClicked: Bool

    var task: Task

    @State private var taskTitle: String = ""
    @State private var taskDescription: String = ""
    @State private var taskCategory: String = ""
    @State private var taskImage: String = ""

    @State var errors: [String: String] = [:]

    let imageList = [
        "Calendar","Delegation","Management","Priority","Task"
    ]

    var body: some View {
        Text("Atualizar Tarefa")
            .font(.title)
            .fontWeight(.bold)
            .padding()

        VStack {
            VStack {
                Form {
                    HStack {
                        Text("Nome:")
                        TextField("Insira nome da tarefa", text: $taskTitle)
                    }
                    if !errors.isEmpty {
                        if errors.keys.contains("name") {
                            let err = errors["name"] ?? ""
                            Text(err).foregroundStyle(.red)
                        }
                    }
                    HStack {
                        Text("Descrição:")
                        TextField("Insira a descrição", text: $taskDescription)
                    }
                    HStack {
                        Picker("Categoria: ", selection: $taskCategory) {
                            Text("Casa").tag("Casa")
                            Text("Trabalho").tag("Trabalho")
                            Text("Compras").tag("Compras")
                            Text("Educação").tag("Educação")
                            Text("Desporto").tag("Desporto")
                        }
                    }
                    if !errors.isEmpty {
                        if errors.keys.contains("category") {
                            let err = errors["category"] ?? ""
                            Text(err).foregroundStyle(.red)
                        }
                    }
                    HStack {
                        Picker(
                            "Imagem: ", selection: $taskImage,
                            content: {
                                ForEach(
                                    imageList, id: \.self,
                                    content: { image in
                                        Text(image).tag(image)
                                    })
                            })
                    }

                    if taskImage != "" {
                        Image(taskImage)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                    }

                }
            }
            .multilineTextAlignment(.leading)
            .onAppear {
                taskTitle = task.title
                taskDescription = task.description
                taskCategory = task.category
                taskImage = task.image
            }
            HStack {
                // Update function
                Button {
                    if taskTitle.isEmpty {
                        errors["name"] = "O nome é obrigatório."
                    } else {
                        errors["name"] = nil
                    }

                    if taskCategory.isEmpty {
                        errors["category"] = "A categoria é obrigatória."
                    } else {
                        errors["category"] = nil
                    }

                    if errors.isEmpty {
                        if let index = allTasks.firstIndex(where: { at in
                            at.id == task.id
                        }) {
                            allTasks[index].title = taskTitle
                            allTasks[index].description = taskDescription
                            allTasks[index].category = taskCategory
                            allTasks[index].image = taskImage
                        }
                        formClicked = false
                    }
                } label: {
                    Text("Atualizar")
                        .padding()
                }
                .frame(maxWidth: 200)
                .background(.green)
                .cornerRadius(40)
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .font(.callout)

                // Voltar function
                Button(action: {
                    formClicked = false
                }) {
                    Text("Voltar")
                        .padding()
                }
                .frame(maxWidth: .infinity)
                .background(.red)
                .cornerRadius(40)
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .font(.callout)
            }.padding()
        }
    }
}

#Preview {
    UpdateTask(
        allTasks: .constant([Task]([])), formClicked: .constant(false),
        task: TasksList().allTasksJSON[0])
}
