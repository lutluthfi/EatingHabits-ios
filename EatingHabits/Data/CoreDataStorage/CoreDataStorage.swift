//
//  CoreDataStorage.swift
//  EatingHabits
//
//  Created by Arif Luthfiansyah on 12/04/20.
//  Copyright © 2020 Triple T. All rights reserved.
//

import CoreData
import Foundation

enum CoreDataStorageError: Error {
    case readError(Error)
    case writeError(Error)
    case deleteError(Error)
}

class CoreDataStorage {
    
    // MARK: - Core Data
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "EatingHabitsCoreDataStorage")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

// MARK: - MealTimeStorage
extension CoreDataStorage: MealTimeStorage {
    
    func mealTimes(completion: @escaping (Result<[MealTime], Error>) -> Void) {
        self.persistentContainer.performBackgroundTask { (context) in
            do {
                let request: NSFetchRequest<MealTimeEntity> = MealTimeEntity.fetchRequest()
                let result = try context.fetch(request).map { MealTime(entity: $0) }
                DispatchQueue.global(qos: .background).async {
                    completion(.success(result))
                }
            } catch {
                print(error)
                DispatchQueue.global(qos: .background).async {
                    completion(.failure(CoreDataStorageError.readError(error)))
                }
            }
        }
    }
    
    func mealTimesByCategory(cycleId: UUID, category: MealTime.Category, completion: @escaping (Result<[MealTime], Error>) -> Void) {
        self.persistentContainer.performBackgroundTask { (context) in
            do {
                let request: NSFetchRequest<MealTimeEntity> = MealTimeEntity.fetchRequest()
                let cycleIdPredicate = NSPredicate(format: "cycleId == %@", cycleId.uuidString)
                let categoryPredicate = NSPredicate(format: "category == %@", category.rawValue)
                let andCompoundPredicate = NSCompoundPredicate(type: .and, subpredicates: [ cycleIdPredicate, categoryPredicate ])
                request.predicate = andCompoundPredicate
                let result = try context.fetch(request).map { MealTime(entity: $0) }
                DispatchQueue.global(qos: .background).async {
                    completion(.success(result))
                }
            } catch {
                print(error)
                DispatchQueue.global(qos: .background).async {
                    completion(.failure(CoreDataStorageError.readError(error)))
                }
            }
        }
    }
    
    func storeMealTime(mealTime: MealTime, completion: @escaping (Result<MealTime, Error>) -> Void) {
        self.persistentContainer.performBackgroundTask { (context) in
            do {
                let entity = MealTimeEntity(entity: mealTime, insertInto: context)
                try context.save()
                DispatchQueue.global(qos: .background).async {
                    completion(.success(.init(entity: entity)))
                }
            } catch {
                print(error)
                DispatchQueue.global(qos: .background).async {
                    completion(.failure(CoreDataStorageError.writeError(error)))
                }
            }
        }
    }
}
