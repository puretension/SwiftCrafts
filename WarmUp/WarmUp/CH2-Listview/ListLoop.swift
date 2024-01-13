//
//  ListLoop.swift
//  WarmUp
//
//  Created by 이도형 on 1/14/24.
//

import SwiftUI

//    var fruits = ["Apple", "Banana", "Cherry", "Kiwi", "Elder berry"]
//
//    var matchFruits = ["Banana", "Apple", "Kiwi", "Elder berry", "Cherry"]
//
//    var price = ["1000", "3000", "4000", "2400", "8000"]

// ⭐️ :Hashable을 통해 hashable할 수 있음을 명시⭐️
struct Fruit: Hashable {
    let name: String
    let machFruitName: String
    let price: Int
}

// MARK: - 01 ~ 03. 리스트와 반복 + 데이터 모델링 + 리스트의 추가와 삭제
struct ListLoop: View {
    
    // data modeling, @State(Binding되어 있으므로 fruitName과 함께가며 화면도 재빌드)
    @State var favoriteFruits = [
        Fruit(name: "Apple", machFruitName: "Banana", price: 1000),
        Fruit(name: "Banana", machFruitName: "Apple", price: 2000),
        Fruit(name: "Kiwi", machFruitName: "Elder berry", price: 3000),
        Fruit(name: "Elder berry", machFruitName: "Kiwi", price: 4000),
        Fruit(name: "Cherry", machFruitName: "Cherry", price: 5000),
    ]
    
    var count = 0
    
    //⭐️ <#T##Binding<String>#>
    @State var fruitName: String = ""
    var body: some View {
        //        Text("Fruit List").
        NavigationStack{
            VStack{
                HStack {
//                    TextField(<#T##titleKey: LocalizedStringKey##LocalizedStringKey#>, text: <#T##Binding<String>#>)
                    TextField("insert fruit name", text: $fruitName)
                    Button(action: {
                        favoriteFruits.append(Fruit(name: fruitName, machFruitName: "Apple", price: 1000))
                    }, label: {
                        Text("insert")
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    })
                }.padding()
                
                List {
                    //⭐️ForEach에 익숙해지자. 아래코드는 데이터 모델링의 필요성을 보여줌
                    //                ForEach(fruits, id: \.self) { fruit in
                    //                    HStack(content: {
                    //                        Text(fruit)
                    //                        Text(price[count])
                    //                    })
                    //                    count = count + 1
                    
                    // after data modeling
                    ForEach(favoriteFruits, id: \.self) {fruit in
                        VStack(alignment: .leading){
                            Text("name: \(fruit.name)")
                            Text("matchFruitName: \(fruit.machFruitName)")
                            Text("price: \(fruit.price)")
                        }
                    }.onDelete(perform: { indexSet in
                        //List에서 삭제할때!, 현재 클릭한 cell Idx가 indexSet
                        favoriteFruits.remove(atOffsets: indexSet)
//                        favoriteFruits.remove(at: 1)
                    })
                    
                    //                Text("Apple")
                    //                Text("Banana")
                    //                Text("Cherry")
                    //                Text("Kiwi")
                    //                Text("Elder berry")
                    //                Text("Apple")
                    //                Text("Banana")
                    //                Text("Cherry")
                    //                Text("Kiwi")
                    //                Text("Elder berry")
                }.navigationTitle("Fruit List")
            }// NavigationStack.navigationTitle()
        }
    }
}

//struct ListLoop: View {
//    
//    var fruits = ["Apple", "Banana", "Cherry", "Kiwi", "Elder berry"]
//    
//    var prices = ["1000", "3000", "4000", "2400", "8000"]
//    var count = 0
//    var body: some View {
////        Text("Fruit List").
//        NavigationStack{
//            List {
//                        // fruits와 prices 배열을 결합합니다.
//                        ForEach(Array(zip(fruits, prices)), id: \.0) { fruit, price in
//                            HStack {
//                                Text(fruit)
//                                Spacer()
//                                Text("\(price)원")
//                            }
//                        }
//            }.navigationTitle("Fruit List")
//        }
//    }
//}

#Preview {
    ListLoop()
}

//State와 Binding

//데이터의 상태를 나타내는 State
//struct이기에 필요한 기능
//화면이 새로 그려져야할 때를 알려준다
//⭐️@State로 표시함(스크린 재빌드, setstate)

//State에 $를 붙이면 Binding
//State가 붙잡고 있는상태를 연결 해줄때(두 State가 연결되어있을때 = 바인딩되어 있을때)

