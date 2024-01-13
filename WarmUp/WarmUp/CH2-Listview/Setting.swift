//
//  Setting.swift
//  WarmUp
//
//  Created by 이도형 on 1/14/24.
//

// MARK: - 04. 설정 스크린 만들어보기

import SwiftUI

struct SettingInfo: Hashable {
    let title: String
    let systemName: String
    let backgroundColor: Color
    let forgroundColor: Color = .white
}

struct Setting: View {
    
    let data: [[SettingInfo]] = [
        //Section안에 Label은 2개이상있을 수 있으므로
        [SettingInfo(title: "스크린타임", systemName: "hourglass", backgroundColor: .purple), SettingInfo(title: "동작버튼", systemName: "hand.point.up.left", backgroundColor: .blue)],
        [SettingInfo(title: "일반", systemName: "gear", backgroundColor: .gray), SettingInfo(title: "손쉬운 사용", systemName: "figure.child.circle", backgroundColor: .blue), SettingInfo(title: "개인정보 보호 및 보안", systemName: "hand.raised.fill", backgroundColor: .blue)],
        [SettingInfo(title: "암호", systemName: "key.fill", backgroundColor: .gray)]
    ]
    
    //⭐️Label(title: icon: )을 활용하면 Image + Text
    //⭐️Section을 활용하자
    
    @State var searchText: String = ""
    
    var body: some View {
        //        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        NavigationStack{
            HStack {
                     Image(systemName: "magnifyingglass") // 서치 아이콘
                         .foregroundColor(.gray)
                     TextField("검색", text: $searchText)
                         .foregroundColor(.gray)
                 }
                 .padding(10) // 내부 여백
                 .background(Color.gray.opacity(0.2)) // 배경색
                 .cornerRadius(10) // 모서리 둥글게
            List{
                ForEach(data, id: \.self) { section in
                    Section {
                        ForEach(section, id: \.self) { item in
                            Label(
                                title: { Text(item.title) },
                                icon: { Image(systemName: item.systemName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 14)
                                        .padding(.all,7)
                                        .background(item.backgroundColor)
                                        .foregroundColor(item.forgroundColor)
                                    .cornerRadius(6)}
                            )
                        }
                    }
                }
                
                
                
                //                Section{
                //                    Label(
                //                        title: { Text("스크린타임") },
                //                        icon: { Image(systemName: "hourglass")
                //                                .resizable()
                //                                .scaledToFit()
                //                                .frame(width: 14)
                //                                .padding(.all,3)
                //                                .background(.purple)
                //                                .foregroundColor(.white)
                //                        }
                //                    )
                //                    Label(
                //                        title: { Text("동작버튼") },
                //                        icon: { Image(systemName: "hand.point.up.left")
                //                                .background(.blue)
                //                                .foregroundColor(.white)
                //                        }
                //                    )
                //                }
                //
                //                Section{
                //                    Label(
                //                        title: { Text("일반") },
                //                        icon: { Image(systemName: "gear")
                //                                .resizable()
                //                                .scaledToFit()
                //                                .frame(width: 20)
                //                                .padding(.all, 5)
                //                                .background(.gray)
                //                                .foregroundColor(.white)
                //                                .cornerRadius(5)
                //                        }
                //                    )
                //
                //                    Label(
                //                        title: { Text("손쉬운 사용") },
                //                        icon: { Image(systemName: "figure.child.circle")
                //                                .resizable()
                //                                .scaledToFit()
                //                                .frame(width: 20,height: 20)
                //                                .padding(.all, 3)
                //                                .background(.blue)
                //                                .foregroundColor(.white)
                //                                .cornerRadius(5)
                //                        }
                //                    )
                //
                //                    Label(
                //                        title: { Text("개인정보 보호 및 보안") },
                //                        icon: { Image(systemName: "hand.raised.fill")
                //                                .resizable()
                //                                .scaledToFit()
                //                                .frame(width: 20,height: 20)
                //                                .padding(.all, 3)
                //                                .background(.blue)
                //                                .foregroundColor(.white)
                //                                .cornerRadius(5)
                //                        }
                //                    )
                //                }
                //
                //                Section{
                //                    Label(
                //                        title: { Text("암호") },
                //                        icon: { Image(systemName: "key.fill")
                //                                .resizable()
                //                                .scaledToFit()
                //                                .frame(width: 20,height: 20)
                //                                .padding(.all, 3)
                //                                .background(.gray)
                //                                .foregroundColor(.white)
                //                                .cornerRadius(5)}
                //                    )
                //                }
                
            }
            .navigationTitle("설정")
        }
        
    }
}

#Preview {
    Setting()
}
