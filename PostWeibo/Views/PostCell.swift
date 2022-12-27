//
//  PostCell.swift
//  PostWeibo
//
//  Created by Jiaming Guo on 2022-12-26.
//

import SwiftUI

struct PostCell: View {
    var body: some View {
        HStack(spacing: 5) {
            Image(uiImage: UIImage(named: "8697cf1ely8gashxj3b09j20u00u040v.jpg")!)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay {
                    VipBadge()
                        .offset(x: 16, y: 16)
                }
            
            VStack(alignment: .leading, spacing: 5.0) {
                Text("Username")
                    .font(.system(size: 16.0))
                    .foregroundColor(Color(red: 242/255, green: 99/255, blue: 4/255))
                    .lineLimit(1)
                Text("2023-01-01 00:00")
                    .font(.system(size: 11.0))
                    .foregroundColor(.gray)
                
            }
            .padding(.leading, 10)
            
            Spacer()
            
            Button {
                print("Clicked follow button")
            } label: {
                Text("Follow")
                    .font(.system(size: 14.0))
                    .foregroundColor(.orange)
                    .frame(width: 50, height: 26)
                    .overlay {
                        RoundedRectangle(cornerRadius: 13)
                            .stroke(Color.orange, lineWidth: 1)
                    }
            }
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell()
    }
}
