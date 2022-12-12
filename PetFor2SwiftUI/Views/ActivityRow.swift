//
//  ActivityRow.swift
//  PetFor2SwiftUI
//
//  Created by Lucas Migge de Barros on 11/12/22.
//

import SwiftUI

struct ActivityRow: View {
    var activity : Activity
    
    var body: some View {
        HStack(alignment: .center, spacing: 5){
            Button(action: {
                print("Orange button pressed for \(activity.name)")
            }) {
                Image(systemName: "moonphase.new.moon")
                    .foregroundColor(.orange)
            }
            
            Spacer()
            
            Text(activity.name)
                .font(.headline)
            
            Spacer()
            
            Button(action: {
                print("blue button pressed for \(activity.name)")
            }) {
                Image(systemName: "moonphase.new.moon")
                    .foregroundColor(.blue)
            }
        }
    }
}

struct ActivityRow_Previews: PreviewProvider {
    static var activities = Activity.populate()
    static var previews: some View {
        ActivityRow(activity: activities[0])
    }
}
