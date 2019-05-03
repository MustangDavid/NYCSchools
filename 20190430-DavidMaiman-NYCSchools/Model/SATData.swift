//
//  SATData.swift
//  20190430-DavidMaiman-NYCSchools
//
//  Created by DAVID MAIMAN on 5/3/19.
//  Copyright © 2019 DAVID MAIMAN. All rights reserved.
//

import Foundation
//Stores school information from the NYC school detail database
class SATData: Codable  {
    var dbn: String?
    var school_name: String?
    var num_of_sat_test_takers: String?
    var sat_critical_reading_avg_score: String?
    var sat_math_avg_score: String?
    var sat_writing_avg_score: String?
    
}
