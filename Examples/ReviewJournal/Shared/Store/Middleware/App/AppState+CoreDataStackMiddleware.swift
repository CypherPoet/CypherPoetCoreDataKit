//
// AppState+LoggingMiddleware.swift
// Shared
//
// Created by CypherPoet on 12/1/20.
// ✌️
//

import Foundation
import Combine
import CypherPoetReduxUtils
import CoreDataKit


extension AppState {
    
    struct CoreDataStackMiddleware {
        var runner: Middleware<AppState, AppState.Action>
        

        static func make(
            coreDataManager: CoreDataManager = .current
        ) -> Self {
            Self { state, action -> AnyPublisher<AppState.Action, Never>? in
                switch action {
                case .setupCoreDataStack:
                    let backgroundQueue = DispatchQueue(label: "CoreDataStackMiddleware")
                    
                    return coreDataManager
                        .setup(runningOn: backgroundQueue)
                        .map { _ in
                            AppState.Action.coreDataSetupCompleted
                        }
                        .catch { error -> Just<AppState.Action> in
                            return Just(AppState.Action.coreDataSetupFailed(.coreDataManagerError(error)))
                        }
                        .eraseToAnyPublisher()
                default:
                    return Empty().eraseToAnyPublisher()
                }
            }
        }
    }
}
