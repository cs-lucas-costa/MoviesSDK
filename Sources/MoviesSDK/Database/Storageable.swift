//
//  File.swift
//  
//
//  Created by lucas.henrique.costa on 23/03/21.
//

import CoreData

enum StorageableTypes: String {
    case movie = "Movie"
    case genre = "Genre"
}

protocol Storageable {
    var identifier: Int { get }
    var values: [String: Any] { get }
    static var storageableType: StorageableTypes { get }
    
    init(managedObject: NSManagedObject)
}
