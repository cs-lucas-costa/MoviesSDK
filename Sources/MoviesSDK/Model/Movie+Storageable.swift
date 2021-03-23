//
//  File.swift
//  
//
//  Created by lucas.henrique.costa on 23/03/21.
//

import CoreData

extension Movie: Storageable {
    
    var identifier: Int { id }
    
    var values: [String : Any] {
        [
            "id" : identifier,
            "title" : title,
            "posterPath" : posterPath,
            "releaseDate" : releaseDate,
            "overview" : overview
        ]
    }
    
    static var storageableType: StorageableTypes { .movie }
    
    init(managedObject: NSManagedObject) {
        id = managedObject.value(forKey: "id") as? Int ?? 0
        title = managedObject.value(forKey: "title") as? String ?? ""
        posterPath = managedObject.value(forKey: "posterPath") as? String ?? ""
        releaseDate = managedObject.value(forKey: "releaseDate") as? String ?? ""
        overview = managedObject.value(forKey: "overview") as? String ?? ""
    }
}
