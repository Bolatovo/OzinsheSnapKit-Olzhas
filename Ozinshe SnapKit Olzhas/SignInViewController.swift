//
//  SingInViewController.swift
//  Ozinshe SnapKit Olzhas
//
//  Created by Olzhas Bolatov on 18.02.2024.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController {
    
    
    //- MARK: - Элементы
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Сәлем"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Аккаунтқа кіріңіз"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    private let loginDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Email:"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let passwordDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Құпия сөз"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
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
    
    private let passwordVisibilityButton = UIButton(type: .custom)
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Кіру", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.496, green: 0.177, blue: 0.988, alpha: 1)
        button.layer.cornerRadius = 12
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        let attributedTitle = NSMutableAttributedString(string: "Аккаунтыныз жоқ па? ", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        attributedTitle.append(NSAttributedString(string: "Тіркелу", attributes: [NSAttributedString.Key.foregroundColor: UIColor.purple]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.layer.cornerRadius = 8
        return button
    

    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Қате формат"
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
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        view.addSubview(errorLabel)
        //- MARK: - Constraints
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(34)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(24)
        }
        
        loginDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(29)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        loginTextField.snp.makeConstraints { make in
            make.top.equalTo(loginDescriptionLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        
        passwordDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(loginTextField.snp.bottom).offset(13)
            make.left.equalToSuperview().inset(24)
            make.right.equalToSuperview().inset(24)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordDescriptionLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(79)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(14)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(42)
        }
        
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(loginTextField.snp.bottom).offset(8)
            make.left.equalToSuperview().inset(24)
            make.right.equalToSuperview().inset(24)
        }
        
        
        passwordTextField.rightView = passwordVisibilityButton
        passwordTextField.rightViewMode = .always
        
        
        passwordVisibilityButton.setImage(UIImage(systemName: "eye"), for: .normal)
        passwordVisibilityButton.tintColor = .lightGray
        passwordVisibilityButton.addTarget(self, action: #selector(passwordVisibilityButtonTapped), for: .touchUpInside)
        
        
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    
    
    @objc private func passwordVisibilityButtonTapped() {
        passwordTextField.isSecureTextEntry.toggle()
        let imageName = passwordTextField.isSecureTextEntry ? "eye" : "eye.slash"
        passwordVisibilityButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc private func signUpButtonTapped() {
        
        if !loginTextField.text!.contains("@") {
           
            errorLabel.isHidden = false
            loginTextField.layer.borderColor = UIColor.red.cgColor
            return
        }
        
        
        let registrationVC = RegistrationViewController()
        navigationController?.pushViewController(registrationVC, animated: true)
    }
}
