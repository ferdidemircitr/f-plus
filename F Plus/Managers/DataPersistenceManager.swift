//
//  DataPersistentManager.swift
//  F Plus
//
//  Created by Ferdi DEMİRCİ on 2.12.2022.
//

import Foundation
import UIKit
import CoreData

class DataPersistenceManager {
    enum DatabaseError: Error {
        case FailedToSaveData
        case FailedToFetchData
        case FailedToDeleteData
    }
    
    static let shared = DataPersistenceManager()
    
    func downloadTitleWith(model: Title, complation: @escaping(Result<Void, Error>) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let item = TitleCloneModel(context: context)
        
        item.original_title = model.original_title
        item.id = Int64(model.id)
        item.overview = model.overview
        item.original_name = model.original_name
        item.media_type = model.media_type
        item.poster_path = model.poster_path
        item.release_date = model.release_date
        item.vote_avarage = model.vote_average
        item.vote_count = Int64(model.vote_count)
        
        do {        
            try context.save()
            complation(.success(()))
        } catch {
            complation(.failure(DatabaseError.FailedToSaveData))
        }
    }
    func fetchingTitleFromDataBase(completion: @escaping (Result<[TitleCloneModel], Error>) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let request: NSFetchRequest<TitleCloneModel>
        request = TitleCloneModel.fetchRequest()
        do {
            let titles = try context.fetch(request)
            completion(.success(titles))
        } catch {
            completion(.failure(DatabaseError.FailedToFetchData))
        }
    }
    
    func deleteTitleWith(model: TitleCloneModel, completion: @escaping(Result <Void, Error>) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        context.delete(model)
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DatabaseError.FailedToDeleteData))
        }
    }
}
