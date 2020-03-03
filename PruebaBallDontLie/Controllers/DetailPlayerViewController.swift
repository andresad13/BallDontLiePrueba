//
//  DetailPlayerViewController.swift
//  PruebaBallDontLie
//
//  Created by Mac mini on 3/03/20.
//  Copyright © 2020 Mac mini. All rights reserved.
//

import UIKit

class DetailPlayerViewController: UIViewController {

    
    @IBOutlet weak var namePlayer: UILabel!
    @IBOutlet weak var lastNamePlayer: UILabel!
    @IBOutlet weak var nameTeam: UILabel!
    @IBOutlet weak var divTeam: UILabel!
    @IBOutlet weak var confTeam: UILabel!
    @IBOutlet weak var cityTeam: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserDefaults.standard.string(forKey: "selectedPlayer")!)
        
        print()
        
        if let i = ViewController.DeclaredVar.playerListGeneral.firstIndex(where: { $0.id == Int(UserDefaults.standard.string(forKey: "selectedPlayer")!) }) {
            namePlayer.text = ViewController.DeclaredVar.playerListGeneral[i].first_name!
            lastNamePlayer.text = ViewController.DeclaredVar.playerListGeneral[i].last_name!
        }
        Services().getPlayer(playerId: UserDefaults.standard.string(forKey: "selectedPlayer")!){ (success) in
                     
            print(success.name!)
            self.nameTeam.text = success.name
            self.divTeam.text = success.division
            self.confTeam.text = success.conference
            self.cityTeam.text = success.city
           }

        // Do any additional setup after loading the view.
    }
    

    @IBAction func deletePlayer(_ sender: Any) {
        
        
        
        var refreshAlert = UIAlertController(title: "Esta seguro que desea eliminar este jugador?", message: "La información del Jugador que desea eliminar no se podra recuperar. ", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Si", style: .default, handler: { (action: UIAlertAction!) in
            
            self.navigationController?.popToRootViewController(animated: true)
            
            self.DeleteUser()
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "No", style: .default, handler: { (action: UIAlertAction!) in
            
            refreshAlert .dismiss(animated: true, completion: nil)
            
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
    }
    
    func DeleteUser() {
        if let i = ViewController.DeclaredVar.playerListGeneral.firstIndex(where: { $0.id == Int(UserDefaults.standard.string(forKey: "selectedPlayer")!) }) {
            ViewController.DeclaredVar.playerListGeneral.remove(at: i)
            self.performSegue(withIdentifier: "ToList", sender: self)

        }
    }
    
    @IBAction func ToEdit(_ sender: Any) {
        self.performSegue(withIdentifier: "ToeditFromUser", sender: self)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
