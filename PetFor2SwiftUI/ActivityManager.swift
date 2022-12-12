//
//  ActivityManager.swift
//  PetFor2SwiftUI
//
//  Created by Lucas Migge de Barros on 12/12/22.
//

import Foundation
import SwiftUI

class ActivityManager : ObservableObject {
    @Published var activities : [Activity] = Activity.populate()
    
    
}
