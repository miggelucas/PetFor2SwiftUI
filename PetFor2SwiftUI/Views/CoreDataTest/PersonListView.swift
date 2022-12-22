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
    
    
    func removePerson(at offsets: IndexSet) {
        for index in offsets {
            let person = persons[index]
            viewContext.delete(person)
        }
        do {
            try viewContext.save()
        } catch {
            // handle the Core Data error
        }
    }
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(persons) { person in
                    Text(person.name ?? "Desconhecido")
                }
                .onDelete(perform: removePerson)
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
