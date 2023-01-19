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
    
    @State var leftPercent: CGFloat = 0
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                HScrollViewController(pageWidth: geometry.size.width, contentSize: CGSize(width: geometry.size.width * 2, height: geometry.size.height), leftPercent: self.$leftPercent
                ) {
                    HStack(spacing: 0) {
                        PostListView(category: .featured)
                            .frame(width: UIScreen.main.bounds.width)
                        PostListView(category: .hot)
                            .frame(width: UIScreen.main.bounds.width)
                    }
                }
            }
            .navigationBarItems(leading: HomeNavigationBar(leftPercent: $leftPercent))
            .navigationTitle("首页")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserData())
    }
}
