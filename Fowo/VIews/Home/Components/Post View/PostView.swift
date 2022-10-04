//
//  PostView.swift
//  Fowo
//
//  Created by Christianto Budisaputra on 04/10/22.
//

import SDWebImageSwiftUI
import SwiftUI

struct PostView: View {
    @StateObject private var viewModel: ViewModel

    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading) {
            HeaderSection()
            ContentSection()
            Divider()
            FooterSection()
        }
        .confirmationDialog(
            "",
            isPresented: $viewModel.showActionSheet,
            titleVisibility: .hidden
        ) {
            Button("Ajak Ngobrol") { /* no-op */ }
            Button("Laporkan Konten") { /* no-op */ }
            Button("Laporkan User") { /* no-op */ }
            Button("Block User", role: .destructive) { /* no-op */ }
            Button("Batal", role: .cancel) { /* no-op */ }
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
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(4)
                }
            }

            Spacer()

            Button {
                viewModel.onMenuButtonTapped()
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
        VStack(alignment: .leading, spacing: viewModel.isTruncated ? 0 : 8) {
            Text(viewModel.post.title)
                .font(.title2.bold())
            Text(viewModel.post.description)
                .frame(maxHeight: viewModel.isTruncated ? 240 : .none)
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
            PostViewActionButton(
                icon: viewModel.isLiked ? "hand.thumbsup.fill" : "hand.thumbsup",
                title: "Like",
                action: viewModel.onLikeButtonTapped
            )
            Spacer()
            PostViewActionButton(
                icon: "bubble.left",
                title: "Komentar",
                action: viewModel.onCommentButtonTapped
            )
            Spacer()
            PostViewActionButton(
                icon: viewModel.isBookmarked ? "bookmark.fill" : "bookmark",
                title: "Bookmark",
                action: viewModel.onBookmarkButtonTapped
            )
            Spacer()
        }
        .foregroundColor(.primary)
        .padding(.vertical, 6)
    }

    private func PostViewActionButton(
        icon: String,
        title: String,
        action: @escaping () -> Void
    ) -> some View {
        Button {
            action()
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
    }
}
