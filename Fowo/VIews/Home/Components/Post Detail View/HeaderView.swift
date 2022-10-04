//
//  HeaderView.swift
//  Fowo
//
//  Created by Christianto Budisaputra on 05/10/22.
//

import SDWebImageSwiftUI
import SwiftUI

struct HeaderView: View {
    private let user: User
    private let subfowo: Subfowo?
    private let timestamp: Date
    private let menuAction: () -> Void

    init(post: Post, menuAction: @escaping () -> Void) {
        user = post.user
        subfowo = post.subfowo
        timestamp = post.timestamp
        self.menuAction = menuAction
    }

    init(comment: Comment, menuAction: @escaping () -> Void) {
        user = comment.user
        subfowo = nil
        timestamp = comment.timestamp
        self.menuAction = menuAction
    }

    var body: some View {
        HeaderSection()
    }

    private func HeaderSection() -> some View {
        HStack {
            WebImage(url: user.company.logoUrl)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 38)
                .cornerRadius(4)
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(user.company.name.uppercased())
                    Text(user.username)
                        .foregroundColor(.secondary)
                }

                HStack {
                    Text(timestamp.formatted(date: .long, time: .omitted))
                        .foregroundColor(.secondary)
                        .font(.callout)
                    if let subfowo {
                        Text(subfowo.path)
                            .font(.footnote.bold())
                            .padding(2)
                            .padding(.horizontal, 4)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(4)
                    }
                }
            }

            Spacer()

            Button {
                menuAction()
            } label: {
                Image(systemName: "circle.grid.3x3.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 16, height: 6)
                    .clipped()
            }
            .foregroundColor(.secondary)
            .font(.caption2)
        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HeaderView(comment: .mock) {
                // no-op
            }
            HeaderView(post: .mock) {
                // no-op
            }
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
