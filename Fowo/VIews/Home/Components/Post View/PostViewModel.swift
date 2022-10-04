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
        @Published var showActionSheet: Bool = false
        func onMenuButtonTapped() {
            showActionSheet.toggle()
        }

        // MARK: - Content Properties & Methods

        // MARK: - Footer Properties & Methods
        @Published var isLiked: Bool = false
        func onLikeButtonTapped() {
            isLiked.toggle()
            User.anotherMock.like(post: &post)
        }

        func onCommentButtonTapped() {

        }

        @Published var isBookmarked: Bool = false
        func onBookmarkButtonTapped() {
            isBookmarked.toggle()
            // TODO: Bookmark feature
        }
    }
}
