//
//  RegistrationViewController.swift
//  Ozinshe SnapKit Olzhas
//
//  Created by Olzhas Bolatov on 21.02.2024.
//

import UIKit
import SnapKit

class RegistrationViewController: UIViewController {
    
    
    //- MARK: - Элементы
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Тіркелу"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Деректерді толтырыңыз"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    private let loginDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Email:"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    private let passwordDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Құпия сөз"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    private let repeatPasswordDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Құпия сөзді қайталаңыз"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    private let loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Сіздің email"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Сіздің құпия сөзіңіз"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let repeatPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Сіздің құпия сөзіңіз"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let passwordVisibilityButton = UIButton(type: .custom)
    private let repeatPasswordVisibilityButton = UIButton(type: .custom)
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Тіркелу", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.496, green: 0.177, blue: 0.988, alpha: 1)
        button.layer.cornerRadius = 12
        return button
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сізде аккаунт бар ма? Тіркелу", for: .normal)
        button.setTitleColor(.white, for: .normal)
       // button.backgroundColor = .systemRed
        button.layer.cornerRadius = 8
        return button
    }()
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Мұндай email-ы бар пайдаланушы тіркелген"
        label.isHidden = true
        return label
    }()

    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    
    // MARK: - Добавления
    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(loginDescriptionLabel)
        view.addSubview(passwordDescriptionLabel)
        view.addSubview(repeatPasswordDescriptionLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(repeatPasswordTextField)
        view.addSubview(registerButton)
        view.addSubview(cancelButton)
        view.addSubview(errorLabel)
        
        //- MARK: - Constraints
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24)
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
        }
        
        loginDescriptionLabel.snp.makeConstraints { make in
            make.bottom.equalTo(loginTextField.snp.top).offset(-3)
            make.left.equalToSuperview().inset(24)
        }
        
        loginTextField.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(35)
            make.left.right.equalToSuperview().inset(24)
        }
        
        passwordDescriptionLabel.snp.makeConstraints { make in
            make.bottom.equalTo(passwordTextField.snp.top).offset(-3)
            make.left.equalToSuperview().inset(24)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(loginTextField.snp.bottom).offset(25)
            make.left.right.equalToSuperview().inset(24)
        }
        
        repeatPasswordDescriptionLabel.snp.makeConstraints { make in
            make.bottom.equalTo(repeatPasswordTextField.snp.top).offset(-3)
            make.left.equalToSuperview().inset(24)
        }
        
        repeatPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(25)
            make.left.right.equalToSuperview().inset(24)
        }
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(repeatPasswordTextField.snp.bottom).offset(32)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(50)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.top.equalTo(registerButton.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(50)
        }
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(repeatPasswordTextField.snp.bottom).offset(8)
            make.left.equalToSuperview().inset(24)
            make.right.equalToSuperview().inset(24)
        }
        
       
        passwordTextField.rightView = passwordVisibilityButton
        passwordTextField.rightViewMode = .always
        repeatPasswordTextField.rightView = repeatPasswordVisibilityButton
        repeatPasswordTextField.rightViewMode = .always
        
        
        passwordVisibilityButton.setImage(UIImage(systemName: "eye"), for: .normal)
        passwordVisibilityButton.tintColor = .lightGray
        passwordVisibilityButton.addTarget(self, action: #selector(passwordVisibilityButtonTapped), for: .touchUpInside)
        
        repeatPasswordVisibilityButton.setImage(UIImage(systemName: "eye"), for: .normal)
        repeatPasswordVisibilityButton.tintColor = .lightGray
        repeatPasswordVisibilityButton.addTarget(self, action: #selector(repeatPasswordVisibilityButtonTapped), for: .touchUpInside)
    }

    
    
    
    @objc private func passwordVisibilityButtonTapped() {
        passwordTextField.isSecureTextEntry.toggle()
        let imageName = passwordTextField.isSecureTextEntry ? "eye" : "eye.slash"
        passwordVisibilityButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc private func repeatPasswordVisibilityButtonTapped() {
        repeatPasswordTextField.isSecureTextEntry.toggle()
        let imageName = repeatPasswordTextField.isSecureTextEntry ? "eye" : "eye.slash"
        repeatPasswordVisibilityButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    @objc private func registerButtonTapped() {
        if !loginTextField.text!.contains("@") {
            errorLabel.isHidden = false
            return
        }
    }
}

