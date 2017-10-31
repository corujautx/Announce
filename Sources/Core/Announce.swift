//
//  Announce.swift
//  Announce
//
//  Created by Vitor Travain on 5/22/17.
//  Copyright © 2017 Vitor Travain. All rights reserved.
//

import Foundation
import UIKit

@discardableResult public func announce<T: Announcement>(_ announcement: T,
                                                         withCustomPresenter presenter: Presenter) -> DismissalToken where T: UIView {
    return presenter.present(announcement: announcement)
}

@discardableResult public func announce<T: Announcement>(_ announcement: T,
                                                         on context: PresentationContext,
                                                         withMode mode: PresentationMode = .indefinite) -> DismissalToken where T: UIView {

    let presenter = PresenterFactory.presenter(withContext: context, andMode: mode)

    return announce(announcement, withCustomPresenter: presenter)
}


