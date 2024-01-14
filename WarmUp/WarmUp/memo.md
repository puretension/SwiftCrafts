# Memo

## State와 Binding
- 데이터의 상태를 나타내는 State
- struct이기에 필요한 기능
- 화면이 새로 그려져야할 때를 알려준다
- ⭐️@State로 표시함(스크린 재빌드, setstate)
- State에 $를 붙이면 Binding
- State가 붙잡고 있는상태를 연결 해줄때(두 State가 연결되어있을때 = 바인딩되어 있을때)

## 리스트에 추가/삭제
- 데이터를 바꾸는 것은 쉽다
- 상태를 잘 이해하기만 한다면!
- 추가는 append, 삭제는 remove
- 이미 구현되어 제공되는 기능들  


## Navigator&TabView

### Modal
- @Binding, @State, Button.sheet(isPresented: $showModal)

### Navigation
- 키워드는 NavaigationStack(위에 쌓인다), NavigationLink로 이동
- toolbar-ToolBarItem을 통한 이동

## TabView
- 다양한 내용이 하나의 앱에 들어가야 할 때 화면을 구상후 탭을 나눈다(one 탭 = one 화면)
- TabView{ View1.badge(1). tabItem{}}.tabViewStyle

### ⭐️if let 구문을 통한 옵셔널 바인딩
```swift
   struct OnboardingSample: View {
    let title: String
    let backgroundColor: Color
    @Binding var showModal: Bool? //Optional로

    // ⭐️
    init(title: String? = "Onboarding Test",
         backgroundColor: Color? = .blue,
         // Optional로
         showModal: Binding<Bool?>? = nil) {
        self.title = title ?? "Onboarding Test"
        self.backgroundColor = backgroundColor ?? .blue
        //if let Binding
        // showModal이 nil이 아니라 실제로 값이 있는 경우, 이 코드 블록이 실행
        if let showModal = showModal {
            //backing property => 언더바varname
               self._showModal = showModal
           } else {
               //showModal 파라미터가 nil인 경우
               self._showModal = .constant(nil) // Default binding
           }
    }
    }
```

