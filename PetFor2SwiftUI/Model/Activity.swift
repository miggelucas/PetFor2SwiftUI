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
    
    static func populate() -> [Activity] {
        return [
            Activity(name: "Passear com o cachorro", team: .none),
            Activity(name: "Limpar caixinha de areia", team: .none),
            Activity(name: "Comprar ração", team: .none),
            Activity(name: "", team: .none),
            Activity(name: "", team: .none)
        ]
    }
}

enum Team {
    case orange, blue, none
}
