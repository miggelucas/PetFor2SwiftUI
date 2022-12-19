//
//  Activity.swift
//  PetFor2SwiftUI
//
//  Created by Lucas Migge de Barros on 11/12/22.
//

import Foundation
import SwiftUI

struct Activity : Identifiable, Hashable {
    var id = UUID()
    var name : String
    var team : Team = .none
    var weekdays : [Weekday]
    var category : Category
    
    var blueActive : Bool {
        if team == .blue {
            return true
        } else {
            return false
        }
    }
    
    var orangeActive : Bool {
        if team == .orange {
            return true
        } else {
            return false
        }
    }
    
    func activityColor() -> Color {
        switch team {
        case .orange:
            return Color(Team.orange.rawValue)
        case .blue:
            return Color(Team.blue.rawValue)
        case .none:
            return Color(.clear)
        }
        
    }
    
    mutating func changeTeam(team teamIncoming : Team) {
        if team == teamIncoming {
            team = .none
        } else {
            team = teamIncoming
        }
    }
    
    static func populate() -> [Activity] {
        return [
            Activity(name: "Passear com o cachorro",  team: .orange, weekdays: [.monday,.saturday,.sunday], category: .recreation),
            Activity(name: "Limpar caixinha de areia", weekdays: [.monday,.saturday,.sunday, .thursday], category: .hygiene),
            Activity(name: "Comprar ração", weekdays: [.friday, .tuesday, .wednesday], category: .food),
            Activity(name: "Comprar remédio", weekdays: [.thursday,.tuesday,.sunday], category: .health),
            Activity(name: "Dar remédio para o cachorro", weekdays: [.sunday,.monday,.saturday], category: .health),
            Activity(name: "Oferecer bola anti-stress para o bixino ao menos 3 vezes no dia", weekdays: [.wednesday,.sunday], category: .recreation),
        ]
    }
}
