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
    
    func activitiesFilter(forWeekday weekday : Weekday) -> [Activity] {
        return activities.filter { activity in
                activity.weekdays.contains(weekday)
            }
    }
    
    func removeActivity(activity : Activity) {
        if let index = activities.firstIndex(of: activity) {
             activities.remove(at: index)
         }
    }
    
    // make func to validade addActivity
}
