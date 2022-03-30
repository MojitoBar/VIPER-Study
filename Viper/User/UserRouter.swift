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
}

class UserRouter: UserRoutable {
    var entry: EntryPoint?
    
    static func start() -> UserRoutable {
        let router = UserRouter()
        
        // Assign VIP
        let view: UserViewUpdatable = UserViewController()
        var presenter: AnyPresenter = UserPresernter()
        var interactor: UserInteractorable = UserInteractor()
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? EntryPoint
        
        return router
    }
}
