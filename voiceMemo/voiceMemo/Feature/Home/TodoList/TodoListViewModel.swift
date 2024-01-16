//
//  TodoListViewModel.swift
//  voiceMemo
//

// ✅

import Foundation

class TodoListViewModel: ObservableObject {
    // Todo는 title, time, day, bool(isDisplayCalendar)
    @Published var todos: [Todo]
    @Published var isEditTodoMode: Bool // 여부에 따라 변경
    @Published var removeTodos: [Todo]
    @Published var isDisplayRemoveTodoAlert: Bool
    
    // Todolist N개 삭제하시겠습니까의 N
    var removeTodosCount: Int {
        return removeTodos.count
    }
    var navigationBarRightBtnMode: NavigationBtnType {
        isEditTodoMode ? .complete : .edit
    }
    
    init(
        //초기값 배정
        todos: [Todo] = [],
        isEditModeTodoMode: Bool = false,
        removeTodos: [Todo] = [],
        isDisplayRemoveTodoAlert: Bool = false
    )
    {
        self.todos = todos
        self.isEditTodoMode = isEditModeTodoMode
        self.removeTodos = removeTodos
        self.isDisplayRemoveTodoAlert = isDisplayRemoveTodoAlert
    }
}

extension TodoListViewModel {
    
    // todo Checkbox
    func selectedBoxTapped(_ todo: Todo){
        if let index = todos.firstIndex(where: {$0 == todo}) {
            todos[index].selected.toggle()
        }
    }
    
    func addTodo(_ todo: Todo) {
        todos.append(todo)
    }
    
    func navigationRightBtnTapped() {
        //편집모드에서,
        if isEditTodoMode {
            //todolist 셀 비어있게된다면
            if removeTodos.isEmpty {
                //편집모드 해제
                isEditTodoMode = false
            } else {
                //alert 호출(삭제하시겠습니까?)
                setIsDisplayRemoveTodoAlert(true)
            }
        } 
        // 편집 모드가 아닌데 rightbtn 클릭 했다면
        else {
            //편집 모드 온
            isEditTodoMode = true
        }
    }
    
    func setIsDisplayRemoveTodoAlert(_ isDisplay: Bool) {
        isDisplayRemoveTodoAlert = isDisplay
    }
    
    // 삭제될 TODO 정보(밑줄 그어진 채로 올거임)
    func todoRemoveSelectedBoxTapped(_ todo: Todo){
        if let index = removeTodos.firstIndex(of: todo){
            //밑줄 그어진 채로 온다면 체크박스 클릭시 해당 셀 삭제
            removeTodos.remove(at: index)
        } else {
            //아니라면 제거할 정보 리스트에 추가(밑줄 그어짐)
            removeTodos.append(todo)
        }
    }
    
    func removeBtnTapped() {
        todos.removeAll() { todo in
            removeTodos.contains(todo)
        }
        removeTodos.removeAll()
        isEditTodoMode = false
    }
}

