//
//  ContentView.swift
//  PostWeibo
//
//  Created by Jiaming Guo on 2022-12-26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
            .environmentObject(UserData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
