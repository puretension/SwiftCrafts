//
//  OnboardingView.swift
//  voiceMemo
//

//온보딩에 필요했던 파일들
// -> OnboardingView,ViewModel, Home, Model(PathTypes, OnboardingContent)

import SwiftUI
//ViewModel에서 ObserveableObject, @Published
//View에서 @StateObject, @ObservedObject

// @StateObject - 외부 주입 X, 최초 생성 선언시에만 사용
// @ObservedObject - @ObservedObject값이 업데이트되면 View 업데이트


// MARK: - 온보딩 뷰 > 온보딩 컨텐츠 뷰 > 온보딩 셀 리스트 뷰 > 온보딩 셀 뷰

struct OnboardingView: View {
    //외부 주입 X, 최초 생성 선언시에만 사용
    @StateObject private var pathModel = PathModel()
    @StateObject private var onboardingViewModel = OnboardingViewModel()
    
    var body: some View {
        // TODO: - 화면 전환 구현 필요
        //    OnboardingContentView(onboardingViewModel: onboardingViewModel)
        NavigationStack(path: $pathModel.paths) {
            OnboardingContentView(onboardingViewModel: onboardingViewModel)
                .navigationDestination(for: PathType.self)
            {
                pathType in
                switch pathType {
                case .homeView:
                    HomeView()
                        .navigationBarBackButtonHidden()
                    
                case .todoView:
                    TodoView()
                        .navigationBarBackButtonHidden()
                    
                case .memoView:
                    MemoView()
                        .navigationBarBackButtonHidden()
                }
            }
        }
        .environmentObject(pathModel)
    }
}

// MARK: - 온보딩 컨텐츠 뷰

private struct OnboardingContentView: View {
    @ObservedObject private var onboardingViewModel: OnboardingViewModel
    
    // 온보딩 컨텐츠 뷰는 OnboardingView, 즉 이 파일내에서만 사용되므로 fileprivate 선언!
    fileprivate init(onboardingViewModel: OnboardingViewModel) {
        self.onboardingViewModel = onboardingViewModel
    }
    
    fileprivate var body: some View {
        VStack{
            // 온보딩 셀리스트 뷰
            OnboardingCellListView(onboardingViewModel: onboardingViewModel)
            Spacer()
            // 시작 버튼 뷰
            StartBtnView()
        }
        .edgesIgnoringSafeArea(.top)
    }
}

// MARK: - 온보딩 셀 리스트 뷰
private struct OnboardingCellListView: View{
    @ObservedObject private var onboardingViewModel: OnboardingViewModel
    @State private var selectedIndex: Int
    
    fileprivate init(onboardingViewModel: OnboardingViewModel, selectedIndex: Int = 0) {
        self.onboardingViewModel = onboardingViewModel
        self.selectedIndex = selectedIndex
    }
    
    fileprivate var body: some View{
        TabView(selection: $selectedIndex,
                content:  {
            //⭐️TabView, ForEach Array!!
            ForEach(Array(onboardingViewModel.onboardingContents.enumerated()), id: \.element) { index, onboardingContent in
                OnboardingCellView(onboardingContent: onboardingContent)
                    .tag(index)
            }
        }).tabViewStyle(.page(indexDisplayMode: .never))
            .frame(width: UIScreen.main.bounds.width, 
                   height: UIScreen.main.bounds.height / 1.3)
            .background(
            selectedIndex % 2 == 0
            ? Color.customSky
            : Color.customBackgroundGreen
            )
            .clipped()
    }
}

// MARK: - 온보딩 셀 뷰(사실상 UI)
private struct OnboardingCellView: View{
    private var onboardingContent: OnboardingContent
    
    fileprivate init(onboardingContent: OnboardingContent) {
        self.onboardingContent = onboardingContent
    }
    
    fileprivate var body: some View{
        VStack{
            Image(onboardingContent.imageFileName)
                .resizable()
                .scaledToFit()
            
            HStack{
                Spacer()
                
                VStack{
                    Spacer()
                        .frame(height: 46)
                    
                    Text(onboardingContent.title)
                        .font(.system(size: 16, weight: .bold))
                    
                    Spacer()
                        .frame(height: 5)
                    
                    Text(onboardingContent.subTitle)
                        .font(.system(size: 16))
                }
                Spacer()
            }
            .background(Color.customWhite)
            .cornerRadius(0)
        }
        .shadow(radius: 10)
    }
}

// MARK: - 시작하기 버튼 뷰
// 단순한 버튼이므로 ViewModel 필요X
private struct StartBtnView: View {
    @EnvironmentObject private var pathModel: PathModel
    
    fileprivate var body: some View {
            Button(
                action: {
                    pathModel.paths.append(.homeView)
                },
                label: {
                Text("시작하기")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.customGreen)
                    
                Image("startHome")
                        .renderingMode(.template)
                        .foregroundColor(.customGreen)
            })
        .padding(.bottom, 50)
    }
}




struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView()
  }
}
