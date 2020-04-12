//
//  MealTime.swift
//  EatingHabits
//
//  Created by Arif Luthfiansyah on 12/04/20.
//  Copyright © 2020 Triple T. All rights reserved.
//

import Foundation

struct MealTime {
    let category: Category?
    let checkInDateTime: Date?
    let cycleId: UUID?
    let id: UUID?
    let imageEncodedString: String?
}

extension MealTime {
    enum Category: String {
        case breakfast = "breakfast"
        case lunch = "lunch"
        case dinner = "dinner"
        case none = "none"
    }
}

extension MealTime {
    init(entity: MealTimeEntity) {
        self.category = entity.category?.toMealTimeCategory()
        self.checkInDateTime = entity.checkInDateTime
        self.cycleId = entity.cycleId
        self.id = entity.id
        self.imageEncodedString = entity.imageEncodedString
    }
}

extension String {
    fileprivate func toMealTimeCategory() -> MealTime.Category {
        switch self.lowercased() {
        case MealTime.Category.breakfast.rawValue.lowercased():
            return .breakfast
        case MealTime.Category.lunch.rawValue.lowercased():
            return .lunch
        case MealTime.Category.dinner.rawValue.lowercased():
            return .dinner
        default:
            return .none
        }
    }
}
