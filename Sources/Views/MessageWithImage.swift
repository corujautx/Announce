//
//  MessageWithImage.swift
//  Announce
//
//  Created by Vitor Travain on 5/22/17.
//  Copyright © 2017 Vitor Travain. All rights reserved.
//

import Foundation
import UIKit

public final class MessageWithImage: UIView, Announcement {
    public let message: String
    public let title: String
    public let image: UIImage?
    public let appearance: MessageWithImageAppearance

    public init(title: String,
                message: String,
                image: UIImage? = nil,
                appearance: MessageWithImageAppearance? = nil,
                tapHandler: ((MessageWithImage) -> Void)? = nil) {
        
        self.message = message
        self.title = title
        self.image = image
        self.appearance = appearance ?? MessageWithImageAppearance.defaultAppearance()
        self.tapHandler = tapHandler

        super.init(frame: .zero)

        self.layout()
        self.bindValues()
        self.addGestureRecognizers()
    }

    public convenience init(title: String,
                            message: String,
                            image: UIImage? = nil,
                            theme: Theme,
                            tapHandler: ((MessageWithImage) -> Void)? = nil) {
        
        self.init(title: title,
                  message: message,
                  image: image,
                  appearance: theme.appearanceForMessageWithImage(),
                  tapHandler: tapHandler)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported")
    }
    
    // MARK: - Gesture Recognizers
    
    private lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        return UITapGestureRecognizer(target: self, action: #selector(handleTap))
    }()
    public var tapHandler: ((MessageWithImage) -> Void)?
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

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = self.appearance.imageContentMode
        imageView.setContentCompressionResistancePriority(UILayoutPriorityDefaultHigh, for: .horizontal)

        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = self.appearance.imageCornerRadius

        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private func layout() {
        self.backgroundColor = appearance.backgroundColor

        addSubview(titleLabel)
        addSubview(messageLabel)
        addSubview(imageView)

        setContentHuggingPriority(UILayoutPriorityDefaultHigh, for: .vertical)

        layoutImage()
        layoutTitle()
        layoutMessage()
    }

    private func layoutImage() {
        let leadingConstraint = NSLayoutConstraint(
            item: imageView,
            attribute: .leading,
            relatedBy: .equal,
            toItem: self,
            attribute: .leading,
            multiplier: 1.0,
            constant: 8.0
        )

        let topConstraint = NSLayoutConstraint(
            item: imageView,
            attribute: .top,
            relatedBy: .equal,
            toItem: self,
            attribute: .top,
            multiplier: 1.0,
            constant: 8.0
        )

        let bottomConstraint = NSLayoutConstraint(
            item: imageView,
            attribute: .bottom,
            relatedBy: .greaterThanOrEqual,
            toItem: self,
            attribute: .bottom,
            multiplier: 1.0,
            constant: -8.0
        )

        let widthConstraint = NSLayoutConstraint(
            item: imageView,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .width,
            multiplier: 1.0,
            constant: self.appearance.imageSize.width
        )

        let heightConstraint = NSLayoutConstraint(
            item: imageView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .height,
            multiplier: 1.0,
            constant: self.appearance.imageSize.height
        )

        leadingConstraint.isActive = true
        topConstraint.isActive = true
        bottomConstraint.isActive = true
        widthConstraint.isActive = true
        heightConstraint.isActive = true
    }

    private func layoutTitle() {
        let topConstraint = NSLayoutConstraint(
            item: titleLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: self,
            attribute: .top,
            multiplier: 1.0,
            constant: 8.0
        )

        let leadingConstraint = NSLayoutConstraint(
            item: titleLabel,
            attribute: .leading,
            relatedBy: .equal,
            toItem: imageView,
            attribute: .trailing,
            multiplier: 1.0,
            constant: 8.0
        )

        let trailingConstraint = NSLayoutConstraint(
            item: titleLabel,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: self,
            attribute: .trailing,
            multiplier: 1.0,
            constant: -8.0
        )

        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }

    private func layoutMessage() {
        let topConstraint = NSLayoutConstraint(
            item: messageLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: titleLabel,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 8.0
        )

        let leadingConstraint = NSLayoutConstraint(
            item: messageLabel,
            attribute: .leading,
            relatedBy: .equal,
            toItem: titleLabel,
            attribute: .leading,
            multiplier: 1.0,
            constant: 0.0
        )

        let trailingConstraint = NSLayoutConstraint(
            item: messageLabel,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: titleLabel,
            attribute: .trailing,
            multiplier: 1.0,
            constant: 0.0
        )

        let bottomConstraint = NSLayoutConstraint(
            item: messageLabel,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: self,
            attribute: .bottom,
            multiplier: 1.0,
            constant: -8.0
        )
        bottomConstraint.priority = UILayoutPriorityDefaultLow

        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        bottomConstraint.isActive = true
    }

    // MARK: - Value binding

    private func bindValues() {
        titleLabel.text = title
        messageLabel.text = message
        imageView.image = image
    }
}
