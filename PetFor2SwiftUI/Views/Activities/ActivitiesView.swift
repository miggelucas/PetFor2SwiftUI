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
    
    //@State var activities : [Activity] = []
    var activities : [Activity] {
        activityManager.activitiesWeekdayFilter(forWeekday: dayOfTheWeek)
    }
       
    
    var body: some View {
        NavigationView {
            Form {
                HStack(alignment: .center) {
                    Image("catty")

                    
                    HStack {
                        Spacer ()
                        
                        menuView(dayOfTheWeek: $dayOfTheWeek)
                            .foregroundColor(.primary)
                            .font(.title3)
                            .bold()
                        Image(systemName: "arrow.down.square")
                        
                        Spacer()
                    }
                    
                    Image("doggy")
                    
                }
                
                ForEach(activities) { activity in
                    // how to pass this activity as a biding?
                    ActivityRow(activity: activity,
                                actionMenu: {
                        activityManager.removeActivity(activity: activity)
                    })
                    .environmentObject(activityManager)
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            activityManager.removeActivity(activity: activity)
                        } label: {
                            Image(systemName: "trash")
                        }

                    }
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
