//
//  StartupViewController.swift
//  CourseTech
//
//  Created by Tyler Higgs on 7/25/20.
//  Copyright © 2020 Tyler Higgs. All rights reserved.
//

import UIKit

class StartupViewController: UIViewController {
    
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = loginButton.frame.size.height / 2
        signupButton.layer.cornerRadius = signupButton.frame.size.height / 2
    }
    
    // animation for the logo rising


}

