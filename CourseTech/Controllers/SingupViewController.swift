//
//  SingupViewController.swift
//  CourseTech
//
//  Created by Tyler Higgs on 7/29/20.
//  Copyright © 2020 Tyler Higgs. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    var bottomConstraint: NSLayoutConstraint? = nil
    
    let button: KeyboardRaisingButton = KeyboardRaisingButton.button(self, "Sign Up", #selector(SignupViewController.buttonPressed))
    

    override func viewDidLoad() {
        super.viewDidLoad()


        bottomConstraint = button.constrain(self, view)

  
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        firstNameTextField.textContentType = UITextContentType.givenName
        lastNameTextField.textContentType = UITextContentType.familyName
        firstNameTextField.reloadInputViews()
        lastNameTextField.reloadInputViews()
        firstNameTextField.autocorrectionType = .no
        firstNameTextField.autocorrectionType = .yes

        FieldHelper.clearNavigationBar(self)

        
        //Listen for keyboard events
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)

        firstNameTextField.becomeFirstResponder()

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
        
         if textField == firstNameTextField {
            lastNameTextField.becomeFirstResponder()
         } else if textField == lastNameTextField {
            // here you can define what happens
            // when user presses return on the last name field
            //textField.resignFirstResponder()
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
        FieldHelper.fieldsEdited(sender, button, firstNameTextField, lastNameTextField)
    }
    
    @objc func buttonPressed(_ b: UIButton) {
        print("the")
    }
    
}
