//
// NewReviewFormView+ViewModel.swift
// ReviewJournal
//
// Created by CypherPoet on 1/29/21.
// ✌️
//

import SwiftUI
import Combine
import PhotosUI
import CoreData


fileprivate typealias ViewModel = NewReviewFormView.ViewModel


extension NewReviewFormView {
    
    final class ViewModel {
        private var subscriptions = Set<AnyCancellable>()
        
        
        // MARK: - Init
        init(
        ) {
            print("Init")
            setupSubscribers()
        }
        
        
        // MARK: - Published Outputs
        @Published var selectedPhotos: [UIImage] = []
        @Published var photoPickerError: PhotoPickerComponent.Error? = nil
    }
}

extension ViewModel: ObservableObject {}


// MARK: - Computeds
extension ViewModel {
    
    var featuredImageData: Data? {
        selectedPhotos.first?.pngData()
    }
}


// MARK: - Public Methods
extension ViewModel {
    
    func handlePhotoPickingCompletion(_ results: [PHPickerResult]) {
        PhotoPickerComponent.generateUIImages(from: results)
            .receive(on: DispatchQueue.main)
            .drop(while: { $0.isEmpty })
            .handleEvents(
                receiveCompletion: { [weak self] completion in
                    guard let self = self else { return }
                    
                    if case .failure(let error) = completion {
                        self.photoPickerError = error
                    }
                }
            )
            .assertNoFailure()
            .print("handlePhotoPickingCompletion")
            .assign(to: &$selectedPhotos)
    }
    
    
    func handleSubmit(for newReview: Review, then completionHandler: () -> Void) {
        guard let managedObjectContext = newReview.managedObjectContext else {
            preconditionFailure()
        }
        
        let attachments = selectedPhotos.map { image -> ImageAttachment in
            let attachment = ImageAttachment(context: managedObjectContext)
            
            attachment.imageData = image.pngData()
            attachment.title = "New Photo"
            attachment.width = Float(image.size.width)
            attachment.height = Float(image.size.height)
            attachment.review = newReview
            
            return attachment
        }
        
        newReview.imageAttachments = Set(attachments)
        
        completionHandler()
    }
}


// MARK: - Publisher Factories
private extension ViewModel {
    
}


// MARK: - Private Helpers
private extension ViewModel {
    
    func setupSubscribers() {
    }
}
