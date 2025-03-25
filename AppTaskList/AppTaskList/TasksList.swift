//
//  TasksList.swift
//  AppTaskList
//
//  Created by MultiLab PRT 14 on 25/03/2025.
//

import Foundation

class TasksList{
    var allTasks: [Task] = []
    
    init (){
        decodeJSONData()
    }
    
    func decodeJSONData(){
        if let url=Bundle.main.url(forResource: "tasksList", withExtension: "json"){
            do{
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                allTasks = try
                    decoder.decode([Task].self, from: data)
                print(allTasks.count)
            }catch{
                print("Error decoding JSON data: \(error)")
            }
        }
    }
}
