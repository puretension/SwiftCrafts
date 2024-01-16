//
//  ToodoListView.swift
//  voiceMemo
//

import SwiftUI

// ✅

struct TodoListView: View {
    @EnvironmentObject private var pathModel: PathModel
    @EnvironmentObject private var todoListViewModel: TodoListViewModel
    
    var body: some View {
        ZStack {
            // 투두 셀 리스트 구현하기
            VStack {
                // todo가 비어있지 않다면?
                if !todoListViewModel.todos.isEmpty {
                    CustomNavigationBar(
                        isDisplayLeftBtn: false,
                        rightBtnAction: {
                            todoListViewModel.navigationRightBtnTapped()
                        },
                        rightBtnType: todoListViewModel.navigationBarRightBtnMode
                    )
                } 
                // 비어있다면 해당(앱바) 높이만큼 공백
                else {
                    Spacer()
                        .frame(height: 30)
                }
                // "To do list를 추가해 보세요."
                TitleView()
                    .padding(.top, 20)
                
                if todoListViewModel.todos.isEmpty {
                    //중간 그림, 글자
                    AnnouncementView()
                } else{
                    // To do list 있다면 표시!
                    TodoListContentView()
                        .padding(.top, 20)
                }
            }
            WriteTodoBtnView()
                .padding(.trailing, 20)
                .padding(.bottom, 50)
        }
        .alert(
            "To do list \(todoListViewModel.removeTodosCount)개 삭제하시겠습니까?",
            isPresented: $todoListViewModel.isDisplayRemoveTodoAlert
        ){
            Button("삭제", role: .destructive){
                todoListViewModel.removeBtnTapped()
            }
            Button("취소", role: .cancel){
                //
            }
        }
    }
}

// MARK: - TodoList 타이틀 뷰

private struct TitleView: View{
    @EnvironmentObject private var todoListViewModel: TodoListViewModel
    
    fileprivate var body: some View {
        HStack {
            if todoListViewModel.todos.isEmpty {
                Text("To do list를\n추가해 보세요.")
            } else {
                Text("To do list \(todoListViewModel.todos.count)개가\n있습니다.")
            }
            Spacer()
        }
        .font(.system(size: 30, weight: .bold))
        .padding(.leading, 20)
    }
}


// MARK: - TodoList 안내 뷰
private struct AnnouncementView: View {
    fileprivate var body: some View {
        VStack(spacing : 15) {
            Spacer()
            
            Image("pencil")
                .renderingMode(.template)
            Text("\"매일 아침 5시 운동하자!\"")
            Text("\"내일 8시 수강 운동하자!\"")
            Text("\"1시 반 점심약속 리마인드 하자!\"")
            
            Spacer()
        }
        .font(.system(size: 16))
        .foregroundColor(.customGray2)
    }
}

// MARK: - TodoList 컨텐츠 뷰
private struct TodoListContentView: View {
    @EnvironmentObject private var todoListViewModel: TodoListViewModel
    
    fileprivate var body: some View {
        VStack {
            HStack {
                Text("할일 목록")
                    .font(.system(size: 16, weight: .bold))
                    .padding(.leading, 20)
                
                Spacer()
            }
            
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    Rectangle().fill(Color.customGray0).frame(height: 1)
                    
                    ForEach(todoListViewModel.todos, id: \.self) { todo in
                        // TODO: - Todo 셀 뷰 todo 넣어서 뷰 호출
                        TodoCellView(todoListViewModel: todoListViewModel, todo: todo)
                    }
                }
            }
        }
    }
}


// MARK: - Todo 각각의 셀 뷰
private struct TodoCellView: View {
    @EnvironmentObject private var todoListViewModel: TodoListViewModel
    @State private var isRemoveSelected: Bool
    private var todo: Todo
    
    fileprivate init(
        todoListViewModel: TodoListViewModel,
        isRemoveSelected: Bool = false,
        todo: Todo)
    {
        _isRemoveSelected = State(initialValue: isRemoveSelected)
        self.todo = todo
    }
    
    fileprivate var body: some View {
        VStack(spacing: 20) {
            HStack {
                // 편집 모드가 아니라면?
                if !todoListViewModel.isEditTodoMode {
                    Button(
                        action: {todoListViewModel.selectedBoxTapped(todo) },
                        label: { todo.selected ? Image("selectedBox") : Image("unSelectedBox") }
                    )
                }
                //
                VStack(alignment: .leading, spacing: 5, content: {
                    Text(todo.title)
                        .font(.system(size: 16))
                        .foregroundColor(todo.selected ? .customIconGray : .customBlack)
                        .strikethrough(todo.selected) // 선택되면 가운데 줄(제거 될 항목)
                    
                    Text(todo.convertedDayAndTime)
                        .font(.system(size: 16))
                        .foregroundColor(.customIconGray)
                })
                
                Spacer()
                
                if todoListViewModel.isEditTodoMode {
                    Button {
                        isRemoveSelected.toggle()  //채크박스 누른 상태에서 편집시 원래 상태 돌아와야하므로
                        todoListViewModel.todoRemoveSelectedBoxTapped(todo) //선택된 체크박스 셀 제거
                    } label: {
                        isRemoveSelected ? Image("selectedBox") : Image("unSelectedBox")
                    }

                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
            Rectangle()
                .fill(Color.customGray0)
                .frame(height: 1)
        }
    }
}

// MARK: - Todo 작성 버튼뷰

private struct WriteTodoBtnView: View {
    @EnvironmentObject private var pathModel: PathModel
    
    fileprivate var body: some View {
        VStack {
            Spacer()
            
            HStack{
                Spacer()
                
                Button(
                    action: {
                        pathModel.paths.append(.todoView)
                },
                    label: {
                    Image("writeBtn")
                })
            }
        }
    }
    
}


struct TodoListView_Previews: PreviewProvider {
  static var previews: some View {
    TodoListView()
          .environmentObject(PathModel())
          .environmentObject(TodoListViewModel())
  }
}
