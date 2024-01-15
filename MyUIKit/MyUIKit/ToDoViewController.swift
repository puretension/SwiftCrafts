//
//  ToDoViewController.swift
//  MyUIKit
//
//  Created by 이도형 on 1/15/24.
//

import UIKit

struct ToDoItem{
    let title: String
    var isCompleted: Bool
}

class ToDoViewController: UIViewController {
    //todoCell
    
    @IBOutlet weak var todoTableView: UITableView!
    
    var data: [ToDoItem] = [
        ToDoItem(title: "커밋하기", isCompleted: false),
        ToDoItem(title: "운동하기", isCompleted: true),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        todoTableView.backgroundColor = .brown
        todoTableView.delegate = self
        todoTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
}


extension ToDoViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let myAction = UIContextualAction(style: .normal, title: "완료") { action, view, completionHandler in
            self.data[indexPath.row].isCompleted.toggle()
            completionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [myAction])
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].title
        
        if data[indexPath.row].isCompleted {
            cell.textLabel?.textColor = .green
        }else{
            cell.textLabel?.textColor = .blue
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        todoTableView.deselectRow(at: indexPath, animated: true)
    }
}
