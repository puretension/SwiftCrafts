//
//  ViewController.swift
//  BMICalculator
//
//  Created by 이도형 on 2023/09/30.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 키 입력하는 텍스트 뷰
    
    private var heightTextFieldView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        return stackView
    }()
    
    private var heightLabel: UILabel = {
        let label = UILabel()
        label.text = "키"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.white
        label.textAlignment = .center
        
        return label
    }()
    
    private var heightTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.textColor = .black
        tf.tintColor = .black
        tf.layer.cornerRadius = 5
        tf.clipsToBounds = true
        tf.placeholder = "cm단위로 입력해주세요"
        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return tf
    }()
    
    // MARK: - 몸무게 입력하는 텍스트 뷰
    
    private var weightTextFieldView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        return stackView
    }()
    
    private var weightLabel: UILabel = {
        let label = UILabel()
        label.text = "몸무게"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.white
        label.textAlignment = .center
        return label
    }()
    
    private var weightTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.textColor = .black
        tf.tintColor = .black
        tf.layer.cornerRadius = 5
        tf.clipsToBounds = true
        tf.placeholder = "kg단위로 입력해주세요"
        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return tf
    }()
    
    
    // MARK: - 설명 레이블, 계산 버튼, 전체 스택뷰
    private var explainLabel: UILabel = {
        let label = UILabel()
        label.text = "키와 몸무게를 입력해 주세요"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.white
        label.textAlignment = .center
        return label
    }()
    
    private var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        return stackView
    }()
    
    private let bmiButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.setTitle("BMI 계산하기", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.isEnabled = false
        button.addTarget(self, action: #selector(bmiButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    var bmi: Double?
    
    override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        super.viewDidLoad()
        heightTextField.delegate = self
        weightTextField.delegate = self
        configure()
    }
    
    // MARK: - 오토레이아웃 설정

    private func configure() {
       

        heightTextFieldView.addArrangedSubview(heightLabel)
        heightTextFieldView.addArrangedSubview(heightTextField)
        weightTextFieldView.addArrangedSubview(weightLabel)
        weightTextFieldView.addArrangedSubview(weightTextField)
        
        mainStackView.addArrangedSubview(explainLabel)
        mainStackView.addArrangedSubview(heightTextFieldView)
        mainStackView.addArrangedSubview(weightTextFieldView)
        
        view.addSubview(mainStackView)
        view.addSubview(bmiButton)

        
        heightTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        weightTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightLabel.widthAnchor.constraint(equalToConstant: 50),
            heightLabel.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weightLabel.widthAnchor.constraint(equalToConstant: 50),
            weightLabel.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        bmiButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bmiButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            bmiButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bmiButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bmiButton.heightAnchor.constraint(equalToConstant: 65)
        ])
    }

    @objc private func textFieldEditingChanged(_ textField: UITextField) {
        guard
            let height = heightTextField.text, !height.isEmpty,
            let weight = weightTextField.text, !weight.isEmpty
        else {
            bmiButton.isEnabled = false
            return
        }
        bmiButton.backgroundColor = #colorLiteral(red: 0.5334014215, green: 0.3396973153, blue: 0.9393897635, alpha: 0.86)
        bmiButton.isEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bmiButton.isEnabled = false
        explainLabel.text = "키와 몸무게를 입력해 주세요"
        bmiButton.backgroundColor = .clear
    }
    
    @objc func bmiButtonTapped() {
        let resultVC = ResultViewController()
        bmi = calculateBMI(height: heightTextField.text!, weight: weightTextField.text!)
        resultVC.bmiNumber = bmi
        resultVC.advice = getBMIAdviceString()
        resultVC.color = getBackgroundColor()
        
        resultVC.modalPresentationStyle = .fullScreen
        present(resultVC, animated: true, completion: nil)
        
//         다음화면으로 가기전에 텍스트필드 비우기
        heightTextField.text = ""
        weightTextField.text = ""
    }
    
    func calculateBMI(height: String, weight: String) -> Double{
        guard let h = Double(height), let w = Double(weight) else {return 0.0}
        var bmi = w / (h*h) * 10000
        bmi = round(bmi * 10) / 10
        print("BMI 결과값: \(bmi)")
        
        return bmi
    }
    
    // 색깔 얻는 메서드
    func getBackgroundColor() -> UIColor {
        guard let bmi = bmi else { return UIColor.black }
        switch bmi {
        case ..<18.6:
            return UIColor(displayP3Red: 22/255, green: 231/255, blue: 207/255, alpha: 1)
        case 18.6..<23.0:
            return UIColor(displayP3Red: 212/255, green: 251/255, blue: 121/255, alpha: 1)
        case 23.0..<25.0:
            return UIColor(displayP3Red: 218/255, green: 127/255, blue: 163/255, alpha: 1)
        case 25.0..<30.0:
            return UIColor(displayP3Red: 255/255, green: 150/255, blue: 141/255, alpha: 1)
        case 30.0...:
            return UIColor(displayP3Red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
        default:
            return UIColor.black
        }
    }
    
    // 문자열 얻는 메서드
    func getBMIAdviceString() -> String {
        guard let bmi = bmi else { return "" }
        switch bmi {
        case ..<18.6:
            return "저체중"
        case 18.6..<23.0:
            return "표준"
        case 23.0..<25.0:
            return "과체중"
        case 25.0..<30.0:
            return "중도비만"
        case 30.0...:
            return "고도비만"
        default:
            return ""
        }
    }
}


extension ViewController: UITextFieldDelegate {
    // 입력하거나 (지우거나) 할때마다 (한글자 한글자 입력하는 순간마다) 호출되는 메서드
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string)
        // "숫자"인 경우와 "지우는 경우"만 (글자입력을) 허용 하는 논리
        // (숫자로 변환이 된다면) || (지울때)
        if Int(string) != nil || string == "." || string == "" {
            return true  // 글자 입력을 허용
        }
        return false  // 글자입력 허용하지 않음
    }
    
    // 키보드 엔터키가 눌렸을때 (다음 동작을 허락할 것인지)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 두개의 텍스트필드를 모두 종료 (키보드 내려가기)
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        // 두번째 텍스트필드로 넘어가도록
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    // 텍스트필드 이외의 영역을 눌렀을때 키보드 내려가도록
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
    
}
