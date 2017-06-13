//
// Created by Vitor Travain on 5/24/17.
// Copyright (c) 2017 Vitor Travain. All rights reserved.
//

import Foundation
import UIKit

final class ViewControllerPresenter: Presenter {
    let viewController: UIViewController

    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    private func installConstraints(announcement: UIView) {
        let leadingConstraint = NSLayoutConstraint(
            item: announcement,
            attribute: .leading,
            relatedBy: .equal,
            toItem: viewController.view,
            attribute: .leading,
            multiplier: 1.0,
            constant: 0.0
        )
        leadingConstraint.isActive = true

        let trailingConstraint = NSLayoutConstraint(
            item: announcement,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: viewController.view,
            attribute: .trailing,
            multiplier: 1.0,
            constant: 0.0
        )
        trailingConstraint.isActive = true

        let topConstraint = NSLayoutConstraint(
            item: announcement,
            attribute: .top,
            relatedBy: .equal,
            toItem: viewController.topLayoutGuide,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 0.0
        )
        topConstraint.isActive = true
    }

    @discardableResult func present<T:Announcement>(announcement: T) -> DismissalToken where T: UIView {
        announcement.translatesAutoresizingMaskIntoConstraints = false
        announcement.clipsToBounds = true

        viewController.view.addSubview(announcement)
        installConstraints(announcement: announcement)

        viewController.view.layoutIfNeeded()

        let baseFrame = announcement.frame

        announcement.frame = CGRect(origin: baseFrame.origin, size: CGSize(width: baseFrame.width, height: 0.0))

        let dismissalToken = DismissalToken {
            UIView.animate(
                withDuration: 0.3,
                delay: 0.0,
                options: .beginFromCurrentState,
                animations: {
                    announcement.frame = CGRect(origin: baseFrame.origin, size: CGSize(width: baseFrame.width, height: 0.0))
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
                announcement.frame = baseFrame
            },
            completion: nil
        )

        return dismissalToken
    }
}