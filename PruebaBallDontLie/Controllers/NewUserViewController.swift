//
//  NewUserViewController.swift
//  PruebaBallDontLie
//
//  Created by Mac mini on 3/03/20.
//  Copyright © 2020 Mac mini. All rights reserved.
//

import UIKit

class NewUserViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var positionfield: UITextField!
    @IBOutlet weak var fettField: UITextField!
    @IBOutlet weak var inchesField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if(UserDefaults.standard.string(forKey: "selectedPlayer")! != ""){
            if let i = ViewController.DeclaredVar.playerListGeneral.firstIndex(where: { $0.id == Int(UserDefaults.standard.string(forKey: "selectedPlayer")!) }) {
                self.nameField.text = ViewController.DeclaredVar.playerListGeneral[i].first_name!
                self.lastNameField.text = ViewController.DeclaredVar.playerListGeneral[i].last_name!
                self.positionfield.text = ViewController.DeclaredVar.playerListGeneral[i].position!
                if(ViewController.DeclaredVar.playerListGeneral[i].height_feet != nil) {
                   self.fettField.text = "\(ViewController.DeclaredVar.playerListGeneral[i].height_feet!)"
                }
                if(ViewController.DeclaredVar.playerListGeneral[i].height_inches != nil) {
                   self.inchesField.text = "\(ViewController.DeclaredVar.playerListGeneral[i].height_inches!)"
                }
                if(ViewController.DeclaredVar.playerListGeneral[i].weight_pounds != nil) {
                   self.weightField.text = "\(ViewController.DeclaredVar.playerListGeneral[i].weight_pounds!)"
                }
                
             
            }
        }
        print(ViewController.DeclaredVar.playerListGeneral[ViewController.DeclaredVar.playerListGeneral.count - 1].id! )

    }
    @IBAction func SavePlayer(_ sender: Any) {
        
        
        if(UserDefaults.standard.string(forKey: "selectedPlayer")! != ""){
            if let i = ViewController.DeclaredVar.playerListGeneral.firstIndex(where: { $0.id == Int(UserDefaults.standard.string(forKey: "selectedPlayer")!) }) {
                ViewController.DeclaredVar.playerListGeneral[i].first_name! = self.nameField.text!
                ViewController.DeclaredVar.playerListGeneral[i].last_name! = self.lastNameField.text!
                
                 ViewController.DeclaredVar.playerListGeneral[i].position! = self.positionfield.text!
                
                if(self.inchesField.text! != "") {
                    ViewController.DeclaredVar.playerListGeneral[i].height_inches = Int(self.inchesField.text!)
                }
                if(self.fettField.text! != "") {
                    ViewController.DeclaredVar.playerListGeneral[i].height_feet = Int(self.fettField.text!)
                }
                if(self.weightField.text! != "") {
                    ViewController.DeclaredVar.playerListGeneral[i].weight_pounds = Int(self.weightField.text!)
                }
                
                
                self.performSegue(withIdentifier: "ToList", sender: self)
            }
            
        }
        else{
        let playerToSave : player = player(id: ViewController.DeclaredVar.playerListGeneral[ViewController.DeclaredVar.playerListGeneral.count - 1].id! + 1, first_name: nameField.text!, last_name: lastNameField.text!, position: positionfield.text!, height_feet: Int(fettField.text!), height_inches: Int(inchesField.text!), weight_pounds: Int(weightField.text!))
        ViewController.DeclaredVar.playerListGeneral.append(playerToSave)
         self.performSegue(withIdentifier: "ToList", sender: self)
             }
            
    }
    

    @IBAction func CloseView(_ sender: Any) {
        
    }
    

}
