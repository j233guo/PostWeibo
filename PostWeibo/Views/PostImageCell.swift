//
//  PostImageCell.swift
//  PostWeibo
//
//  Created by Jiaming Guo on 2022-12-29.
//

import SwiftUI

// space between images
fileprivate let IMAGE_SPACE: CGFloat = 5

struct PostImageCell: View {
    let images: [String]
    var width: CGFloat
    
    var body: some View {
        Group {
            if images.count == 1 {
                loadImage(images[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: width * 0.75)
                    .clipped()
            } else if images.count == 2 {
                PostImageCellRow(images: images, width: width)
            } else if images.count == 3 {
                PostImageCellRow(images: images, width: width)
            } else if images.count == 4 {
                VStack(spacing: IMAGE_SPACE) {
                    PostImageCellRow(images: Array(images[0...1]), width: width)
                    PostImageCellRow(images: Array(images[2...3]), width: width)
                }
            } else if images.count == 5 {
                VStack(spacing: IMAGE_SPACE) {
                    PostImageCellRow(images: Array(images[0...1]), width: width)
                    PostImageCellRow(images: Array(images[2...4]), width: width)
                }
            } else if images.count == 6 {
                VStack(spacing: IMAGE_SPACE) {
                    PostImageCellRow(images: Array(images[0...2]), width: width)
                    PostImageCellRow(images: Array(images[3...5]), width: width)
                }
            }
        }
    }
}

struct PostImageCellRow: View {
    let images: [String]
    var width: CGFloat
    
    var body: some View {
        HStack(spacing: IMAGE_SPACE) {
            ForEach(images, id: \.self) { image in
                loadImage(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: (width - IMAGE_SPACE * CGFloat(images.count - 1))/CGFloat(images.count), height: (width - IMAGE_SPACE * CGFloat(images.count - 1))/CGFloat(images.count))
                    .clipped()
            }
        }
    }
}

struct PostImageCell_Previews: PreviewProvider {
    static var previews: some View {
        let images = postList.list[0].images
        let width = UIScreen.main.bounds.width - 30
        return Group {
            PostImageCell(images: Array(images[0...0]), width: width)
            PostImageCell(images: Array(images[0...1]), width: width)
            PostImageCell(images: Array(images[0...2]), width: width)
            PostImageCell(images: Array(images[0...3]), width: width)
            PostImageCell(images: Array(images[0...4]), width: width)
            PostImageCell(images: Array(images[0...5]), width: width)
        }
    }
}
