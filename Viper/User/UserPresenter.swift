//
//  Presenter.swift
//  Viper
//
//  Created by judongseok on 2022/03/30.
//

import Foundation

// Object
// protocol
// ref to interactor, router, view

enum FetchError: Error {
    case failed
}

protocol UserPresentable {
    var interactor: UserInteractorable? { get set }
    var router: UserRoutable? { get set }
    var view: UserViewUpdatable? { get set }
    
    func interactorDidFetchUsers(with result: Result<[User], Error>)
    func showUserDetail(userInfo: User)
}

class UserPresenter: UserPresentable {
    var interactor: UserInteractorable? {
        didSet{
            interactor?.getUsers()
        }
    }
    
    var view: UserViewUpdatable?
    var router: UserRoutable?
    
    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        switch result {
        case .success(let users):
            view?.update(with: users)
        case .failure:
            view?.update(with: "Somthing went worng")
        }
    }
    
    func showUserDetail(userInfo: User) {
        router?.showUserDetail(userInfo: userInfo)
    }
}
