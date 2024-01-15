//
//  ViewController.swift
//  MyUIKit
//
//  Created by 이도형 on 1/14/24.
//

import UIKit

// UIViewController
class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad() // View를 먼저그리고
        //SwiftUI는 Color였지만 UIKit은 UIColor(조금씩 다르다.)
        view.backgroundColor = .green // 색 입혀라
        // Do any additional setup after loading the view.
    }
    
 
    @IBAction func didMyButtonTapped(_ sender: UIButton) {
        print("UIKit!!!")
        myLabel.text = "Hello UIKit"
    }
    

}

