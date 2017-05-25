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
                                                         on context: PresentationContext,
                                                         withAppearance appearance: T.AppearanceType? = nil,
                                                         withCustomPresenter presenter: Presenter) -> DismissalToken where T: UIView {
    return presenter.present(announcement: announcement)
}

@discardableResult public func announce<T: Announcement>(_ announcement: T,
                                                         on context: PresentationContext,
                                                         withAppearance appearance: T.AppearanceType? = nil,
                                                         withMode mode: PresentationMode = .indefinite) -> DismissalToken where T: UIView {

    let presenter = PresenterFactory.presenter(withContext: context, andMode: mode)

    return announce(announcement, on: context, withAppearance: appearance, withCustomPresenter: presenter)
}


