//
//  PostViewModel.swift
//  Fowo
//
//  Created by Christianto Budisaputra on 04/10/22.
//

import Foundation

extension PostView {
    final class ViewModel: ObservableObject {
        @Published var post: Post

        init(post: Post) {
            self.post = post
        }

        // MARK: - Header Properties & Methods
        lazy var imageUrl: URL? = URL(string: post.user.company.logoUrl)

        // MARK: - Content Properties & Methods

        // MARK: - Footer Properties & Methods
        @Published var isLiked: Bool = false
        func onLikeButtonTapped() {
            isLiked.toggle()
            User.anotherMock.like(post: &post)
        }

        func onCommentButtonTapped() {

        }

        func onBookmarkButtonTapped() {

        }
    }
}
