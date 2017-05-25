//
// Created by Vitor Travain on 5/24/17.
// Copyright (c) 2017 Vitor Travain. All rights reserved.
//

import Foundation
import UIKit

final class ViewPresenter: Presenter {
    let context: UIView

    init(context: UIView) {
        self.context = context
    }

    private var hiddenConstraint: NSLayoutConstraint?
    private var displayingConstraint: NSLayoutConstraint?

    private func installConstraints(announcement: UIView) {
        let leadingConstraint = NSLayoutConstraint(
            item: announcement,
            attribute: .leading,
            relatedBy: .equal,
            toItem: context,
            attribute: .leading,
            multiplier: 1.0,
            constant: 0.0
        )
        leadingConstraint.isActive = true

        let trailingConstraint = NSLayoutConstraint(
            item: announcement,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: context,
            attribute: .trailing,
            multiplier: 1.0,
            constant: 0.0
        )
        trailingConstraint.isActive = true

        let hiddenConstraint = NSLayoutConstraint(
            item: announcement,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: context,
            attribute: .top,
            multiplier: 1.0,
            constant: 0.0
        )
        hiddenConstraint.isActive = true

        let displayingConstraint = NSLayoutConstraint(
            item: announcement,
            attribute: .top,
            relatedBy: .equal,
            toItem: context,
            attribute: .top,
            multiplier: 1.0,
            constant: 0.0
        )
        displayingConstraint.isActive = false

        self.hiddenConstraint = hiddenConstraint
        self.displayingConstraint = displayingConstraint
    }

    @discardableResult func present<T:Announcement>(announcement: T) -> DismissalToken where T: UIView {
        announcement.translatesAutoresizingMaskIntoConstraints = false

        context.addSubview(announcement)
        installConstraints(announcement: announcement)

        context.layoutIfNeeded()

        hiddenConstraint?.isActive = false
        displayingConstraint?.isActive = true

        let dismissalToken = DismissalToken { [weak context, weak displayingConstraint, weak hiddenConstraint] in
            guard let `context` = context else { return }

            displayingConstraint?.isActive = false
            hiddenConstraint?.isActive = true

            context.setNeedsLayout()

            UIView.animate(
                withDuration: 0.3,
                delay: 0.0,
                options: .beginFromCurrentState,
                animations: {
                    context.layoutIfNeeded()
                },
                completion: { _ in
                    announcement.removeFromSuperview()
                }
            )
        }

        UIView.animate(
            withDuration: 0.3,
            delay: 0.0,
            options: .beginFromCurrentState,
            animations: {
                self.context.layoutIfNeeded()
            },
            completion: nil
        )

        return dismissalToken
    }
}
