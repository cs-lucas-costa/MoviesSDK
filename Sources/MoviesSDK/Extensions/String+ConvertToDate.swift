//
//  File.swift
//  
//
//  Created by lucas.henrique.costa on 23/03/21.
//

import Foundation

extension String {
    
    func convertToDate(component: Calendar.Component) -> Int {
        
        var value = 0
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        
        if let date = dateFormatter.date(from: self) {
             value = Calendar.current.component(component, from: date)
        }
        
        return value
    }
    
}
