//
//  Router.swift
//  Viper
//
//  Created by judongseok on 2022/03/30.
//

import Foundation
import UIKit

// Object
// Entry point

typealias EntryPoint = UserViewUpdatable & UIViewController

protocol UserRoutable {
    var entry: EntryPoint? { get }
    static func start() -> UserRoutable
    func showUserDetail(userInfo: User)
}

class UserRouter: UserRoutable {
    var entry: EntryPoint?
    
    static func start() -> UserRoutable {
        let router = UserRouter()
        
        // Assign VIP
        var view: UserViewUpdatable = UserViewController()
        var presenter: UserPresentable = UserPresenter()
        var interactor: UserInteractorable = UserInteractor()
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        view.presenter = presenter
        
        router.entry = view as? EntryPoint
        
        
        return router
    }
    
    func showUserDetail(userInfo: User) {
        guard let navigationController = entry?.navigationController else { return }
        
        let userDetailVC = UserDetailView()
        navigationController.pushViewController(userDetailVC, animated: true)
    }
}
