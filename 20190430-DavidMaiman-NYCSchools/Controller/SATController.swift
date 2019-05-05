//
//  SATController.swift
//  20190430-DavidMaiman-NYCSchools
//
//  Created by DAVID MAIMAN on 5/3/19.
//  Copyright © 2019 DAVID MAIMAN. All rights reserved.
//

import Foundation
//Singleton class to control the flow of data from the SAT staistic data
class SATController{
    
    static let shared = SATController()
    var satData:[SATData] = []
    init(){}
    
    public func getSATData(){
        
        let urlString = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            do {
                //Decode data
                let JSONData = try JSONDecoder().decode([SATData].self, from: data)
                if(JSONData.count > 0){
                    self.satData = JSONData
                }
                //Alert UI
                DispatchQueue.main.async {
                    
                    for d in JSONData{
                        print(d.school_name! + " SAT TAKERS: " +  d.num_of_sat_test_takers!)
                    }
                }
                
            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
    
}
