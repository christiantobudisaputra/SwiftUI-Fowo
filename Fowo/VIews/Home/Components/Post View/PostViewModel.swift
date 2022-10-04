//
//  PostViewModel.swift
//  Fowo
//
//  Created by Christianto Budisaputra on 04/10/22.
//

import Foundation

extension PostView {
    final class ViewModel {
        let post: Post

        init(post: Post) {
            self.post = post
        }

        // MARK: - Header Properties
        lazy var imageUrl: URL? = URL(string: post.user.company.logoUrl)

        // MARK: - Content Properties

        // MARK: - Footer Properties
    }
}
