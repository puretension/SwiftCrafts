# SwiftUI의 Property Wrappers

### @State

- SwiftUI에서 상태 처리(값 변경시 뷰 업데이트)
- 뷰의 상태를 저장하는 프로퍼티로 상태관리 주체는 해당뷰
- private으로 선언되기에 다른 뷰와 값 소통시 Binding 이용

### @Binding

- 뷰와 상태를 바인딩하는 방법
- 상위 @State 변수를 전달받아 하위 뷰에서 캐치한 변화 감지 및 연결
- Binding은 다른 뷰가 소유한 속성을 연결하기에 소유권이나 저장공간이 없음

### @ObservableObject(ViewModel)

- 클래스 프로토콜
- 관찰하는 어떤 값이 변경되면 변경사항 알려줌(주로 ViewModel에서 채택)
- View에서 인스턴스 변화를 감시하기 위해 ViewModel 객체로 생성시 주로 사용

### @Published(ViewModel)

- ObservableObject를 구현한 클래스 내에서 프로퍼티 선언시 사용
- @Published 선언된 프로퍼티를 뷰에서 관찰 가능
- ObservableObject의 ObjectWillChange.send() 기능을 @Published 프로퍼티가 변경되면 자동으로 호출함

### @ObservedObject(View)

- View에서 ObservedObject타입의 인스턴스 선언시 사용
- ObservedObject값이 업데이트되면 뷰를 업데이트

### @StateObject(View)

- View에서 ObservedObject타입의 인스턴스 선언 시 사용
- View에서 하나의 인스턴스를 생성하며, 뷰가 사라지기 전까지 같은 인스턴스 유지
- ObservedObject의 View 렌더링 시 인스턴스 초기화 이슈 해결을 위한 방법
- 매번 인스턴스가 새롭게 생성되는것처럼 외부에서 주입 받는 경우가 아닌 `최초 생성 선언 시`에 @StateObject를 사용하는 것이 적절한 방법

### @Environment

- 미리 정의되어 있는 시스템 공유 데이터
- 사용하려는 공유 데이터의 이름을 keyPath로 전달하여 사용
- 시스템 공유 데이터는 가변하기에 var 선언
- View가 생성되는 시점에 값이 자동 초기화

### @EnvironmentObject

- 앱 전역에서 공통으로 사용할 데이터를 주입 및 사용
- 데이터 의존성 주의

## SwiftUI와 MVVM

- SwiftUI의 Property Wrapper 사용과 구조들로 이미 MVVM
- 사실 모델과 뷰가 결합된 MV면 충분함
- 상태관리 중심에 조금 더 집중함
- View내에서 비즈니스 로직과 상태관리를 위한 프로퍼티들을 ViewModel로 분리함

### 데이터 바인딩을 위해 MVVM패턴을 사용한다기보단 적절한 상태관리를 위해 사용한다!
