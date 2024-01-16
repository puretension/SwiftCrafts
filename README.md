# 🍎 SwiftCrafts
### Crafts created through the journey of learning UIKit & SwiftUI

## 1. LoginView(UIKit) - 2023/10/11
- 코드만으로 로그인 화면 UI 만들기(NSLayoutConstraint로 정리)
- 텍스트필드 동작 감지 UI 변경(addTarget)
- selector, @objc 어노테이션, UITextFieldDelegate extension
- UIAlertController로 alert창 띄우기
- 새로운 scene 객체가 앱에 추가될 때마다 호출되는 SceneDelegate의 willConnectTo

<img width="314" alt="Simulator Screenshot - iPhone 15 Pro - 2024-01-14 at 00 25 18" src="https://github.com/puretension/SwiftCrafts/assets/106448279/dcc0715f-143b-4ec2-972e-fbd5f5a0119b">
<img width="314" alt="Simulator Screenshot - iPhone 15 Pro - 2024-01-14 at 00 25 42" src="https://github.com/puretension/SwiftCrafts/assets/106448279/5823a3b3-7943-4f81-b023-7d1e711da93e">

## 2. BIMCalculator(UIKit) - 2023/10/12
- UIStackView를 활용한 레이아웃 구성
- 텍스트필드 동작 감지 UI 변경(addTarget)
- UITextFieldDelegate 프로토콜을 활용하여 텍스트 필드의 행동(키보드 return) 관리
- BMI 계산 및 결과 화면 전환:사용자가 입력한 키와 몸무게 값을 바탕으로 BMI를 계산하고, 그 결과를 다른 뷰 컨트롤러(ResultViewController)에 전달하여 결과를 표시

<img width="314" alt="Simulator Screenshot - iPhone 15 Pro - 2024-01-14 at 00 21 33" src="https://github.com/puretension/SwiftCrafts/assets/106448279/fb775b79-bcc5-49f4-97eb-f5a0b817bf01">
<img width="314" alt="Simulator Screenshot - iPhone 15 Pro - 2024-01-14 at 00 22 30" src="https://github.com/puretension/SwiftCrafts/assets/106448279/cdc74b87-f1b8-4709-bae5-6aa362d6ca25">


## 3. WarmUp(SwiftUI) - 2024/01/13~2024/01/14
- SwiftUI 입문 With [fastcampus](https://fastcampus.co.kr/courses/218321)😀
- VStack, HStack, Image, Button등의 기본 구성 요소들을 활용하며 레이아웃 그리기 연습

<img width="314" alt="Simulator Screenshot - iPhone 15 Pro - 2024-01-14 at 00 21 33" src="https://github.com/puretension/SwiftCrafts/assets/106448279/d3c68ac2-160b-4c21-bee3-8158ca47ac16">
<img width="314" alt="Simulator Screenshot - iPhone 15 Pro - 2024-01-14 at 00 22 30" src="https://github.com/puretension/SwiftCrafts/assets/106448279/6d837fe4-7bf8-4e7e-a108-5b69ed5f6d65">

## 4. WarmUp(SwiftUI) - 2024/01/14
- ListView를 통해 적용하는 데이터 모델링
- ⭐️Hashable, NavigationStack, List, ForEach, Section⭐️
- ⭐️@State와 Binding 데이터의 상태를 나타내는 State, State에 $를 붙이면 Binding
- (두 State가 연결되어있을때 = 바인딩되어 있을때) 화면 재빌드!

<img width="314" alt="Simulator Screenshot - iPhone 15 Pro - 2024-01-14 at 00 21 33" src="https://github.com/puretension/SwiftCrafts/assets/106448279/99244a77-12b6-4387-9fbe-446ecdfbfeb5">
<img width="314" alt="Simulator Screenshot - iPhone 15 Pro - 2024-01-14 at 00 22 30" src="https://github.com/puretension/SwiftCrafts/assets/106448279/5acf2657-1b0b-49f1-9de8-c1baed5fc45c">

## 5. WarmUp(SwiftUI) - 2024/01/14
### ⭐️Navigator&TabView
#### Modal
- @Binding, @State, Button.sheet(isPresented: $showModal)

#### Navigation
- 키워드는 NavaigationStack(위에 쌓인다), NavigationLink로 이동
- toolbar-ToolBarItem을 통한 이동

#### TabView
- 다양한 내용이 하나의 앱에 들어가야 할 때 화면을 구상후 탭을 나눈다(one 탭 = one 화면)
- TabView{ View1.badge(1). tabItem{}}.tabViewStyle
  
#### if let 구문을 통한 옵셔널 바인딩(memo 참고)

<img width="314" alt="Simulator Screenshot - iPhone 15 Pro - 2024-01-14 at 00 22 30" src="https://github.com/puretension/SwiftCrafts/assets/106448279/f2a18628-ef42-429f-a0a5-4f86f291e91e">


## 6. WarmUp(UIKit) - 2024/01/14~2024/01/15
- View와 ViewController
- 오토레이아웃
- TableView(Delegate, Datasource)
- NavigationController, Segue(아직 흡수X)
<img width="314" alt="Simulator Screenshot - iPhone 15 Pro - 2024-01-14 at 00 21 33" src="https://github.com/puretension/SwiftCrafts/assets/106448279/8d69742a-b7c2-4d3a-b1b1-e48976e1c4f9">

## 7. VoiceMemo(SwiftUI) - 2024/01/14~
### 1. Onboarding(01/14~01/15)
- VoiceMemo App clone with SwiftUI
- PropertyWrappers가 MVVM에서 어떻게, 왜 쓰이는지
- Onboarding 구현을 통한 UI, Property Wrappers, NavigationStack
- 나머지는 [PropertyWrappers.md](https://github.com/puretension/SwiftCrafts/blob/main/voiceMemo/PropertyWrappers.md) 참고
<img width="314" alt="Simulator Screenshot - iPhone 15 Pro - 2024-01-14 at 00 21 33" src="https://github.com/puretension/SwiftCrafts/assets/106448279/19696874-da44-4a0d-994c-0bd971dce3df">

### 2. TodoList(01/16~01/17)
- To do list 구현하기
- DatePicker를 통한 date, time calendar 설정(graphical 예쁘다)
- alert(@State-Binding, 삭제/취소)
- @EnvironmentObject를 포함한 property Wrapper 사용 적응하기
- Components? [components.md](https://github.com/puretension/SwiftCrafts/blob/main/voiceMemo/components.md) 참고
<img width="314" alt="Simulator Screenshot - iPhone 15 Pro - 2024-01-14 at 00 21 33" src="https://github.com/puretension/SwiftCrafts/assets/106448279/9ebe1acf-6f94-4966-9057-88e319e52bec">



