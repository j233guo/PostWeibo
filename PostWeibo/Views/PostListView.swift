//
//  PostListView.swift
//  PostWeibo
//
//  Created by Jiaming Guo on 2022-12-28.
//

import SwiftUI

struct PostListView: View {
    // remove default separate line and click effect
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        List(postList.list) { post in
            PostCell(post: post)
                .listRowInsets(EdgeInsets())
        }
        .listStyle(.plain)
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
