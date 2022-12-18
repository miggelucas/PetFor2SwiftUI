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
    
    func getRatioActivitiesDone() -> Float {
        let total = Float(self.activities.count)
        let activitiesTeams = Float(activitiesDoneFilter().count)
        
        return Float(activitiesTeams / total)
        
    }
    
    func getRatioActivitiesTeam(forTeam team : Team) -> Float {
        let total = Float(activitiesDoneFilter().count)
        let activitiesTeam = Float(activitiesTeamFilter(forTeam: team).count)
        
        return Float(activitiesTeam / total)
    }
    
    func activitiesDoneFilter() -> [Activity] {
        self.activities.filter { $0.team == .orange || $0.team == .blue }
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
