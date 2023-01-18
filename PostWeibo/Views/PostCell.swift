//
//  PostCell.swift
//  PostWeibo
//
//  Created by Jiaming Guo on 2022-12-26.
//

import SwiftUI

struct PostCell: View {
    @EnvironmentObject var userData: UserData
    
    let post: Post
    
    var bindingPost: Post {
        userData.post(forId: post.id)!
    }
    
    var body: some View {
        var post = bindingPost
        return VStack(alignment: .leading) {
            HStack(spacing: 5) {
                loadImage(post.avatar)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay {
                        VipBadge(isVip: post.vip)
                            .offset(x: 16, y: 16)
                    }
                
                VStack(alignment: .leading, spacing: 5.0) {
                    Text(post.name)
                        .font(.system(size: 16.0))
                        .foregroundColor(Color(red: 242/255, green: 99/255, blue: 4/255))
                        .lineLimit(1)
                    Text(post.date)
                        .font(.system(size: 11.0))
                        .foregroundColor(.gray)
                }
                .padding(.leading, 10)
                
                if !post.isFollowed {
                    Spacer()
                    Button {
                        post.isFollowed = true
                        userData.update(post)
                    } label: {
                        Text("关注")
                            .font(.system(size: 14.0))
                            .foregroundColor(.orange)
                            .frame(width: 50, height: 26)
                            .overlay {
                                RoundedRectangle(cornerRadius: 13)
                                    .stroke(Color.orange, lineWidth: 1)
                            }
                    }
                    .buttonStyle(.borderless)
                }
            }
            
            Text(post.text)
                .font(.system(size: 17))
            
            if !post.images.isEmpty {
                PostImageCell(images: post.images, width: UIScreen.main.bounds.width - 30)
            }
            
            Divider()
            
            HStack(spacing: 0) {
                Spacer()
                PostCellToolbarButton(image: "ellipsis.message", text: post.commentCountText, color: .black) {
                    print("Clicked comment button")
                }
                Spacer()
                PostCellToolbarButton(image: post.isLiked ? "heart.fill" : "heart", text: post.likeCountText, color: post.isLiked ? .red : .black) {
                    if post.isLiked {
                        post.isLiked = false
                        post.likeCount -= 1
                    } else {
                        post.isLiked = true
                        post.likeCount += 1
                    }
                    userData.update(post)
                }
                Spacer()
            }
            
            Rectangle()
                .padding(.horizontal, -15)
                .frame(height: 10)
                .foregroundColor(Color(red: 238/255, green: 238/255, blue: 238/255))
        }
        .padding(.horizontal, 15)
        .padding(.top, 15)
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        PostCell(post: userData.recommendPostList.list[0])
            .environmentObject(UserData())
    }
}
