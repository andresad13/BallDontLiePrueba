//
//  Services.swift
//  PruebaBallDontLie
//
//  Created by Mac mini on 3/03/20.
//  Copyright © 2020 Mac mini. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Services {
    
    
    
    func getPlayers(completionHandler: @escaping ([player]) -> ()) {
        var PlayersArray :  [player] = [player]()

        AF.request("https://www.balldontlie.io/api/v1/players", method:.get , parameters : nil ,encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                DispatchQueue.main.async {}
                if let json = response.data {
                    do{
                        let data = try JSON(data: json)
                        let str = data["data"]
                        for (_, subJson) in str {
                            let playerTemp : player = player(id: subJson["id"].int, first_name: subJson["first_name"].string!, last_name: subJson["last_name"].string!, position: subJson["position"].string!, height_feet: subJson["height_feet"].int, height_inches: subJson["height_inches"].int, weight_pounds: subJson["weight_pounds"].int)
                            PlayersArray.append(playerTemp)
                        }
                        completionHandler(PlayersArray)
                    }
                    catch{
                        print("JSON Error")
                    }
                }
        }
    }
    
}
