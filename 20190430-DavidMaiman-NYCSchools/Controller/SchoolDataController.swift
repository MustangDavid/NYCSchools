//
//  SchoolDataController.swift
//  20190430-DavidMaiman-NYCSchools
//
//  Created by DAVID MAIMAN on 5/5/19.
//  Copyright © 2019 DAVID MAIMAN. All rights reserved.
//

import Foundation
//Singleton class to control the flow of data from the School Details
class SchoolDataController{
    
    static let shared = SchoolDataController()
    var schoolData:[SchoolDetail] = []

    
    init(){}
    public func getData(){
        // Do any additional setup after loading the view.
        // 1
        let urlString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            do {
                //Decode data
                let JSONData = try JSONDecoder().decode([SchoolDetail].self, from: data)
                if(JSONData.count  > 0 ){
                    self.schoolData = JSONData
                }
                
                //Alert UI
                DispatchQueue.main.async {
                    for d in JSONData{
                        print(d.dbn! + " " + d.school_name! + " " )
                    }
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
        }.resume()
        
    }
    
}
