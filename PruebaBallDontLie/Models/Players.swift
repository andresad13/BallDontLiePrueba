//
//  Players.swift
//  PruebaBallDontLie
//
//  Created by Mac mini on 3/03/20.
//  Copyright © 2020 Mac mini. All rights reserved.
//

import UIKit

class player {
    var id: Int?
    var first_name: String?
    var last_name: String?
    var position : String?
    var height_feet : Int?
    var height_inches : Int?
    var weight_pounds : Int?

    init(id : Int?, first_name: String? , last_name: String?, position: String?,height_feet : Int?, height_inches : Int?, weight_pounds : Int? ){
        self.id = id
        self.first_name = first_name
        self.last_name = last_name
        self.position = position
        self.height_feet = height_feet
        self.height_inches = height_inches
        self.weight_pounds = weight_pounds
    }
}
