//
//  ViewController.swift
//  PruebaBallDontLie
//
//  Created by Mac mini on 3/03/20.
//  Copyright © 2020 Mac mini. All rights reserved.
//

import UIKit




class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    struct DeclaredVar{
        static var playerListGeneral : [player] = []
    }
        
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playerList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! PlayerViewCell
   
        cell.playerName.text = playerList[indexPath.row].first_name
        cell.playerLastName.text = playerList[indexPath.row].last_name
        cell.playerPosition.text = "Position: \(playerList[indexPath.row].position!)"
        if(playerList[indexPath.row].height_feet != nil) {
        cell.playerFeet.text = "Feet: \(String((playerList[indexPath.row].height_feet!)))"
         }
        if(playerList[indexPath.row].height_inches != nil) {
        cell.playerInches.text = "Inches: \(String((playerList[indexPath.row].height_inches!)))"
         }
        if(playerList[indexPath.row].weight_pounds != nil) {
        cell.playerWeight.text = "Weight: \(String((playerList[indexPath.row].weight_pounds!)))"
         }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           
           
           UserDefaults.standard.set(playerList[indexPath.row].id!, forKey: "selectedPlayer") //setObject
           self.performSegue(withIdentifier: "ToEdit", sender: self)
           
           
           
           
       }
    

    var playerList : [player] = []
    
    @IBOutlet weak var playersColl: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if(DeclaredVar.playerListGeneral.isEmpty){
        Services().getPlayers(){ (success) in
                         self.playerList = success
            DeclaredVar.playerListGeneral = success
            self.playersColl.reloadData()
                        
               }
        }else{
            self.playerList = DeclaredVar.playerListGeneral
             self.playersColl.reloadData()
        }
    }

    @IBAction func filterPosition(_ sender: Any) {

        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "position C", style: .default) { _ in  self.filterPos(pos: "C")})

        alert.addAction(UIAlertAction(title: "position G", style: .default) { _ in self.filterPos(pos: "G")})
        alert.addAction(UIAlertAction(title: "position F", style: .default) { _ in self.filterPos(pos: "F")})
        alert.addAction(UIAlertAction(title: "position F-C", style: .default) { _ in self.filterPos(pos: "F-C")})
        alert.addAction(UIAlertAction(title: "position G-F", style: .default) { _ in self.filterPos(pos: "G-F")})
        alert.addAction(UIAlertAction(title: "position C-F", style: .default) { _ in self.filterPos(pos: "C-F")})
     alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction)in
         print("User click Dismiss button")
     }))

        present(alert, animated: true)
        
    }
    
    @IBOutlet weak var fieldFindText: UITextField!
    @IBAction func FindPlayers(_ sender: Any) {
        
        let textFind =  fieldFindText.text!
               playerList.removeAll()
        for index in DeclaredVar.playerListGeneral{
                   if ((index.first_name!.contains(textFind)) || (index.last_name!.contains(textFind))){
                       playerList.append(index)
                   }
               }
               if(textFind == "")  {
                playerList = DeclaredVar.playerListGeneral
               }
               self.playersColl.reloadData()
    }
    
    func filterPos(pos : String )
    {
        playerList.removeAll()
        for index in DeclaredVar.playerListGeneral{
                          if ((index.position!.contains(pos))){
                              playerList.append(index)
                          }
                      }
                      self.playersColl.reloadData()
    }
    
    @IBAction func toNewPlayer(_ sender: Any) {
        UserDefaults.standard.set("", forKey: "selectedPlayer")
        self.performSegue(withIdentifier: "toEditPlayer", sender: self)

    }
}

