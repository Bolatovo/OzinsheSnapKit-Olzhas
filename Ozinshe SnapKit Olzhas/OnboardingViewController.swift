//
//  ViewController.swift
//  Ozinshe SnapKit Olzhas
//
//  Created by Olzhas Bolatov on 14.02.2024.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.register(OnboardingPageCell.self, forCellWithReuseIdentifier: "OnboardingPageCell")
        return collectionView
    }()
    // Данные
    private let pages: [OnboardingPage] = [
        OnboardingPage(imageName: "Onboarding1", title: "ÖZINŞE-ге қош келдің!", description: "Фильмдер, телехикаялар, ситкомдар, анимациялық жобалар, телебағдарламалар мен реалити-шоулар, аниме және тағы басқалары"),
        OnboardingPage(imageName: "Onboarding2", title: "ÖZINŞE-ге қош келдің!", description: "Кез келген құрылғыдан қара Сүйікті фильміңді  қосымша төлемсіз телефоннан, планшеттен, ноутбуктан қара"),
        OnboardingPage(imageName: "Onboarding3", title: "ÖZINŞE-ге қош келдің!", description: "Тіркелу оңай. Қазір тіркел де қалаған фильміңе қол жеткіз")
        ]
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor(red: 0.702, green: 0.463, blue: 0.969, alpha: 1)
        pageControl.pageIndicatorTintColor = UIColor(red: 0.82, green: 0.835, blue: 0.859, alpha: 1)
        pageControl.numberOfPages = 3
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupCollectionView()
        setupPageControl()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    // Constraints Slider
    private func setupPageControl() {
        view.addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(152)
        }
    }
}

extension OnboardingViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingPageCell", for: indexPath) as! OnboardingPageCell
        let page = pages[indexPath.item]
        cell.configure(with: page)
        cell.skipButton.isHidden = indexPath.item != 0 && indexPath.item != 1
        cell.signInButton.isHidden = indexPath.item != 2
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}

extension OnboardingViewController: OnboardingPageCellDelegate {
    
    //Нажате Откизу
    func skipButtonTapped() {
        
        let signInVC = SignInViewController()
        navigationController?.pushViewController(signInVC, animated: true)
        
    }
    // Нажате Ари карай
    func signInButtonTapped() {
        
        let signInVC = SignInViewController()
        navigationController?.pushViewController(signInVC, animated: true)
    }
}

protocol OnboardingPageCellDelegate: AnyObject {
    func skipButtonTapped()
    func signInButtonTapped()
}

class OnboardingPageCell: UICollectionViewCell {
    
    weak var delegate: OnboardingPageCellDelegate?
    
    //Фон
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //Титулка
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SF-Pro-Display-Bold", size: 24)
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.067, green: 0.094, blue: 0.153, alpha: 1)
        return label
    }()
    
    // Описание
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SF-Pro-Display-Medium", size: 14)
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.42, green: 0.447, blue: 0.502, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    //Өткізу
    let skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Өткізу", for: .normal)
        button.backgroundColor = UIColor(red: 0.976, green: 0.981, blue: 0.984, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    //Әрі қарай
    let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Әрі қарай", for: .normal)
        button.backgroundColor = UIColor(red: 0.496, green: 0.177, blue: 0.988, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(skipButton)
        contentView.addSubview(signInButton)
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(473)
            make.leading.trailing.equalToSuperview().inset(40)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(526)
            make.leading.trailing.equalToSuperview().inset(32)
        }
        
        skipButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(728)
            make.width.equalTo(70)
            make.height.equalTo(24)
            
        }
        
        signInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(100)
            make.width.equalTo(327)
            make.height.equalTo(56)
        }
    }
    // Кнопки
    private func setupActions() {
        skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }
    
    func configure(with page: OnboardingPage) {
        backgroundImageView.image = UIImage(named: page.imageName)
        titleLabel.text = page.title
        descriptionLabel.text = page.description
    }
    
    @objc private func skipButtonTapped() {
        delegate?.skipButtonTapped()
        
    }
    
    @objc private func signInButtonTapped() {
        delegate?.signInButtonTapped()
    }
}

struct OnboardingPage {
    let imageName: String
    let title: String
    let description: String
}


