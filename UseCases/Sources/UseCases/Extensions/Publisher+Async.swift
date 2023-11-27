//
//  Publisher+Async.swift
//  UseCases
//
//  Created by Carl Funk on 10/28/23.
//  Copyright © 2023 Carl Funk. All rights reserved.
//

import Combine

public extension Publisher {
    func asyncStream() -> AsyncStream<Output> {
        AsyncStream<Output> { continuation in
            var cancellable: AnyCancellable?
            
            cancellable = sink { result in
                switch result {
                case .finished:
                    break
                case let .failure(error):
                    break
                }
                
                cancellable?.cancel()
            } receiveValue: { newValue in
                continuation.yield(newValue)
            }
            
            continuation.onTermination = { [cancellable] continuation in
                cancellable?.cancel()
            }
        }
    }
    
    func async() async throws -> Output {
        try await withCheckedThrowingContinuation { continuation in
            var cancellable: AnyCancellable?
            var finishedWithoutValue = true
            cancellable = sink { result in
                    switch result {
                    case .finished:
                        if finishedWithoutValue {
                            continuation.resume(throwing: PublisherAsyncError.finishedWithoutValue)
                        }
                    case let .failure(error):
                        continuation.resume(throwing: error)
                    }
                    cancellable?.cancel()
                } receiveValue: { value in
                    finishedWithoutValue = false
                    continuation.resume(with: .success(value))
                }
        }
    }
}
