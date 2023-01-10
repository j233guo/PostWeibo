//
//  HomeView.swift
//  PostWeibo
//
//  Created by Jiaming Guo on 2023-01-08.
//

import SwiftUI

struct HomeView: View {
    // remove default separate line and click effect
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    PostListView(category: .featured)
                        .frame(width: UIScreen.main.bounds.width)
                    PostListView(category: .hot)
                        .frame(width: UIScreen.main.bounds.width)
                }
            }
            .navigationBarItems(leading: HomeNavigationBar(leftPercent: 0))
            .navigationTitle("Title")
            .navigationBarTitleDisplayMode(.inline)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
