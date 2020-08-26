//
//  LoginViewController.swift
//  WaterMyPlantsBW
//
//  Created by Clayton Watkins on 8/19/20.
//  Copyright © 2020 Clayton Watkins. All rights reserved.
//

import UIKit

enum LoginType: String {
    case signUp = "Sign Up"
    case signIn = "Sign In"
}

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    let defaults = UserDefaults.standard
    
    // var apiController: APIController?
    var loginType = LoginType.signUp
    
    var usernameTextField: UITextField = UITextField()
    var passwordTextField: UITextField = UITextField()
    var phoneNumberTextField: UITextField = UITextField()
    
    var loginTypeSegmentedControl: UISegmentedControl = {
        let items = [LoginType.signUp.rawValue, LoginType.signIn.rawValue]
        let segmentedControl = UISegmentedControl(items: items)
        return segmentedControl
    }()
    
    var signInButton: UIButton = UIButton()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        view.backgroundColor = .systemBlue
        navigationItem.title = "Sign Up"
        setUpViews()
    }
    
    // MARK: - Methods
    
    func setUpViews() {
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(phoneNumberTextField)
        view.addSubview(loginTypeSegmentedControl)
        view.addSubview(signInButton)
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTypeSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginTypeSegmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 128),
            loginTypeSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTypeSegmentedControl.heightAnchor.constraint(equalToConstant: 24),
            
            usernameTextField.topAnchor.constraint(equalTo: loginTypeSegmentedControl.bottomAnchor, constant: 24),
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.widthAnchor.constraint(equalToConstant: 196),
            
            phoneNumberTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 24),
            phoneNumberTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            phoneNumberTextField.widthAnchor.constraint(equalToConstant: 196),
            
            passwordTextField.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 24),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: 196),
            
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 24),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalToConstant: 64),
            
        ])
        
        loginTypeSegmentedControl.selectedSegmentIndex = 0
        
        usernameTextField.backgroundColor = .white
        usernameTextField.textColor = .black
        usernameTextField.placeholder = "Username"
        usernameTextField.layer.cornerRadius = 6.0
        
        phoneNumberTextField.backgroundColor = .white
        phoneNumberTextField.textColor = .black
        phoneNumberTextField.placeholder = "Phone Number"
        phoneNumberTextField.layer.cornerRadius = 6.0
        
        passwordTextField.backgroundColor = .white
        passwordTextField.textColor = .black
        passwordTextField.placeholder = "Password"
        passwordTextField.layer.cornerRadius = 6.0
        
        signInButton.backgroundColor = .none
        signInButton.tintColor = .black
        signInButton.setTitle("Sign Up", for: .normal)
        signInButton.layer.cornerRadius = 6.0
    }
/*
    func buttonTapped(_ sender: UIButton) {
        if let username = usernameTextField.text,
            !username.isEmpty,
            let password = passwordTextField.text,
            !password.isEmpty,
            let phoneNumber = phoneNumberTextField.text,
            !phoneNumber.isEmpty {
            let user = User(username: username,
                            password: password,
                            phoneNumber: phoneNumber)
            
            // Depending on LoginType:
            if loginType == .signUp {
                apiController?.signUp(with: user, completion: { (result) in
                    do {
                        let success = try result.get()
                        if success {
                            DispatchQueue.main.async {
                                let alertController = UIAlertController(title: "Sign Up Complete",
                                                                        message: "Please sign in",
                                                                        preferredStyle: .alert)
                                let alertAction = UIAlertAction(title: "OK",
                                                                style: .default,
                                                                handler: nil)
                                alertController.addAction(alertAction)
                                self.present(alertController, animated: true) {
                                    self.loginType = .signIn
                                    self.loginTypeSegmentedControl.selectedSegmentIndex = 1
                                    self.signInButton.setTitle("Sign In", for: .normal)
                                }
                            }
                        }
                    } catch {
                        NSLog("Error signing up: \(error)")
                    }
                })
            } else {
                apiController?.signIn(with: user, completion: { (result) in
                    do {
                        let success = try result.get()
                        if success {
                            DispatchQueue.main.async {
                                self.dismiss(animated: true, completion: nil)
                            }
                        }
                    } catch {
                        if let error = error as? APIController.NetworkError {
                            switch error {
                            case .failedSignIn:
                                NSLog("Sign in failed")
                            case .noToken:
                                NSLog("Invalid or missing token")
                            case .noData:
                                NSLog("No data received")
                            default:
                                NSLog("Unknown error occured")
                            }
                        }
                    }
                })
            }
        }
    }
    
    func signInTypeChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            loginType = .signUp
            signInButton.setTitle("Sign Up", for: .normal)
        } else {
            loginType = .signIn
            signInButton.setTitle("Sign In", for: .normal)
        }
    }
*/
}
