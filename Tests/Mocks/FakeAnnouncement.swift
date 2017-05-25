//
// Created by Vitor Travain on 5/25/17.
// Copyright (c) 2017 Vitor Travain. All rights reserved.
//

import Foundation
import UIKit
import Announce

struct FakeAppearance: Appearance {
    static func defaultAppearance() -> FakeAppearance {
        return FakeAppearance()
    }
}

final class FakeAnnouncement: UIView, Announcement {
    let appearance: FakeAppearance = FakeAppearance()

    init() {
        super.init(frame: .zero)
    }

    required init(coder: NSCoder?) {
        fatalError()
    }
}