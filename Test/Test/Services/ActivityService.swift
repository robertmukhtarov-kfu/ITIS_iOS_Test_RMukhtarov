//
//  JokeService.swift
//  Test
//
//  Created by Robert Mukhtarov on 22.11.2021.
//

import Foundation
import Combine

final class ActivityService {
    private let url: URL = {
        guard let url = URL(string: "https://www.boredapi.com/api/activity") else {
            fatalError("Invalid URL")
        }
        return url
    }()

    private var cancellables = Set<AnyCancellable>()

    func loadActivity(completion: @escaping (String) -> Void) {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Activity.self, decoder: JSONDecoder())
            .map(\.activity)
            .receive(on: DispatchQueue.main)
            .sink { taskCompletion in
                if case .failure = taskCompletion {
                    completion("Error: failed to load an activity")
                }
            } receiveValue: { value in
                completion(value)
            }
            .store(in: &cancellables)
    }
}
