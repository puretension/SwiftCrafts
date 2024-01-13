import UIKit

class LoginSucceedViewController: UIViewController {
    
    var email: String?
    var password: String?

    private let container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        emailLabel.text = "이메일: \(email ?? "??")"
        passwordLabel.text = "비밀번호: \(password ?? "??")"

        view.addSubview(container)
        container.addSubview(emailLabel)
        container.addSubview(passwordLabel)

        setupLayout()
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.widthAnchor.constraint(equalToConstant: 300),
            container.heightAnchor.constraint(equalToConstant: 100),

            emailLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            emailLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            emailLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            
            passwordLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            passwordLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            passwordLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20)
        ])
    }
}
