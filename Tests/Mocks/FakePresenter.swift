//
// Created by Vitor Travain on 5/25/17.
// Copyright (c) 2017 Vitor Travain. All rights reserved.
//

import Foundation
import UIKit
import Announce

final class FakePresenter: Presenter {
    var presentedAnnouncement: UIView?
    var dismissed: Bool = false

    func present<T:Announcement>(announcement: T) -> DismissalToken where T: UIView {
        presentedAnnouncement = announcement

        return DismissalToken { [weak self] in
            self?.dismissed = true
        }
    }
}