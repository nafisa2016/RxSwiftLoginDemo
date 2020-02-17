//
//  LoginViewModel.swift
//  RxSwiftLoginDemo
//
//  Created by Nafisa Rahman on 1/6/20.
//  Copyright © 2020 com.nafisa. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct LogInViewModel {
    var userName = BehaviorRelay<String>(value: "")
    var password = BehaviorRelay<String>(value: "")
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(userName.asObservable(),password.asObservable()){ email,password in
            email.count >= 3 && password.count >= 3
        }
    }
}
