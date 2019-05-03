//
//  ViewController.swift
//  20190430-DavidMaiman-NYCSchools
//
//  Created by DAVID MAIMAN on 4/30/19.
//  Copyright © 2019 DAVID MAIMAN. All rights reserved.
//

import UIKit
struct JSONSchoolDirectory: Codable {
    let dbn: String
}
struct JSONSAT: Codable {
    let school_name: String
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 1
        let urlString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        let urlSATString = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
        guard let url = URL(string: urlString) else { return }
         guard let url2 = URL(string: urlSATString) else { return }
        
        // 2
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            do {
                // 3
                //Decode data
                let JSONData = try JSONDecoder().decode([SchoolDetail].self, from: data)
                
                // 4
                //Get back to the main queue
                DispatchQueue.main.async {
                    //self.dateLabel.text = JSONData.date
                    //self.timeLabel.text = JSONData.time
                    for d in JSONData{
                        print(d.dbn! + " " + d.school_name! + " " )
                    }
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
            
            // 5
            }.resume()
        
        URLSession.shared.dataTask(with: url2) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            do {
                // 3
                //Decode data
                let JSONData = try JSONDecoder().decode([SATData].self, from: data)
                
                // 4
                //Get back to the main queue
                DispatchQueue.main.async {
                    //self.dateLabel.text = JSONData.date
                    //self.timeLabel.text = JSONData.time
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

