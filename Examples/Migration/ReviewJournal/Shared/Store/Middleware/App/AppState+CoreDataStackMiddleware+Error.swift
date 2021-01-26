//
// AppState+CoreDataStackMiddleware.swift
// Shared
//
// Created by CypherPoet on 11/23/20.
// ✌️
//

// 📝 Adding this layer is a good way to expose an error interface to the `State`
// types using our middleware -- while also adopting `LocalizedError` to
// define more descriptive, potentially-user-facing descriptions.


import Foundation
import CypherPoetCoreDataKit


extension AppState.CoreDataStackMiddleware {

    enum Error: Swift.Error {
        case coreDataManagerError(CoreDataManager.Error)
    }
}


extension AppState.CoreDataStackMiddleware.Error: Identifiable {
    var id: UUID { .init() }
}


extension AppState.CoreDataStackMiddleware.Error: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .coreDataManagerError(let error):
            switch error {
            case .migrationFailed(let persistentStoreMigratorError):
                return "Failed to migrate persistent stores. Error: \(persistentStoreMigratorError.localizedDescription)"
            case .persistentStoreURLNotFound:
                return "Failed to find persistent store"
            default:
                return "An error occurred while setting up the app's data store."
            }
        }
    }
}
