//
//  Activity.swift
//  PetFor2SwiftUI
//
//  Created by Lucas Migge de Barros on 11/12/22.
//

import Foundation

struct Activity : Identifiable {
    var id = UUID()
    var name : String
    var team : Team
    
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
    
    mutating func teamButtonTapped(team teamIncoming : Team) {
        if team == teamIncoming {
            team = .none
        } else {
            team = teamIncoming
        }
    }
    
    static func populate() -> [Activity] {
        return [
            Activity(name: "Passear com o cachorro", team: .none),
            Activity(name: "Limpar caixinha de areia", team: .none),
            Activity(name: "Comprar ração", team: .none),
            Activity(name: "Comprar remédio", team: .none),
            Activity(name: "Dar remédio para o cachorro", team: .none),
            Activity(name: "Oferecer bola anti-stress para o bixino ao menos 3 vezes no dia", team: .none),
        ]
    }
}

enum Team {
    case orange, blue, none
}
