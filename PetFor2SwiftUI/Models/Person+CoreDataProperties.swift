//
//  Person+CoreDataProperties.swift
//  PetFor2SwiftUI
//
//  Created by Lucas Migge de Barros on 20/12/22.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var job: String?

}

extension Person : Identifiable {

}
