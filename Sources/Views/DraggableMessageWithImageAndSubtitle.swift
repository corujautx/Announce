//
//  DraggableMessageWithImageAndSubtitle.swift
//  Announce
//
//  Created by Francesco Perrotti-Garcia on 6/13/17.
//  Copyright © 2017 Announce. All rights reserved.
//

import Foundation
import UIKit

public final class DraggableMessageWithImageAndSubtitle: UIView, Announcement {
    public let message: String
    public let title: String
    public let subtitle: String
    public let image: UIImage?
    public let appearance: DraggableMessageWithImageAndSubtitleAppearance
    
    public init(title: String, subtitle: String, message: String, image: UIImage? = nil, appearance: DraggableMessageWithImageAndSubtitleAppearance? = nil) {
        self.message = message
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.appearance = appearance ?? DraggableMessageWithImageAndSubtitleAppearance.defaultAppearance()
        
        super.init(frame: .zero)
        
        self.layout()
        self.bindValues()
    }
    
    public convenience init(title: String, subtitle: String, message: String, image: UIImage? = nil, theme: Theme) {
        self.init(title: title, subtitle: subtitle, message: message, image: image, appearance: theme.appearanceForDraggableMessageWithSubtitleAndImage())
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported")
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
    
    lazy var subtitleLabel: UILabel = {
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
    
    lazy var dragIndicator: UIView = {
        let dragIndicator = UIView()
        
        dragIndicator.backgroundColor = self.appearance.dragIndicatorColor
        
        dragIndicator.layer.masksToBounds = true
        dragIndicator.layer.cornerRadius = self.appearance.imageCornerRadius
        
        dragIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        return dragIndicator
    }()
    
    private func layout() {
        self.backgroundColor = appearance.backgroundColor
        
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(messageLabel)
        addSubview(imageView)
        addSubview(dragIndicator)
        
        setContentHuggingPriority(UILayoutPriorityDefaultHigh, for: .vertical)
        
        layoutTitle()
        layoutSubtitle()
        layoutImage()
        layoutMessage()
        layoutDragIndicator()
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
            relatedBy: .lessThanOrEqual,
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
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: self.appearance.imageSize.width
        )
        
        let heightConstraint = NSLayoutConstraint(
            item: imageView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
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
        
        let bottomConstraint = NSLayoutConstraint(
            item: titleLabel,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: subtitleLabel,
            attribute: .top,
            multiplier: 1.0,
            constant: -8.0
        )
        
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        bottomConstraint.isActive = true
    }
    
    private func layoutSubtitle() {
        let leadingConstraint = NSLayoutConstraint(
            item: subtitleLabel,
            attribute: .leading,
            relatedBy: .equal,
            toItem: titleLabel,
            attribute: .leading,
            multiplier: 1.0,
            constant: 0.0
        )
        
        let trailingConstraint = NSLayoutConstraint(
            item: subtitleLabel,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: titleLabel,
            attribute: .trailing,
            multiplier: 1.0,
            constant: 0.0
        )
        
        let bottomConstraint = NSLayoutConstraint(
            item: subtitleLabel,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: messageLabel,
            attribute: .top,
            multiplier: 1.0,
            constant: -8.0
        )
        
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        bottomConstraint.isActive = true
    }
    
    private func layoutMessage() {
        let leadingConstraint = NSLayoutConstraint(
            item: messageLabel,
            attribute: .leading,
            relatedBy: .equal,
            toItem: subtitleLabel,
            attribute: .leading,
            multiplier: 1.0,
            constant: 0.0
        )
        
        let trailingConstraint = NSLayoutConstraint(
            item: messageLabel,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: subtitleLabel,
            attribute: .trailing,
            multiplier: 1.0,
            constant: 0.0
        )
        
        let bottomConstraint = NSLayoutConstraint(
            item: messageLabel,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: dragIndicator,
            attribute: .top,
            multiplier: 1.0,
            constant: -8.0
        )
        bottomConstraint.priority = UILayoutPriorityDefaultLow
        
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        bottomConstraint.isActive = true
    }
    
    private func layoutDragIndicator() {
        
        let heightConstraint = NSLayoutConstraint(
            item: dragIndicator,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: self.appearance.dragIndicatorSize.height)
        
        let widthConstraint = NSLayoutConstraint(
            item: dragIndicator,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: self.appearance.dragIndicatorSize.width)
        
        let centerHorizontallyConstraint = NSLayoutConstraint(
            item: dragIndicator,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0.0
        )
        
        let bottomConstraint = NSLayoutConstraint(
            item: dragIndicator,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: self,
            attribute: .bottom,
            multiplier: 1.0,
            constant: -8.0
        )
        
        heightConstraint.isActive = true
        widthConstraint.isActive = true
        centerHorizontallyConstraint.isActive = true
        bottomConstraint.isActive = true
    }
    
    // MARK: - Value binding
    
    private func bindValues() {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        messageLabel.text = message
        imageView.image = image
    }
}
