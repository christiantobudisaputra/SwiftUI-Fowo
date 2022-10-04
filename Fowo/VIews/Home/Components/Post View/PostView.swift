//
//  PostView.swift
//  Fowo
//
//  Created by Christianto Budisaputra on 04/10/22.
//

import SDWebImageSwiftUI
import SwiftUI

struct PostView: View {
    @ObservedObject private var viewModel: ViewModel
    private let isTruncated: Bool

    init(viewModel: ViewModel, truncated: Bool) {
        _viewModel = ObservedObject(wrappedValue: viewModel)
        self.isTruncated = truncated
    }

    var body: some View {
        VStack(alignment: .leading) {
            HeaderView(post: viewModel.post) {
                viewModel.onMenuButtonTapped()
            }
            ContentSection()
            Divider()
            FooterSection()
        }
        .padding()
        .confirmationDialog("", isPresented: $viewModel.showActionSheet) {
            Button("Ajak Ngobrol") { /* no-op */ }
            Button("Laporkan Konten") { /* no-op */ }
            Button("Laporkan User") { /* no-op */ }
            Button("Block User", role: .destructive) { /* no-op */ }
            Button("Batal", role: .cancel) { /* no-op */ }
        }
    }

    private func ContentSection() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(viewModel.post.title)
                .font(.title3.bold())
            Text(viewModel.post.description)
                .frame(maxHeight: isTruncated ? 180 : .none)
                .multilineTextAlignment(.leading)
            HStack {
                Spacer()
                Text("\(viewModel.post.likes.count) menyukai")
                Text("\(viewModel.post.comments.count) komentar")
            }
            .foregroundColor(.secondary)
        }
        .font(.subheadline)
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
        .font(.footnote.weight(.medium))
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
        PostView(viewModel: viewModel, truncated: true)
            .previewLayout(.sizeThatFits)
    }
}
