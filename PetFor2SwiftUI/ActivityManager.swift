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

    @Published var filteredActivities : [Activity] = []
    
    init() {
        self.filteredActivities = activitiesWeekdayFilter(forWeekday: .monday)
    }
    
    //MARK: - Sumary related
    func getRatioActivitiesDone() -> Float {
        let total = Float(self.activities.count)
        let activitiesTeams = Float(activitiesDoneFilter(forActivities: self.activities).count)
        
        return Float(activitiesTeams / total)
        
    }
    
    func getRatioActivitiesTeam(forTeam team : Team) -> Float {
        let total = Float(activitiesDoneFilter(forActivities: self.activities).count)
        let activitiesTeam = Float(activitiesTeamFilter(forTeam: team).count)
        
        return Float(activitiesTeam / total)
    }
    
    func getRatioActivitiesCategory(forCategory category : Category) -> Float {
        let activitiesForCategory = activitiesCategoryFilter(forCategory: category)
        let activitiesForCategoryTotal = Float(activitiesForCategory.count)
        let activitiesForCategoryDone = Float(activitiesDoneFilter(forActivities: activitiesForCategory).count)
        
        return Float( activitiesForCategoryDone / activitiesForCategoryTotal)
    }
    
    //MARK: - filters
    func activitiesDoneFilter(forActivities activities : [Activity]) -> [Activity] {
        activities.filter { $0.team == .orange || $0.team == .blue }
    }
    
    func changeFilteredActivities(forWeekday weekday : Weekday) {
        self.filteredActivities = activitiesWeekdayFilter(forWeekday: weekday)
    }
    
    func activitiesTeamFilter(forTeam team : Team) -> [Activity] {
        self.activities.filter { $0.team == team }
    }
    
    func activitiesCategoryFilter(forCategory category : Category) -> [Activity] {
        self.activities.filter { $0.category == category }
    }
    
    func activitiesWeekdayFilter(forWeekday weekday : Weekday) -> [Activity] {
        activities.filter { activity in
            activity.weekdays.contains(weekday)
        }
    }
    
    //MARK: - manager
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
