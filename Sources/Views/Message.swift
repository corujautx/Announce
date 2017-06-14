//
//  Message.swift
//  Announce
//
//  Created by Vitor Travain on 5/22/17.
//  Copyright © 2017 Vitor Travain. All rights reserved.
//

import Foundation
import UIKit

public final class Message: UIView, Announcement {
    public let message: String
    public let appearance: MessageAppearance

    public init(message: String,
                appearance: MessageAppearance? = nil,
                tapHandler: ((Message) -> Void)? = nil) {
        
        self.message = message
        self.appearance = appearance ?? MessageAppearance.defaultAppearance()
        self.tapHandler = tapHandler
        
        super.init(frame: .zero)

        self.layout()
        self.bindValues()
        self.addGestureRecognizers()
    }

    public convenience init(message: String,
                            theme: Theme,
                            tapHandler: ((Message) -> Void)? = nil) {
        
        self.init(message: message,
                  appearance: theme.appearanceForMessage(),
                  tapHandler: tapHandler)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported")
    }
    
    // MARK: - Gesture Recognizers
    
    private lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        return UITapGestureRecognizer(target: self, action: #selector(handleTap))
    }()
    public var tapHandler: ((Message) -> Void)?
    @objc private func handleTap() {
        tapHandler?(self)
    }
    
    private func addGestureRecognizers() {
        addGestureRecognizer(tapGestureRecognizer)
    }

    // MARK: - Layout

    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.font = self.appearance.font
        label.textAlignment = self.appearance.alignment
        label.numberOfLines = self.appearance.numberOfLines
        label.lineBreakMode = self.appearance.lineBreakMode
        label.textColor = self.appearance.foregroundColor
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private func layout() {
        self.backgroundColor = appearance.backgroundColor
        addSubview(messageLabel)

        let labelLeadingConstraint = NSLayoutConstraint(
            item: messageLabel,
            attribute: .leading,
            relatedBy: .equal,
            toItem: self,
            attribute: .leading,
            multiplier: 1.0,
            constant: 8.0
        )

        let labelTrailingConstraint = NSLayoutConstraint(
            item: messageLabel,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: self,
            attribute: .trailing,
            multiplier: 1.0,
            constant: -8.0
        )

        let labelTopConstraint = NSLayoutConstraint(
            item: messageLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: self,
            attribute: .top,
            multiplier: 1.0,
            constant: 8.0
        )

        let labelBottomConstraint = NSLayoutConstraint(
            item: messageLabel,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: self,
            attribute: .bottom,
            multiplier: 1.0,
            constant: -8.0
        )

        labelLeadingConstraint.isActive = true
        labelTrailingConstraint.isActive = true
        labelTopConstraint.isActive = true
        labelBottomConstraint.isActive = true
    }

    // MARK: - Assignment

    private func bindValues() {
        messageLabel.text = message
    }
}
