//
//  MyApp.swift
//  WarmUp
//
//  Created by 이도형 on 1/14/24.
//

import SwiftUI

struct MyApp: View {
    @State var showModal: Bool = false
    var body: some View {
        TabView {
            NavigationStack{
                List{
                    NavigationLink {
                        Text("첫 번째 하위페이지입니다.")
                    } label: {
                        Text("첫 번째 하위페이지")
                    }
                    NavigationLink {
                        Text("두 번째 하위페이지입니다.")
                    } label: {
                        Text("두 번째 하위페이지")
                    }
                    NavigationLink {
                        Text("세 번째 하위페이지입니다.")
                    } label: {
                        Text("세 번째 하위페이지")
                    }
                    NavigationLink {
                        Text("네 번째 하위페이지입니다.")
                    } label: {
                        Text("네 번째 하위페이지")
                    }
                    
//                    Text("첫 번째 하위페이지")
//                    Text("두 번째 하위페이지")
//                    Text("세 번째 하위페이지")
//                    Text("네 번째 하위페이지")
                }.navigationTitle("리스트")
            }
                .tabItem {
                    Label("first", systemImage: "tray.and.arrow.down.fill")
                }
            Text("두 번째 페이지")
                .tabItem {
                    Label("second", systemImage: "tray.and.arrow.up.fill")
                }
            Text("세 번째 페이지")
                .tabItem {
                    Label("third", systemImage: "tray.and.arrow.down.fill")
                }
            Text("네 번째 페이지")
                .tabItem {
                    Label("fourth", systemImage: "tray.and.arrow.up.fill")
                }
        }
        .sheet(isPresented: $showModal, 
               content: {
            TabView{
                ZStack{
                    Color.blue.ignoresSafeArea()
                    Text("온보딩1")
                }
                ZStack{
                    Color.yellow.ignoresSafeArea()
                    Text("온보딩2")
                }
                ZStack{
                    Color.gray.ignoresSafeArea()
                    VStack{
                        Text("온보딩3")
                        Button(action: {
                            showModal = false
                        }, label: {
                            Text("Start")
                                .font(.body)
                                .foregroundColor(Color.white)
                                
                        })
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
        })
        .onAppear(perform: {
            showModal = true
        }) // OnAppear는 먼저 pop-up되며 등장(온보딩)
    }
}

#Preview {
    MyApp()
}
