//
//  Activity.swift
//  PetFor2SwiftUI
//
//  Created by Lucas Migge de Barros on 11/12/22.
//

import Foundation

struct Activity : Identifiable {
    var id : UUID
    var name : String
    var team : Team
}

enum Team {
    case orange, blue
}
