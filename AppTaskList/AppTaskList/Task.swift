//
//  Tasks.swift
//  AppTaskList
//
//  Created by MultiLab PRT 14 on 25/03/2025.
//

struct Task: Identifiable, Decodable, Equatable {
    let id: Int
    let title: String
    let description: String
    let category: String
    let image: String
}
