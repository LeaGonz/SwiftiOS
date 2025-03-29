//
//  TasksList.swift
//  AppTaskList
//
//  Created by MultiLab PRT 14 on 25/03/2025.
//

import Foundation

class TasksList {
    var allTasksJSON: [Task] = []
    var allImagesJSON: [String] = []

    init() {
        decodeJSONData()
        decodeJSONImg()
    }

    func decodeJSONData() {
        if let url = Bundle.main.url(
            forResource: "tasksList", withExtension: "json")
        {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                allTasksJSON = try decoder.decode([Task].self, from: data)
                //print(allTasksJSON.count)
            } catch {
                print("Error decoding JSON data: \(error)")
            }
        }
    }

    func decodeJSONImg() {
        if let url = Bundle.main.url(
            forResource: "imagesList", withExtension: "json")
        {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                allImagesJSON = try decoder.decode(Img.self, from: data).images
                //print(allImagesJSON.count)
            } catch {
                print("Error decoding JSON data: \(error)")
            }
        }
    }
}
