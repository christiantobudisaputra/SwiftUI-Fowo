//
//  PostView.swift
//  Fowo
//
//  Created by Christianto Budisaputra on 04/10/22.
//

import SDWebImageSwiftUI
import SwiftUI

struct PostView: View {
    private let viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading) {
            HeaderSection()
            ContentSection()
            Divider()
            FooterSection()
        }
    }

    private func HeaderSection() -> some View {
        HStack {
            WebImage(url: viewModel.imageUrl)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 38)
                .cornerRadius(4)
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(viewModel.post.user.company.name.uppercased())
                    Text(viewModel.post.user.username)
                        .foregroundColor(.secondary)
                }

                HStack {
                    Text(viewModel.post.timestamp.formatted(date: .long, time: .omitted))
                        .foregroundColor(.secondary)
                    Text(viewModel.post.subfowo.path)
                        .font(.footnote.bold())
                        .padding(2)
                        .padding(.horizontal, 4)
                        .background(Color.blue)
                        .cornerRadius(4)
                }
            }

            Spacer()

            Button {

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

    private func ContentSection() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(viewModel.post.title)
                .font(.title2.bold())
            Text(viewModel.post.description)
                .frame(maxHeight: 240)
            HStack {
                Spacer()
                Text("\(viewModel.post.likes.count) menyukai")
                Text("\(viewModel.post.comments.count) komentar")
            }
            .foregroundColor(.secondary)
        }
    }

    private func FooterSection() -> some View {
        HStack {
            Spacer()
            PostViewActionButton(icon: "hand.thumbsup", title: "Like")
            Spacer()
            PostViewActionButton(icon: "bubble.left", title: "Komentar")
            Spacer()
            PostViewActionButton(icon: "bookmark", title: "Bookmark")
            Spacer()
        }
        .foregroundColor(.primary)
        .padding(6)
    }

    private func PostViewActionButton(icon: String, title: String) -> some View {
        Button {

        } label: {
            HStack {
                Image(systemName: icon)
                Text(title)
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel: PostView.ViewModel = .init(post: .mock)
        PostView(viewModel: viewModel)
            .padding()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
