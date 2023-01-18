//
//  Extensions.swift
//  F Plus
//
//  Created by Ferdi DEMİRCİ on 23.11.2022.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
