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
    
        SATController.shared.getSATData()
        SchoolDataController.shared.getData()
        
        
    }


}

