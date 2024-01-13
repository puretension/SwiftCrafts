//
//  ResultViewController.swift
//  BMICalculator
//
//  Created by 이도형 on 2023/10/01.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiNumber: Double?
    var color: UIColor?
    var advice: String?
    
    private var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        return stackView
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "BMI 결과값"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    
    private let bmiNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let adviceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    private let againButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.5334014215, green: 0.3396973153, blue: 0.9393897635, alpha: 0.86)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.5334014215, green: 0.3396973153, blue: 0.9393897635, alpha: 0.86)
        button.setTitle("다시 계산하기", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(againButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        bmiNumberLabel.text = "\(bmiNumber!)"
        bmiNumberLabel.backgroundColor = color!
        adviceLabel.text = "\(advice!)"
        
        view.addSubview(mainStackView)
        view.addSubview(againButton)
        
        configureUI()
    }
    
    // UI셋팅
    func configureUI() {
        againButton.layer.cornerRadius = 5
        
        mainStackView.addArrangedSubview(resultLabel)
        mainStackView.addArrangedSubview(bmiNumberLabel)
        mainStackView.addArrangedSubview(adviceLabel)
        
        bmiNumberLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.widthAnchor.constraint(equalToConstant: 150),
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        againButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            againButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            againButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            againButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            againButton.heightAnchor.constraint(equalToConstant: 65)
        ])
        
        againButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            againButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            againButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            againButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            againButton.heightAnchor.constraint(equalToConstant: 65)
        ])
    }
    
    @objc func againButtonTapped() {
        self.dismiss(animated: true)
    }

}
