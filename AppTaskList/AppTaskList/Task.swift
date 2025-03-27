//
//  Tasks.swift
//  AppTaskList
//
//  Created by MultiLab PRT 14 on 25/03/2025.
//

struct Task: Identifiable, Decodable, Equatable {
    var id: Int
    var title: String
    var description: String
    var category: String
    var image: String
}
