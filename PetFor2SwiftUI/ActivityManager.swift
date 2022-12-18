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
    
    func getRatioActivitiesDone() -> Double {
        let totalActivies = activities.count
        let activitiesTeam = activities.filter { activity in
            activity.team == .blue || activity.team == .orange
        }.count
        
        return Double(activitiesTeam / totalActivies)
        
    }
    
    func activitiesTeamFilter(forTeam team : Team) -> [Activity] {
        self.activities.filter { $0.team == team }
    }
    
    func activitiesWeekdayFilter(forWeekday weekday : Weekday) -> [Activity] {
        activities.filter { activity in
            activity.weekdays.contains(weekday)
        }
    }
    
    func changeActivityTeam(forActivity activity : Activity, toTeam team : Team) {
        guard let index = activities.firstIndex(of: activity) else { return }
        activities[index].changeTeam(team: team)
    }
    
    func removeActivity(activity : Activity) {
        if let index = activities.firstIndex(of: activity) {
            activities.remove(at: index)
        }
    }
    
    // make func to validade addActivity
}
