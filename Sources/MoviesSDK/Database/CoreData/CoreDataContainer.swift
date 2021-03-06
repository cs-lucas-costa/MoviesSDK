//
//  File.swift
//  
//
//  Created by lucas.henrique.costa on 23/03/21.
//

import CoreData

final class CoreDataContainer: CoreDataProtocol {
    
    static let `default` = CoreDataContainer()
    let containerIdentifier: String = "MovieDB"
    
    private init() {}
    
    private lazy var container: NSPersistentContainer = {
        
        guard let url = Bundle.module.url(forResource: containerIdentifier, withExtension: ".momd"),
              let model = NSManagedObjectModel(contentsOf: url) else {
            preconditionFailure("Create xcdatamodel")
        }
        
        let container = NSPersistentContainer(name: containerIdentifier, managedObjectModel: model)
        
        guard container.persistentStoreDescriptions.first != nil else {
            fatalError("Couldn't retrieve persistent store description")
        }
        
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Unresolved error \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return container.viewContext
    }
    
}
