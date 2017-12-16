//
// Created by Vitor Travain on 5/24/17.
// Copyright (c) 2017 Vitor Travain. All rights reserved.
//

import Foundation
import UIKit

final class WindowPresenter: Presenter {
    
    fileprivate lazy var safeAreaTopInset: CGFloat = {
        if #available(iOSApplicationExtension 11.0, *) {
            return self.window.safeAreaInsets.top
        } else {
            return 0
        }
    }()
    
    fileprivate lazy var window: UIWindow = {
        let window = UIWindow(frame: UIScreen.main.bounds)

        window.windowLevel = UIWindowLevelStatusBar + 1

        return window
    }()
    
    private let safeAreaHole = UIView()

    private var hiddenConstraint: NSLayoutConstraint?
    private var displayingConstraint: NSLayoutConstraint?
    private var holeHeightConstraint: NSLayoutConstraint?

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
            constant: safeAreaTopInset
        )
        displayingConstraint.isActive = false

        self.hiddenConstraint = hiddenConstraint
        self.displayingConstraint = displayingConstraint
    }
    
    private func fillSafeAreaHole<T: Announcement>(announcement: T) where T: UIView {
        safeAreaHole.backgroundColor = announcement.backgroundColor
        safeAreaHole.translatesAutoresizingMaskIntoConstraints = false
        window.addSubview(safeAreaHole)
        
        let leadingConstraint = NSLayoutConstraint(
            item: safeAreaHole,
            attribute: .leading,
            relatedBy: .equal,
            toItem: window,
            attribute: .leading,
            multiplier: 1.0,
            constant: 0.0
        )
        leadingConstraint.isActive = true
        
        let trailingConstraint = NSLayoutConstraint(
            item: safeAreaHole,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: window,
            attribute: .trailing,
            multiplier: 1.0,
            constant: 0.0
        )
        trailingConstraint.isActive = true
        
        let topConstraint = NSLayoutConstraint(
            item: safeAreaHole,
            attribute: .top,
            relatedBy: .equal,
            toItem: window,
            attribute: .top,
            multiplier: 1.0,
            constant: 0
        )
        topConstraint.isActive = true
        
        let heightConstraint = NSLayoutConstraint(
            item: safeAreaHole,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: 0
        )
        heightConstraint.isActive = true

        self.holeHeightConstraint = heightConstraint
    }

    @discardableResult func present<T: Announcement>(announcement: T) -> DismissalToken where T: UIView {
        announcement.translatesAutoresizingMaskIntoConstraints = false
        window.isHidden = false

        if safeAreaTopInset > 0 {
            fillSafeAreaHole(announcement: announcement)
            safeAreaHole.bounds = CGRect(
                origin: .zero,
                size: CGSize(
                    width: announcement.frame.width,
                    height: safeAreaTopInset
                )
            )
        }
        
        window.addSubview(announcement)
        installConstraints(announcement: announcement)

        window.layoutIfNeeded()
        window.frame = CGRect(
            origin: .zero,
            size: CGSize(
                width: announcement.frame.width,
                height: announcement.frame.height + safeAreaTopInset
            )
        )

        hiddenConstraint?.isActive = false
        displayingConstraint?.isActive = true
        holeHeightConstraint?.constant = safeAreaTopInset

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

extension WindowPresenter: DraggableAnnouncementDelegate {
    func boundsDidUpdate(_ newBounds: CGRect) {
        window.bounds = newBounds
    }
}
