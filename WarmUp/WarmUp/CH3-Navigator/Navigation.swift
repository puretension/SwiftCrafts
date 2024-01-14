//
//  Navigation.swift
//  WarmUp
//
//  Created by 이도형 on 1/14/24.
//

import SwiftUI

// MARK: - 02. Navigation 사용하여 화면이동 + toolBar

struct ExampleNavi: Hashable{
    var number: Int
    var description: String
}

let data:[ExampleNavi] = [
    ExampleNavi(number: 1, description: "Here's Desination1"),
    ExampleNavi(number: 2, description: "Here's Desination2")
]

struct Navigation: View {
    
    let titles = ["Navigate to Detail View1","Navigate to Detail View2"]
    let descriptions = ["Here's Desination1","Here's Desination2"]
    
    @State var isDetailView: Bool = false
    @State var isDetailView2: Bool = false
    
    var body: some View {
    // NavigationStack안에 NavigationLink 배치
        NavigationStack {
            List{
                //1. NavigaitonLink
//                NavigationLink {
//                    Text("Here's Desination1")
//                } label: {
//                    Text("Navigate to Detail View1")
//                }
//                
//                NavigationLink {
//                    Text("Here's Desination2")
//                } label: {
//                    Text("Navigate to Detail View2")
//                }
                //2. ForEach(index)
//                ForEach([0,1], id: \.self) { index in
//                    NavigationLink {
//                        Text(descriptions[index])
//                    } label: {
//                        Text(titles[index])
//                    }
//
//                }
                //3. ForEach(item) with struct
                
                ForEach(data, id: \.self) { item in
                    NavigationLink {
                        Text(item.description)
                    } label: {
                        Text("Navigate to Detail View\(item.number)")
                    }
                    
                }
            }.toolbar {
                ToolbarItem {
                    Button(action: {
                        isDetailView = true
                    }, label: {
                      Text("View1")
                    }).sheet(isPresented: $isDetailView, content: {
                        Detail(isPresented: $isDetailView)
                    })
                }
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button(action: {
//                                         isDetailView = true
//                                     }, label: {
//                                         Text("View1")
//                                     }).sheet(isPresented: $isDetailView, content: {
//                                         Detail(isPresented: $isDetailView)
//                                     })
//                }
//
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button(action: {
//                        isDetailView2 = true
//                    }, label: {
//                        Text("View2")
//                    }).sheet(isPresented: $isDetailView2, content: {
//                        Detail2(isPresented2: $isDetailView2)
//                    })
//                }
            }
//            Text("Navigate to Detail View")
//                .navigationTitle("Navigation")
        }
        
    }
}

#Preview {
    Navigation()
}
