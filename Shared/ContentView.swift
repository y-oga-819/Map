//
//  ContentView.swift
//  Shared
//
//  Created by 小笠原佑樹 on 2022/07/10.
//

import SwiftUI

struct ContentView: View {
    @State var inputText: String = ""
    @State var dispSearchWord: String = ""

    var body: some View {
        VStack {
            TextField("キーワードを入力してください",
                      text: $inputText, onCommit: {
                      dispSearchWord = inputText
                print("入力したキーワード：" + dispSearchWord)
            })
            .padding()
            MapView(searchWord: dispSearchWord)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
