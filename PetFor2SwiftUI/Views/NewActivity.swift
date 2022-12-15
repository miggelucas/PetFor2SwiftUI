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
    @State var weekdays : [Weekday] = []
    
    var weekdaysString : [String] {
        var ax : [String] = []
        for weekday in weekdays {
            ax.append(weekday.rawValue)
        }
        return ax
    }
    
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
                            SelectDaysOfWeek(selectedItems: $weekdays)
                        } label: {
                            if weekdays.isEmpty {
                                Text("Selecione os dias da semana")
                                    .foregroundColor(.secondary)
                                    .font(.callout)
                            } else {
                                Text(weekdaysString.joined(separator: " "))
                                    .foregroundColor(.secondary)
                                    .font(.callout)
                            }
                        }
                    }
                    
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            // must do some validation before creating object
                            let newActivity = Activity(name: activityName, team: .none)
                            activityManager.activities.append(newActivity)
                            showingNewActivity.toggle()
                            
                        } label: {
                            Text("Adicionar")
                                .font(.headline)
                                .padding(.horizontal)
                            
                        }
                        .buttonStyle(.borderedProminent)
                        .multilineTextAlignment(.center)
                        
                        Spacer()
                        
                    }
                    
                }
                
                
            }
            .toolbar {
                Button {
                    showingNewActivity.toggle()
                    
                } label: {
                    Text("Cancelar")
                    
                }
                
            }
            .navigationTitle("Nova atividade")
            
        }
        
        
    }
}


struct NewActivity_Previews: PreviewProvider {
    static var view = ActivitiesView()
    
    static var previews: some View {
        NewActivity(showingNewActivity: view.$showingNewActivity)
        
    }
}
