//
//  Post.swift
//  Fowo
//
//  Created by Christianto Budisaputra on 04/10/22.
//

import Foundation

struct Post {
    let user: User

    let title: String
    let description: String
    let timestamp: Date
    let subfowo: Subfowo

    var likes: [User] = []
    var comments: [Comment] = []

    mutating func addLike(user: User) {
        likes.append(user)
    }

    mutating func addComment(comment: Comment) {
        comments.append(comment)
    }
}

#if DEBUG
extension Post {
    static let mock: Self = {
        let user: User = .mock
        let anotherUser: User = .anotherMock
        var post: Post = .init(
            user: user,
            title: "Lorem Ipsum",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec elementum lorem vitae dolor vehicula pulvinar. Quisque consectetur nunc id neque malesuada, quis ullamcorper sapien tristique. Praesent venenatis dui eget erat varius, id vehicula ipsum suscipit. Curabitur scelerisque fermentum lacus, ut elementum felis tincidunt in. Aenean a molestie dolor, vitae tincidunt magna. Vestibulum feugiat leo ac dapibus pharetra. Etiam sit amet risus non mauris dignissim ornare. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Donec accumsan metus eros, ut varius mauris dignissim sit amet. Etiam et pharetra purus, nec fermentum risus. Phasellus bibendum mauris sit amet maximus placerat. Vivamus imperdiet gravida risus, ut fringilla dui aliquam quis. Vivamus nisl purus, fermentum at massa aliquam, dapibus blandit nulla.",
            timestamp: .now,
            subfowo: .mock
        )

        user.like(post: &post)
        user.comment(post: &post, comment: "ashiapp")

        anotherUser.comment(post: &post, comment: "pajak gan")

        return post
    }()
}
#endif
