//
//  File.swift
//  
//
//  Created by lucas.henrique.costa on 23/03/21.
//

import Foundation

protocol DatabaseProtocol {
    
    func create<Element: Storageable>(element: Element,
                                      completion: ((Result<Element, Error>) -> Void)?)
    
    func delete<Element: Storageable>(type: Element.Type, id: Int, completion: ((Error?) -> Void)?)
    
    func fetch<Element: Storageable>(type: Element.Type,
                                     with predicate: NSPredicate?,
                                     and sortDescriptors: [NSSortDescriptor],
                                     completion: @escaping ((Result<[Element], Error>) -> Void))
}
