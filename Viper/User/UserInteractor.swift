//
//  Interactor.swift
//  Viper
//
//  Created by judongseok on 2022/03/30.
//

import Foundation

// object
// protocol
// ref to presenter

// https://jsonplaceholder.typicode.com/users

protocol UserInteractorable {
    var presenter: UserPresentable? { get set }
    
    func getUsers()
}

class UserInteractor: UserInteractorable {
    var presenter: UserPresentable?
    
    func getUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
                return
            }
            
            if let entities = try? JSONDecoder().decode([User].self, from: data) {
                self?.presenter?.interactorDidFetchUsers(with: .success(entities))
            }
            else {
                self?.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
            }
        }
        task.resume()
    }
}
