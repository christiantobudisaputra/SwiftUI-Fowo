//
//  Comment.swift
//  Fowo
//
//  Created by Christianto Budisaputra on 04/10/22.
//

import Foundation

struct Comment {
    let user: User
    let comment: String
    let timestamp: Date
}

#if DEBUG
extension Comment {
    static let mock: Self = .init(
        user: .mock,
        comment: "Ashiapp",
        timestamp: .now
    )
}
#endif
