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

protocol AnyPresenter {
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
    func interactorDidFetchUsers(with result: Result<[User], Error>)
}

class UserPresernter: AnyPresenter {
    init() {
        print("UserPresenter Init")
    }
    var interactor: AnyInteractor? {
        didSet{
            interactor?.getUsers()
        }
    }
    
    var view: AnyView?
    
    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        switch result {
        case .success(let users):
            view?.update(with: users)
        case .failure:
            view?.update(with: "Somthing went worng")
        }
    }
}
