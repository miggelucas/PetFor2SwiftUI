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
                HStack {
                    Button("Cancelar", role: .cancel) {
                        showingNewActivity.toggle()
                    }
                    
                    Spacer()
                    
                    Button {
                        let newActivity = Activity(name: activityName, team: .none)
                        activityManager.activities.append(newActivity)
                        showingNewActivity.toggle()
                        
                    } label: {
                        Text("Adicionar")
                    }
                    
                }
                
                Text("Nova atividade")
                    .font(.headline)
                
                TextField("Nome da atividade", text: $activityName)
                    .buttonBorderShape(.roundedRectangle)
                
                Spacer()
                
            }
            .padding()
        }
    }
}

struct NewActivity_Previews: PreviewProvider {
    static var view = ActivitiesView(activityManager: ActivityManager(), showingNewActivity: true)
    
    static var previews: some View {
        NewActivity(showingNewActivity: view.$showingNewActivity)

    }
}
