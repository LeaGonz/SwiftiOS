//
//  TasksListDetail.swift
//  AppTaskList
//
//  Created by MultiLab PRT 14 on 25/03/2025.
//

import SwiftUI

struct TasksListDetail: View {
    
    let task: Task
    
    var body: some View {
        VStack {
            ZStack {
                Image(task.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
                    .offset(y:0)
                    .clipped()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
            }
            .padding()
            Text(task.title)
                .font(.headline)
                .fontWeight(.bold)
            Text(task.description)
                .padding()
                .multilineTextAlignment(.center)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    TasksListDetail(task: TasksList().allTasks[0])
}
