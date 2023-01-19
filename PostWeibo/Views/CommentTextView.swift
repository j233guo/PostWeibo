//
//  CommentTextView.swift
//  PostWeibo
//
//  Created by Jiaming Guo on 2023-01-18.
//

import SwiftUI

struct CommentTextView: UIViewRepresentable {
    @Binding var text: String
    
    let beginEditingOnAppear: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> some UIView {
        let view = UITextView()
        view.backgroundColor = .systemGray6
        view.font = .systemFont(ofSize: 18)
        view.textContainerInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        view.delegate = context.coordinator
        view.text = text
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if beginEditingOnAppear,
           uiView.window != nil,
           !context.coordinator.didBecomeFirstResponder,
           !uiView.isFirstResponder {
            uiView.becomeFirstResponder()
        }
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        let parent: CommentTextView
        var didBecomeFirstResponder = false
        
        init(_ view: CommentTextView) {
            parent = view
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
    }
}

struct CommentTextView_Previews: PreviewProvider {
    static var previews: some View {
        CommentTextView(text: .constant(""), beginEditingOnAppear: true)
    }
}
