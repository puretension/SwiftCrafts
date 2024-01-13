//
//  OnBoardingView.swift
//  WarmUp
//
//  Created by 이도형 on 1/13/24.
//

import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        // MARK: - 04. 온보딩 화면 만들어보기


        VStack(content: {
            Text("What's New in Photos")
                .font(.largeTitle)
                .bold().padding(.bottom, 80)
            VStack(content: {
                HStack(content: {
                    Image(systemName: "person.2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40,height: 40)
                        .foregroundColor(.blue)
                    
                    VStack(alignment: .leading) {
                        Text("Shared Library")
                            .font(.headline)
                            .bold()
                        Text("Combine photos and videos with the people closet to you and automatically share new photos from Camera")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .bold()
                    }
                })
                HStack(content: {
                    Image(systemName: "newspaper")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40,height: 40)
                        .foregroundColor(.blue)

                    VStack(alignment: .leading) {
                        Text("Copy & Paste Edits")
                            .font(.headline)
                            .bold()
                        Text("Save time by making edits to one photos, then applying the changes to other photos with a tap")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .bold()
                    }
                }).padding(.vertical, 30)
                HStack(content: {
                    Image(systemName: "doc.on.clipboard")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40,height: 40)
                        .foregroundColor(.blue)

                    VStack(alignment: .leading) {
                        Text("Merge Duplicates")
                            .font(.headline)
                            .bold()
                        Text("Quickly find and merge all your duplicate photos and videos from on central place in the Albums tab.")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .bold()
                    }
                })
            })
            Button("Continue"){}
                .frame(maxWidth: .infinity) //width: 330 OK
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(10).padding(.top, 180)
                .padding(.horizontal)
        })
    }
}

#Preview {
    OnBoardingView()
}
