//
//  SchoolDetail.swift
//  20190430-DavidMaiman-NYCSchools
//
//  Created by DAVID MAIMAN on 5/3/19.
//  Copyright © 2019 DAVID MAIMAN. All rights reserved.
//

import Foundation
//Stores school information from the NYC school detail database
class SchoolDetail: Codable  {
    var dbn: String?
    var school_name: String?
    var boro: String?
    var overview_paragraph: String?
    var neighborhood: String?
    var campus_name: String?
    var location: String?
    var phone_number: String?
    
}
