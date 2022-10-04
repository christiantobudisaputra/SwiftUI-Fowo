//
//  Company.swift
//  Fowo
//
//  Created by Christianto Budisaputra on 04/10/22.
//

import Foundation

struct Company: Equatable {
    let name: String
    let logoUrl: String
}

#if DEBUG
extension Company {
    static let mock: Self = .init(
        name: "Traveloka",
        logoUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxTLJNjVIpsu9KBsZAN_bqphVaBw7nvpU3Og&usqp=CAU"
    )

    static let anotherMock: Self = .init(name: "Logo", logoUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png")
}
#endif
