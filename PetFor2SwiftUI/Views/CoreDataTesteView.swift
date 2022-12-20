//
//  CoreDataTesteView.swift
//  PetFor2SwiftUI
//
//  Created by Lucas Migge de Barros on 20/12/22.
//

import SwiftUI

struct CoreDataTesteView: View {
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(sortDescriptors: []) private var items: FetchedResults<Person>
    
    @State var name : String = ""
    @State var age : Int = 0
    @State var job : Job = .Manager
    
    enum Job : String, CaseIterable, Identifiable {
        case Manager, Intern, Engineer
        var id: Self { self }
    }
    
    var body: some View {
        Form {
            Section{
                TextField("Nome do sujeito", text: $name)
            }
            
            Section{
                List {
                    Picker(selection: $age) {
                        ForEach(18..<99, id: \.self) { i in
                            Text("\(i) anos").tag(i)
                        }
                    } label: {
                        Text("Idade")
                    }
                    .pickerStyle(.menu)
                    
                    
                    Picker(selection: $job) {
                        ForEach(Job.allCases, id: \.self) { job in
                            Text(job.rawValue).tag(job)
                        }
                    } label: {
                        Text("Profissão")
                    }
                    .pickerStyle(.menu)
                }
            }
            
            Section {
                
                HStack {
                    Spacer()
                    
                    Button("Adicionar Persona") {
                        withAnimation {
                            if name != "" {
                                let person = Person(context: viewContext)
                                person.name = name
                                person.job = job.rawValue
                                person.age = Int16(age)
                            }
                            do {
                                try viewContext.save()
                            }
                            catch {
                                print("deu ruim")
                            }
                        }
                        
                    }
                    
                    Spacer()
                }
                
                
            }
        }
    }
}
    
    
    struct CoreDataTesteView_Previews: PreviewProvider {
        static var previews: some View {
            CoreDataTesteView()
        }
    }
