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
    @State var selection : [Weekday] = []
    
    @Binding var showingNewActivity : Bool
    
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Nome")) {
                        TextField("Descreva a atividade", text: $activityName)
                            .buttonBorderShape(.roundedRectangle)
                            .multilineTextAlignment(.leading)
                    }
                    
                    Section(header: Text("Dias da semana")) {
                        NavigationLink {
                            SelectDaysOfWeek(selectedItems: $selection)
                        } label: {
                            Text("Dias da semana")
                        }
                    }
                }
                
            }
            .toolbar {
                Button {
                    let newActivity = Activity(name: activityName, team: .none)
                    activityManager.activities.append(newActivity)
                    showingNewActivity.toggle()
                    
                } label: {
                    Text("Adicionar")
                }
                .navigationTitle("Nova atividade")
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
