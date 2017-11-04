//
//  MessageWithTitle.swift
//  Announce
//
//  Created by Vitor Travain on 5/22/17.
//  Copyright © 2017 Vitor Travain. All rights reserved.
//

import Foundation
import UIKit

public final class MessageWithTitle: UIView, TappableAnnouncement {
    public let title: String
    public let message: String
    public let appearance: MessageWithTitleAppearance

    public init(title: String,
                message: String,
                appearance: MessageWithTitleAppearance? = nil,
                tapHandler: ((MessageWithTitle) -> Void)? = nil) {
        
        self.title = title
        self.message = message
        self.appearance = appearance ?? MessageWithTitleAppearance.defaultAppearance()
        self.tapHandler = tapHandler

        super.init(frame: .zero)

        self.layout()
        self.bindValues()
        self.addGestureRecognizers()
    }

    public convenience init(title: String,
                            message: String,
                            theme: Theme,
                            tapHandler: ((MessageWithTitle) -> Void)? = nil) {
        
        self.init(title: title,
                  message: message,
                  appearance: theme.appearanceForMessageWithTitle(),
                  tapHandler: tapHandler)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported")
    }
    
    // MARK: - Gesture Recognizers
    
    private lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        return UITapGestureRecognizer(target: self, action: #selector(handleTap))
    }()
    public var tapHandler: ((MessageWithTitle) -> Void)?
    @objc private func handleTap() {
        tapHandler?(self)
    }
    
    private func addGestureRecognizers() {
        addGestureRecognizer(tapGestureRecognizer)
    }

    // MARK: - Layout

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left

        label.font = self.appearance.titleFont
        label.textColor = self.appearance.foregroundColor

        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left

        label.font = self.appearance.messageFont
        label.textColor = self.appearance.foregroundColor

        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private func layout() {
        self.backgroundColor = self.appearance.backgroundColor
        addSubview(titleLabel)
        addSubview(messageLabel)

        self.layoutTitle()
        self.layoutMessage()
    }

    private func layoutTitle() {
        let titleTopConstraint = NSLayoutConstraint(
            item: titleLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: self,
            attribute: .top,
            multiplier: 1.0,
            constant: 8.0
        )

        let titleLeadingConstraint = NSLayoutConstraint(
            item: titleLabel,
            attribute: .leading,
            relatedBy: .equal,
            toItem: self,
            attribute: .leading,
            multiplier: 1.0,
            constant: 8.0
        )

        let titleTrailingConstraint = NSLayoutConstraint(
            item: titleLabel,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: self,
            attribute: .trailing,
            multiplier: 1.0,
            constant: -8.0
        )

        titleTopConstraint.isActive = true
        titleLeadingConstraint.isActive = true
        titleTrailingConstraint.isActive = true
    }

    func layoutMessage() {
        let messageTopConstraintWithTitle = NSLayoutConstraint(
            item: messageLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: titleLabel,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 8.0
        )

        let messageLeadingConstraint = NSLayoutConstraint(
            item: messageLabel,
            attribute: .leading,
            relatedBy: .equal,
            toItem: self,
            attribute: .leading,
            multiplier: 1.0,
            constant: 8.0
        )

        let messageTrailingConstraint = NSLayoutConstraint(
            item: messageLabel,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: self,
            attribute: .trailing,
            multiplier: 1.0,
            constant: -8.0
        )

        let messageBottomConstraint = NSLayoutConstraint(
            item: messageLabel,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: self,
            attribute: .bottom,
            multiplier: 1.0,
            constant: -8.0
        )

        messageTopConstraintWithTitle.isActive = true
        messageLeadingConstraint.isActive = true
        messageTrailingConstraint.isActive = true
        messageBottomConstraint.isActive = true
    }

    // MARK: - Assignment

    private func bindValues() {
        titleLabel.text = title
        messageLabel.text = message
    }
}
