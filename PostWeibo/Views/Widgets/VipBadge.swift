//
//  VipBadge.swift
//  PostWeibo
//
//  Created by Jiaming Guo on 2022-12-26.
//

import SwiftUI

struct VipBadge: View {
    let isVip: Bool
    
    var body: some View {
        Group {
            if isVip {
                Text("V")
                    .bold()
                    .font(.system(size: 11))
                    .frame(width: 15, height: 15)
                    .foregroundColor(.yellow)
                    .background(Color.red)
                    .clipShape(Circle())
                    .overlay {
                        RoundedRectangle(cornerRadius: 7.5)
                            .stroke(Color.white, lineWidth: 1)
                    }
            }
        }
    }
}

struct VipBadge_Previews: PreviewProvider {
    static var previews: some View {
        VipBadge(isVip: true)
    }
}
