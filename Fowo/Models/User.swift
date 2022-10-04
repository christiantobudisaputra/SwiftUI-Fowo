//
//  User.swift
//  Fowo
//
//  Created by Christianto Budisaputra on 04/10/22.
//

import Foundation

struct User {
    let company: Company
    let username: String

    func like(post: inout Post) {
        post.addLike(user: self)
    }

    func comment(post: inout Post, comment: String) {
        let comment: Comment = .init(user: self, comment: comment, timestamp: .now)
        post.addComment(comment: comment)
    }
}

#if DEBUG
extension User {
    static let mock: Self = .init(company: .mock, username: "attahalilintar")
    static let anotherMock: Self = .init(company: .anotherMock, username: "aurel")
}
#endif
