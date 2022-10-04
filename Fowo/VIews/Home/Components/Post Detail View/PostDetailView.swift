//
//  PostDetailView.swift
//  Fowo
//
//  Created by Christianto Budisaputra on 05/10/22.
//

import SwiftUI

struct PostDetailView: View {
    @ObservedObject private var viewModel: PostView.ViewModel

    init(viewModel: PostView.ViewModel) {
        _viewModel = ObservedObject(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                PostView(viewModel: viewModel, truncated: false)
                Rectangle()
                    .frame(height: 12)
                    .foregroundColor(.black.opacity(0.1))
                LazyVStack {
                    ForEach(viewModel.post.comments, id: \.timestamp) { comment in
                        CommentView(comment)
                    }
                }
                .padding()
            }
        }
    }

    private func CommentView(_ comment: Comment) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HeaderView(
                comment: comment,
                menuAction: viewModel.onMenuButtonTapped
            )
            Text(comment.comment)
            HStack(spacing: 16) {
                HStack(spacing: 4) {
                    Image(systemName: "hand.thumbsup")
                    Text("0")
                }
                HStack(spacing: 4) {
                    Image(systemName: "bubble.left")
                    Text("Balas")
                }
            }
        }
        .padding(.vertical)
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(viewModel: .init(post: .mock))
    }
}
