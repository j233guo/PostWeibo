//
//  CommentInputView.swift
//  PostWeibo
//
//  Created by Jiaming Guo on 2023-01-18.
//

import SwiftUI

struct CommentInputView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var userData: UserData
    @ObservedObject private var keyboardResponder: KeyboardResponder = KeyboardResponder()
    @State private var text = ""
    @State private var showEmptyTextWarning = false
    
    let post: Post
    
    var body: some View {
        VStack {
            CommentTextView(text: $text, beginEditingOnAppear: true)
            
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("取消")
                        .padding()
                }
                
                Spacer()
                
                Button {
                    if text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        withAnimation(.easeInOut) {
                            showEmptyTextWarning = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation(.easeInOut) {
                                showEmptyTextWarning = false
                            }
                        }
                        return
                    } else {
                        var post = post
                        print(text)
                        post.commentCount += 1
                        userData.update(post)
                        dismiss()
                    }
                } label: {
                    Text("发送")
                        .padding()
                }
            }
            .font(.system(size: 16))
        }
        .overlay {
            Text("评论不能为空")
                .foregroundColor(.red)
                .opacity(showEmptyTextWarning ? 1 : 0)
        }
        .padding(.bottom, KeyboardResponder().keyboardHeight)
    }
}

struct CommentInputView_Previews: PreviewProvider {
    static var previews: some View {
        let post = UserData().recommendPostList.list[0]
        return CommentInputView(post: post)
    }
}
