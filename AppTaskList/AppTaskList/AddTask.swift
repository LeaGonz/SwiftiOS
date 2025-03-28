//
//  AddTask.swift
//  AppTaskList
//
//  Created by MultiLab PRT 14 on 25/03/2025.
//

import SwiftUI

struct AddTask: View {

    @Binding var allTasks: [Task]
    @Binding var formClicked: Bool

    @State private var taskTitle: String = ""
    @State private var taskDescription: String = ""
    @State private var taskCategory: String = ""
    @State private var taskImage: String = ""

    @State var errors: [String: String] = [:]

    let imageList = [
        "casa1", "casa2", "trabalho1", "trabalho2", "educaçao1", "educacao2",
        "compras1", "compras2", "desporto1", "desporto2",
    ]

    var body: some View {
        Text("Adicionar Tarefa")
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
                            .scaledToFill()
                            .cornerRadius(10)
                    }
                }
            }
            .multilineTextAlignment(.leading)

            HStack {

                // Add function
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
                        let newTask = Task(
                            id: allTasks.count + 1,
                            title: taskTitle,
                            description: taskDescription,
                            category: taskCategory,
                            image: taskImage)

                        allTasks.append(newTask)

                        formClicked = false
                    }

                } label: {
                    Text("Adicionar")
                        .padding()
                }
                .frame(maxWidth: .infinity)
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
    AddTask(allTasks: .constant([Task]([])), formClicked: .constant(false))
}
