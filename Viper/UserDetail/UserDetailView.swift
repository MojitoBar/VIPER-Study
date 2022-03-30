//
//  UserDetailView.swift
//  Viper
//
//  Created by judongseok on 2022/03/30.
//

import Foundation
import UIKit

protocol UserDetailUpdatable {
    func initial()
}

class UserDetailView: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
    }
    
    func initial() {
        
    }
}
