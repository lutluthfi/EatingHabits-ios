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
    let id: UUID?
    let imageEncodedString: String?
}

extension MealTime {
    enum Category: String, CaseIterable {
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

extension MealTime {
    struct Constant {
        static let formatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm a"
            dateFormatter.amSymbol = "AM"
            dateFormatter.pmSymbol = "PM"
            return dateFormatter
        }()
        static let breakfastStartTime = formatter.date(from: "07:00 AM")!
        static let breakfastEndTime = formatter.date(from: "11:59 AM")!
        static let lunchStartTime = formatter.date(from: "12:00 PM")!
        static let lunchEndTime = formatter.date(from: "05:59 PM")!
        static let dinnerStartTime = formatter.date(from: "06:00 PM")!
        static let dinnerEndTime = formatter.date(from: "08:59 PM")!
    }
}
