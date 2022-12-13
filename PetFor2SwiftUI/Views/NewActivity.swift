//
//  NewActivity.swift
//  PetFor2SwiftUI
//
//  Created by Lucas Migge de Barros on 12/12/22.
//

import SwiftUI

struct NewActivity: View {
    @EnvironmentObject var activityManager : ActivityManager
    
    @State var activityName : String = ""
    @Binding var showingNewActivity : Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Nova atividade")
                    .font(.headline)
                
                TextField("Nome da atividade", text: $activityName)
                    .buttonBorderShape(.roundedRectangle)
                
                Spacer()
                
            }
            .padding()
            .navigationTitle("Adicionar atividade")
            .toolbar {
                Button {
                    let newActivity = Activity(name: activityName, team: .none)
                    activityManager.activities.append(newActivity)
                    showingNewActivity.toggle()
                    
                } label: {
                    Text("Adicionar")
                }

            }
        }
    }
}

struct NewActivity_Previews: PreviewProvider {
    static var view = ActivitiesView(activityManager: ActivityManager(), showingNewActivity: true)
    
    static var previews: some View {
        NewActivity(showingNewActivity: view.$showingNewActivity)

    }
}
