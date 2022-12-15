//
//  Activities.swift
//  PetFor2SwiftUI
//
//  Created by Lucas Migge de Barros on 11/12/22.
//

import SwiftUI

struct ActivitiesView: View {
    
    @EnvironmentObject var activityManager : ActivityManager
    
    @State var showingNewActivity : Bool = false
    @State var dayOfTheWeek : Weekday = .monday
    
    var filteredActivities : [Activity] {
        activityManager.activities.filter { activity in
            activity.weekdays.contains(dayOfTheWeek)
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                HStack(alignment: .center) {
                    Spacer ()
                    
                    menuView(dayOfTheWeek: $dayOfTheWeek)
                        .foregroundColor(.black)
                        .font(.title3)
                        .bold()
                    Image(systemName: "arrow.down.square")
                    
                    Spacer()
                }
                
                ForEach(filteredActivities) { activity in
                    ActivityRow(activity: activity,
                                actionMenu: {
                        activityManager.removeActivity(activity: activity)
                    }
                    )
                }
            }
            .formStyle(.grouped)
            .navigationTitle("Atividades")
            .toolbar {
                Button(action: {
                    showingNewActivity.toggle()
                }) {
                    Image(systemName: "plus")
                }
            }
            
            .sheet(isPresented: $showingNewActivity) {
                NewActivity(showingNewActivity: $showingNewActivity)
                    .environmentObject(activityManager)
            }
        }
    }
}


struct menuView : View {
    @Binding var dayOfTheWeek : Weekday
    
    var body: some View {
        Menu(dayOfTheWeek.rawValue) {
            ForEach(Weekday.allCases, id: \.self) { weekday in
                Button {
                    dayOfTheWeek = weekday
                } label: {
                    Text(weekday.rawValue)
                }
                
            }
        }
    }
    
    
}

struct Activities_Previews: PreviewProvider {
    static var activityManager = ActivityManager()
    static var previews: some View {
        ActivitiesView()
            .environmentObject(activityManager)
        
    }
}
