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
            
            ScrollView {
                VStack {
                    ForEach(activityManager.activities) { activity in
                        ActivityRow(activity: activity)
                    }
                }
            }
            .padding()
            .navigationTitle("Atividades")
            .toolbar {
                Button(action: {
                    print("Pressed me")
                }) {
                    Image(systemName: "plus")
                }
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
