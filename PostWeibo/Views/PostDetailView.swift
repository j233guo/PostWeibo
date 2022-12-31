//
//  PostDetailView.swift
//  PostWeibo
//
//  Created by Jiaming Guo on 2022-12-29.
//

import SwiftUI

struct PostDetailView: View {
    let post: Post
    
    var body: some View {
        List {
            PostCell(post: post)
                .listRowInsets(EdgeInsets())
            ForEach(1...10, id: \.self) { i in
                Text("comment \(i)")
            }
        }
        .listStyle(.plain)
        .navigationTitle("Post Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(post: postList.list[0])
    }
}
