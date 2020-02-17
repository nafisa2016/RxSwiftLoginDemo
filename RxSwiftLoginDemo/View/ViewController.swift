//
//  ViewController.swift
//  RxSwiftLoginDemo
//
//  Created by Nafisa Rahman on 1/6/20.
//  Copyright © 2020 com.nafisa. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var nameTxtFld: UITextField!
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    let loginViewModel = LogInViewModel()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = nameTxtFld.rx.text.map{$0 ?? ""}.bind(to: loginViewModel.userName)
        _ = emailTxtFld.rx.text.map{$0 ?? ""}.bind(to: loginViewModel.password)

        _ = loginViewModel.isValid.subscribe(onNext: { [unowned self] isValid in
            self.loginBtn.isEnabled = isValid
            if isValid {
               print("valid")
            } else {
                print("invalid")
            }
        })
    }

    @IBAction func loginBtnTapped(_ sender: UIButton) {
    }
}

