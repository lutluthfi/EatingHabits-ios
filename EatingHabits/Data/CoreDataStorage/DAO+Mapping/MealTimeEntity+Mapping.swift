//
//  MealTimeEntity+Mapping.swift
//  EatingHabits
//
//  Created by Arif Luthfiansyah on 12/04/20.
//  Copyright © 2020 Triple T. All rights reserved.
//

import CoreData
import Foundation

extension MealTimeEntity {
    
    convenience init(entity: MealTime, insertInto context: NSManagedObjectContext) {
        self.init(context: context)
        self.category = entity.category?.rawValue
        self.checkInDateTime = entity.checkInDateTime
        self.id = entity.id
        self.imageEncodedString = entity.imageEncodedString
    }
    
}
