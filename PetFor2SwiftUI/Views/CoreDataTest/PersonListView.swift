//
//  PersonListView.swift
//  PetFor2SwiftUI
//
//  Created by Lucas Migge de Barros on 21/12/22.
//

import SwiftUI

struct PersonListView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(sortDescriptors: []) private var persons: FetchedResults<Person>
    @State var showingAddPerson = false
    
    
    var body: some View {
        NavigationView {
            List(persons) { person in
                Text(person.name ?? "Desconhecido")
            }
            
            
            .navigationTitle("Pessoas")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        showingAddPerson.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            
            .sheet(isPresented: $showingAddPerson) {
                addPersonView()
            }
        }
    }
}

struct PersonListView_Previews: PreviewProvider {
    static var previews: some View {
        PersonListView()
    }
}
