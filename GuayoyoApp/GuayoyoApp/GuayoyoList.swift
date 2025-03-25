//
//  GuayoyoList.swift
//  GuayoyoApp
//
//  Created by MultiLab PRT 14 on 18/03/2025.
//

import Foundation

class GuayoyoList{
    var allFofoqueiros: [Guayoyos] = []
    
    init () {
        decodeJSONData()
    }
    
    func decodeJSONData() {
        if let url = Bundle.main.url(forResource: "guayoyos", withExtension: "json") {
            do{
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allFofoqueiros = try decoder.decode([Guayoyos].self, from: data)
                print(allFofoqueiros.count)
            } catch{
                print("Error \(error)")
            }
        }
    }
}
