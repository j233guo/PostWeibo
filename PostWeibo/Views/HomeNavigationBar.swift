//
//  HomeNavigationBar.swift
//  PostWeibo
//
//  Created by Jiaming Guo on 2022-12-30.
//

import SwiftUI

fileprivate let LABEL_WIDTH: CGFloat = 80
fileprivate let BUTTON_HEIGHT: CGFloat = 24

struct HomeNavigationBar: View {
    @State var leftPercent: CGFloat
    
    var body: some View {
        HStack(alignment: .top) {
            Button(action: {
                print("Click camera button")
            }) {
                Image(systemName: "camera")
                    .resizable()
                    .scaledToFit()
                    .frame(width: BUTTON_HEIGHT, height: BUTTON_HEIGHT)
                    .padding(.horizontal, 15)
                    .padding(.top, 5)
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            VStack(spacing: 3) {
                HStack(spacing: 0) {
                    Text("For You")
                        .font(.body)
                        .bold()
                        .frame(width: LABEL_WIDTH, height: BUTTON_HEIGHT)
                        .padding(.top, 5)
                        .opacity(Double(1 - leftPercent * 0.5))
                        .onTapGesture {
                            withAnimation {
                                self.leftPercent = 0
                            }
                    }
                    
                    Spacer()
                    Text("Hot Posts")
                        .font(.body)
                        .bold()
                        .frame(width: LABEL_WIDTH)
                        .padding(.top, 5)
                        .opacity(Double(0.5 + leftPercent * 0.5))
                        .onTapGesture {
                            withAnimation {
                                leftPercent = 1
                            }
                    }
                }
                .font(.system(size: 20))
                
                RoundedRectangle(cornerRadius: 2)
                    .foregroundColor(.orange)
                    .frame(width: 30, height: 4)
                    .offset(x: UIScreen.main.bounds.width * 0.5 * (leftPercent - 0.5) + LABEL_WIDTH * (0.5 - leftPercent))
                    .frame(height: 6)
            }
            .frame(width: UIScreen.main.bounds.width * 0.5)
            
            Spacer()
            
            Button {
                print("Pressed plus button")
            } label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: BUTTON_HEIGHT, height: BUTTON_HEIGHT)
                    .padding(.horizontal, 15)
                    .padding(.top, 5)
                    .foregroundColor(.orange)
            }
        }
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct HomeNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavigationBar(leftPercent: 0)
    }
}
