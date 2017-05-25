//
// Created by Vitor Travain on 5/24/17.
// Copyright (c) 2017 Vitor Travain. All rights reserved.
//

import Foundation
import UIKit

final class WindowPresenter: Presenter {
    private lazy var window: UIWindow = {
        let window = UIWindow(frame: UIScreen.main.bounds)

        window.windowLevel = UIWindowLevelStatusBar + 1

        return window
    }()

    private var hiddenConstraint: NSLayoutConstraint?
    private var displayingConstraint: NSLayoutConstraint?

    private func installConstraints(announcement: UIView) {
        let leadingConstraint = NSLayoutConstraint(
            item: announcement,
            attribute: .leading,
            relatedBy: .equal,
            toItem: window,
            attribute: .leading,
            multiplier: 1.0,
            constant: 0.0
        )
        leadingConstraint.isActive = true

        let trailingConstraint = NSLayoutConstraint(
            item: announcement,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: window,
            attribute: .trailing,
            multiplier: 1.0,
            constant: 0.0
        )
        trailingConstraint.isActive = true

        let hiddenConstraint = NSLayoutConstraint(
            item: announcement,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: window,
            attribute: .top,
            multiplier: 1.0,
            constant: 0.0
        )
        hiddenConstraint.isActive = true

        let displayingConstraint = NSLayoutConstraint(
            item: announcement,
            attribute: .top,
            relatedBy: .equal,
            toItem: window,
            attribute: .top,
            multiplier: 1.0,
            constant: 0.0
        )
        displayingConstraint.isActive = false

        self.hiddenConstraint = hiddenConstraint
        self.displayingConstraint = displayingConstraint
    }

    @discardableResult func present<T: Announcement>(announcement: T) -> DismissalToken where T: UIView {
        announcement.translatesAutoresizingMaskIntoConstraints = false
        window.isHidden = false

        window.addSubview(announcement)
        installConstraints(announcement: announcement)

        window.layoutIfNeeded()
        window.frame = CGRect(
            origin: .zero,
            size: CGSize(
                width: announcement.frame.width,
                height: announcement.frame.height
            )
        )

        hiddenConstraint?.isActive = false
        displayingConstraint?.isActive = true

        let strongWindow = self.window
        let dismissalToken = DismissalToken { [weak displayingConstraint, weak hiddenConstraint] in
            displayingConstraint?.isActive = false
            hiddenConstraint?.isActive = true

            strongWindow.setNeedsLayout()

            UIView.animate(
                withDuration: 0.3,
                delay: 0.0,
                options: .beginFromCurrentState,
                animations: {
                    strongWindow.layoutIfNeeded()
                },
                completion: { _ in
                    announcement.removeFromSuperview()
                    strongWindow.isHidden = true
                }
            )
        }

        UIView.animate(
            withDuration: 0.3,
            delay: 0.0,
            options: .beginFromCurrentState,
            animations: {
                self.window.layoutIfNeeded()
            },
            completion: nil
        )

        return dismissalToken
    }
}