//
//  PostListView.swift
//  PostWeibo
//
//  Created by Jiaming Guo on 2022-12-28.
//

import SwiftUI

struct PostListView: View {
    @EnvironmentObject var userData: UserData
    
    let category: PostListCategory
    
    var body: some View {
        List {
            ForEach(userData.postList(for: category).list) { post in
                ZStack {
                    PostCell(post: post)
                    NavigationLink(destination: PostDetailView(post: post)) {
                        EmptyView()
                    }
                }
                .listRowInsets(EdgeInsets())
            }
        }
        .listStyle(.plain)
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostListView(category: .featured)
                .navigationBarTitle("title")
                .navigationBarHidden(true)
        }
        .environmentObject(UserData())
    }
}
