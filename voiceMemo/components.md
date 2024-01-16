#  To do List 사용되는 컴포넌트
- TextField
- DatePicker
- ZStack & overlay(차이점)
- ScrollView
- Rectangle & Divider
- alert

### TextField
- @State 변수, 바인딩 필요

### @FocusState
- Scene내 Focusing위치가 변경됨에 따라 SwiftUI가 업데이트하는 값을 읽고 쓸 수 있도록 함
- Hashable프로토콜을 따르며 login구현시 ID,PW 검사에 유용

### DatePicker
- A control for selecting an absolute date
- @State 변수, 바인딩 필요
- calendar, date, time 설정시 유용

#### DatePickerStyle
- compact(간결, 간단)
- graphical(직관적)
- wheel

### ZStack & Overlay
- 겹쳐서 표현할때 사용(공통점)
- ZStack은 Z축을 기준으로 하위뷰를 얹어준다면
- Overlay는 현재 뷰를 기준으로 하위 뷰를 얹어준다.

### ScrollView
- content, axes(alignment로 설정), showIndicators(bool, 스크롤 막대바 띄울것인가?)

### Rectangle & Divider(유사하나 차이점 있다.)
- Divider의 경우 구분선 높이지정 불가하나, 
- Rectangle은 구분선 높이지정 가능하기에 Divider의 역할도 충분히 가능함
- 커스텀가능한 Rectangle을 쓰자!

### alert
- @State 변수, 바인딩 필요
- @State info변수에 에러 넣고, isDisplayAlert bool변수를 true
- 표시할 타이틀(ex. 경고 발생!), isPresented: $isDisplayAlert(노출 감지할 변수 값), presenting: info(넘겨줄 데이터)
- 엑션과 메시지
- 에러처리 잘해주자!
- cancel버튼은 자동 생성됨!
- 로그아웃 컴포넌트 만들엇던거 생각!
