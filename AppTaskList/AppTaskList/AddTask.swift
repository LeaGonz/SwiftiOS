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

    let imageList = [
        "casa1", "casa2", "trabalho1", "trabalho2", "educaçao1", "educacao2",
        "compras1", "compras2", "desporto1", "desporto2",
    ]

    var body: some View {
        Text("Adicionar Tarefa")
            .font(.title)
            .fontWeight(.bold)
        VStack {

            VStack {
                Form {
                    HStack {
                        Text("Nome:")
                        TextField("Insira nome da tarefa", text: $taskTitle)
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

            Button {
                var newTask = Task(
                    id: allTasks.count + 1,
                    title: taskTitle,
                    description: taskDescription,
                    category: taskCategory,
                    image: taskImage)
                allTasks.append(newTask)
                formClicked = false
            } label: {
                Image(systemName: "document.badge.plus.fill")
                Text("Adicionar")
            }
            .foregroundStyle(.green)
            .fontWeight(.bold)
            .font(.title)
        }
    }
}

#Preview {
    @State var allTasks: [Task] = []
    @State var formClicked: Bool = false

    AddTask(allTasks: $allTasks, formClicked: $formClicked)
}
