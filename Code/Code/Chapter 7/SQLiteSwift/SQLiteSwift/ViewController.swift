//
//  ViewController.swift
//  SQLiteSwift
//
//  Created by Jon Hoffman on 12/28/15.
//  Copyright © 2015 Jon Hoffman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dataStore = SQLiteDataStore.sharedInstance
        do {
            try dataStore.createTables()
            setDataGood()
        } catch _ {}
        
        print("Finish")
        
    }
    
    func setDataGood() {
        var bos = Team(
            teamId: 0,
            city: "Boston",
            nickName: "Red Sox",
            abbreviation: "BOS")
        
        try? TeamBridge.save(&bos)
        print("\(bos.teamId)")
        
        var ortiz = Player(
            playerId: 0,
            firstName: "David",
            lastName: "Ortiz",
            number: 34,
            teamId: bos.teamId,
            position: Positions.DesignatedHitter)
        
        try? PlayerBridge.save(&ortiz)
        print("\(ortiz.playerId)  \(ortiz.team?.nickName)")
        
    }
    
    func setDataBad() {
        
        let bosId = try? TeamDataHelper.insert(
            TeamData(
                teamId: 0,
                city: "Boston",
                nickName: "Red Sox",
                abbreviation: "BOS"))
        print(bosId)
        
        let ortizId = try? PlayerDataHelper.insert(
            PlayerData(
                playerId: 0,
                firstName: "David",
                lastName: "Ortiz",
                number: 34,
                teamId: bosId,
                position: Positions.DesignatedHitter
            ))
        print(ortizId)
        
        let bogeyId = try? PlayerDataHelper.insert(
            PlayerData(
                playerId: 0,
                firstName: "Xander",
                lastName: "Bogarts",
                number: 2,
                teamId: bosId,
                position: Positions.Shortstop
            ))
        print(bogeyId)
        
        
        let baltId = try? TeamDataHelper.insert(
            TeamData(
                teamId: 0,
                city: "Baltimore",
                nickName: "Orioles",
                abbreviation: "BAL"))
        print(baltId)
        
        let tampId = try? TeamDataHelper.insert(
            TeamData(
                teamId: 0,
                city: "Tampa Bay",
                nickName: "Rays",
                abbreviation: "TB"))
        print(tampId)
        
        let torId = try? TeamDataHelper.insert(
            TeamData(
                teamId: 0,
                city: "Toronto",
                nickName: "Blue Jays",
                abbreviation: "TOR"))
        print(torId)
        do {
            if let teams = try TeamDataHelper.findAll() {
                for team in teams {
                    print("\(team.city!) \(team.nickName!)")
                    try TeamDataHelper.delete(team)
                }
            }
        } catch _ {}
        
        
    }
    
    func setPlayers() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

