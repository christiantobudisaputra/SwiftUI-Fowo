//
//  Subfowo.swift
//  Fowo
//
//  Created by Christianto Budisaputra on 04/10/22.
//

import Foundation

struct Subfowo {
    private let name: String

    var path: String {
        "f/\(name)"
    }

    init(name: String) {
        self.name = name
    }
}

#if DEBUG
extension Subfowo {
    static let mock: Self = .init(name: "Publik")
}
#endif
