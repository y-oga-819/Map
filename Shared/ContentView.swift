//
//  ContentView.swift
//  Shared
//
//  Created by 小笠原佑樹 on 2022/07/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MapView(searchWord: "東京タワー")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
