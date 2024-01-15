//
//  MyViewController.swift
//  MyUIKit
//
//  Created by 이도형 on 1/14/24.
//

import UIKit

protocol AdminDelegate{
    func doTask()
}

class MyViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var helloLabel: UILabel!
    
    var admin: Admin?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        admin = Admin(delegate: self)
        admin?.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        if let name = nameTextField{
            helloLabel.text = "hello \(nameTextField.text!)"
        }
        admin?.delegate.doTask()
            
    }
}

extension MyViewController: AdminDelegate{
    func doTask(){
        print("I'm working well now")
    }
}

struct Admin{
    var delegate: AdminDelegate
}
