//
//  Activities.swift
//  PetFor2SwiftUI
//
//  Created by Lucas Migge de Barros on 11/12/22.
//

import SwiftUI

struct ActivitiesView: View {
    
    @StateObject var activityManager : ActivityManager
    @State var showingNewActivity : Bool
    
    var body: some View {
        NavigationView {
            Form {
                ForEach(activityManager.activities) { activity in
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



struct Activities_Previews: PreviewProvider {
    static var activityManager = ActivityManager()
    static var previews: some View {
        ActivitiesView(activityManager: activityManager, showingNewActivity: false)
        
    }
}
