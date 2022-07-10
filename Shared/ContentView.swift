//
//  ContentView.swift
//  Shared
//
//  Created by 小笠原佑樹 on 2022/07/10.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var inputText: String = ""
    @State var dispSearchWord: String = ""
    @State var dispMapType: MKMapType = .standard

    var body: some View {
        VStack {
            TextField("キーワードを入力してください",
                      text: $inputText, onCommit: {
                      dispSearchWord = inputText
                print("入力したキーワード：" + dispSearchWord)
            })
            .padding()

            ZStack(alignment: .bottomTrailing) {
                MapView(
                    searchWord: dispSearchWord,
                    mapType: dispMapType)

                Button(action: {
                    // 標準 -> 航空写真 -> 航空写真+標準 -> 3D Flyovre
                    //   ->　3D Flyovre+標準 -> 交通機関
                    //   -> 以降ループ...
                    if dispMapType == .standard {
                        dispMapType = .satellite
                    } else if dispMapType == .satellite {
                        dispMapType = .hybrid
                    } else if dispMapType == .hybrid {
                        dispMapType = .satelliteFlyover
                    } else if dispMapType == .satelliteFlyover {
                        dispMapType = .hybridFlyover
                    } else if dispMapType == .hybridFlyover {
                        dispMapType = .mutedStandard
                    } else {
                        dispMapType = .standard
                    }
                }) {
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 35.0, height: 35.0, alignment: .leading)
                }
                .padding(.trailing, 20.0) // 右に余白を取る
                .padding(.bottom, 30.0)   // 下に余白を取る
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
