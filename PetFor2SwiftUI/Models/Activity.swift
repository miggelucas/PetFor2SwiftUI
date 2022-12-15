//
//  Activity.swift
//  PetFor2SwiftUI
//
//  Created by Lucas Migge de Barros on 11/12/22.
//

import Foundation

struct Activity : Identifiable, Hashable {
    var id = UUID()
    var name : String
    var team : Team = .none
    var weekdays : [Weekday]
    
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
            Activity(name: "Passear com o cachorro",  weekdays: [.monday,.saturday,.sunday]),
            Activity(name: "Limpar caixinha de areia", weekdays: [.monday,.saturday,.sunday, .thursday]),
            Activity(name: "Comprar ração", weekdays: [.friday, .tuesday, .wednesday]),
            Activity(name: "Comprar remédio", weekdays: [.thursday,.tuesday,.sunday]),
            Activity(name: "Dar remédio para o cachorro", weekdays: [.sunday,.monday,.saturday]),
            Activity(name: "Oferecer bola anti-stress para o bixino ao menos 3 vezes no dia", weekdays: [.wednesday,.sunday]),
        ]
    }
}

enum Team {
    case orange, blue, none
}

enum Weekday : String, CaseIterable {
    case monday = "Segunda-feira"
    case tuesday = "Terça-feira"
    case wednesday = "Quarta-feira"
    case thursday = "Quinta-feira"
    case friday = "Sexta-feira"
    case saturday = "Sábado"
    case sunday = "Domingo"

}
