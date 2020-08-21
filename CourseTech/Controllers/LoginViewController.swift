//
//  LoginViewController.swift
//  CourseTech
//
//  Created by Tyler Higgs on 8/3/20.
//  Copyright © 2020 Tyler Higgs. All rights reserved.
//


import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var bottomConstraint: NSLayoutConstraint? = nil
    
    let button: KeyboardRaisingButton = KeyboardRaisingButton.button(self, "Login", #selector(LoginViewController.buttonPressed))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        bottomConstraint = button.constrain(self, view)
        
        
        emailField.delegate = self
        passwordField.delegate = self
        emailField.textContentType = .emailAddress
        emailField.keyboardType = .emailAddress
        emailField.reloadInputViews()
        passwordField.reloadInputViews()
        emailField.autocorrectionType = .no
        emailField.autocorrectionType = .yes

        FieldHelper.clearNavigationBar(self)
        
        //Listen for keyboard events
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)

        emailField.becomeFirstResponder()

    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
    }
    
    
    
    @objc func keyboardWillChange(notification: Notification) {
        
        FieldHelper.keyboardWillChange(notification: notification, bottomConstraint, view)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
         if textField == emailField {
             passwordField.becomeFirstResponder()
         } else if textField == passwordField {
            // here you can define what happens
            // when user presses return on the password field
            buttonPressed(button)
         }
         return true
     }
    
    /**
     * Called when the user click on the view (outside the UITextField).
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    @IBAction func fieldsEdited(_ sender: UITextField) {
        FieldHelper.fieldsEdited(sender, button, emailField, passwordField)
    }
    
    
    @objc func buttonPressed(_ b: UIButton) {
        print("the")
        performSegue(withIdentifier: K.loginSegue, sender: self)
    }
    
}

