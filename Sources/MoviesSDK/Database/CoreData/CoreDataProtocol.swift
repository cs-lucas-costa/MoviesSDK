//
//  File.swift
//  
//
//  Created by lucas.henrique.costa on 23/03/21.
//

import CoreData

protocol CoreDataProtocol {
    var context: NSManagedObjectContext { get }
    var containerIdentifier: String { get }
    func saveContext()
}

extension CoreDataProtocol {
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError("Unresolved error \(error.localizedDescription)")
            }
        }
    }
}
