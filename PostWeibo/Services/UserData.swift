//
//  UserData.swift
//  PostWeibo
//
//  Created by Jiaming Guo on 2023-01-09.
//

import Combine

enum PostListCategory {
    case featured, hot
}

class UserData: ObservableObject {
    @Published var recommendPostList: PostList = loadPostListData("PostListData_recommend_1.json")
    @Published var hotPostList: PostList = loadPostListData("PostListData_hot_1.json")
    
    private var recommendPostDic: [Int : Int] = [:] // id and index
    private var hotPostDic: [Int: Int] = [:] // id and index
    
    init() {
        for i in 0..<recommendPostList.list.count {
            let post = recommendPostList.list[i]
            recommendPostDic[post.id] = i
        }
        for i in 0..<hotPostList.list.count {
            let post = hotPostList.list[i]
            hotPostDic[post.id] = i
        }
    }
}

extension UserData {
    func postList(for category: PostListCategory) -> PostList {
        switch category {
        case .featured:
            return recommendPostList
        case .hot:
            return hotPostList
        }
    }
    
    func post(forId id: Int) -> Post? {
        if let index = recommendPostDic[id] {
            return recommendPostList.list[index]
        }
        if let index = hotPostDic[id] {
            return hotPostList.list[index]
        }
        return nil
    }
    
    func update(_ post: Post) {
        if let index = recommendPostDic[post.id] {
            recommendPostList.list[index] = post
        }
        if let index = hotPostDic[post.id] {
            hotPostList.list[index] = post
        }
    }
}
