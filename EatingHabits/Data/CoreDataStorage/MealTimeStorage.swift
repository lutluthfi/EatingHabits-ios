//
//  MealTimeStorage.swift
//  EatingHabits
//
//  Created by Arif Luthfiansyah on 12/04/20.
//  Copyright © 2020 Triple T. All rights reserved.
//

import Foundation

protocol MealTimeStorage {
    func mealTimes(completion: @escaping (Result<[MealTime], Error>) -> Void)
    func mealTimesByCategory(cycleId: UUID, category: MealTime.Category, completion: @escaping (Result<[MealTime], Error>) -> Void)
    func storeMealTime(mealTime: MealTime, completion: @escaping (Result<MealTime, Error>) -> Void)
}
