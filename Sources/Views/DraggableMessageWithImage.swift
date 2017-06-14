//
//  DraggableMessageWithImage.swift
//  Announce
//
//  Created by Francesco Perrotti-Garcia on 6/13/17.
//  Copyright © 2017 Announce. All rights reserved.
//

import Foundation
import UIKit

public final class DraggableMessageWithImage: UIView, Announcement {
    public let message: String
    public let title: String
    public let image: UIImage?
    public let appearance: DraggableMessageWithImageAppearance
    
    public init(title: String, message: String, image: UIImage? = nil, appearance: DraggableMessageWithImageAppearance? = nil) {
        self.message = message
        self.title = title
        self.image = image
        self.appearance = appearance ?? DraggableMessageWithImageAppearance.defaultAppearance()
        
        super.init(frame: .zero)
        
        self.layout()
        self.bindValues()
        self.addGestureRecognizers()
    }
    
    public convenience init(title: String, message: String, image: UIImage? = nil, theme: Theme) {
        self.init(title: title, message: message, image: image, appearance: theme.appearanceForDraggableMessageWithImage())
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported")
    }
    
    // MARK: - Gesture recognizer
    private lazy var tapGestureRecognizer: UITapGestureRecognizer = { [unowned self] in
        let gesture = UITapGestureRecognizer()
        gesture.addTarget(self, action: #selector(handleTap))
        
        return gesture
    }()
    
    private lazy var panGestureRecognizer: UIPanGestureRecognizer = { [unowned self] in
        let gesture = UIPanGestureRecognizer()
        gesture.addTarget(self, action: #selector(handlePan))
        
        return gesture
    }()

    private func addGestureRecognizers() {
        self.addGestureRecognizer(tapGestureRecognizer)
        self.addGestureRecognizer(panGestureRecognizer)
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
        
        label.setContentCompressionResistancePriority(UILayoutPriorityDefaultLow, for: .vertical)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = self.appearance.imageContentMode
        imageView.setContentCompressionResistancePriority(UILayoutPriorityDefaultHigh, for: .horizontal)
        
        imageView.backgroundColor = .lightGray
        
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
        addSubview(messageLabel)
        addSubview(imageView)
        addSubview(dragIndicator)
        
        setContentHuggingPriority(UILayoutPriorityDefaultHigh, for: .vertical)
        
        layoutTitle()
        layoutImage()
        layoutMessage()
        layoutDragIndicator()
        layoutHeightLimiter()
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
            toItem: messageLabel,
            attribute: .top,
            multiplier: 1.0,
            constant: -5.0
        )
        
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        bottomConstraint.isActive = true
    }
    
    private func layoutMessage() {
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
            toItem: dragIndicator,
            attribute: .top,
            multiplier: 1.0,
            constant: -8.0
        )
        
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
    
    private var heightLimiter: NSLayoutConstraint?
    
    private func layoutHeightLimiter() {
        let heightLimiter = NSLayoutConstraint(item: self,
                                               attribute: .height,
                                               relatedBy: .lessThanOrEqual,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1.0,
                                               constant: internalHeight)
        heightLimiter.isActive = true
        heightLimiter.priority = 1000
        
        self.heightLimiter = heightLimiter
    }
    
    // MARK: - Value binding
    
    private func bindValues() {
        titleLabel.text = title
        messageLabel.text = message
        imageView.image = image
    }
    
    // MARK - Gesture handling
    
    @objc private func handleTap() {
        print("tap")
    }
    
    private var panGestureActive: Bool = false
    private var internalHeight: CGFloat = 64
    private let touchOffset: CGFloat = 44
    private let translateSpeedUp: CGFloat = 1.4
    
    @objc private func handlePan() {
        let translation = panGestureRecognizer.translation(in: self).y
        print("pan: \(translation)")
        
        if panGestureRecognizer.state == .changed {
            panGestureActive = true
            
            let newHeight = max(internalHeight, internalHeight + translation)
            if newHeight > internalHeight {
                heightLimiter?.constant = newHeight
                self.transform = .identity
            } else {
                heightLimiter?.constant = internalHeight
                let amplifiedTranslation = translation * translateSpeedUp
                if amplifiedTranslation > -internalHeight {
                    self.transform = CGAffineTransform(translationX: 0, y: amplifiedTranslation)
                } else {
                    self.transform = .identity
                    //dismiss
                    print("bye bye")
                }
            }
        } else if panGestureRecognizer.state != .began {
            panGestureActive = false
            self.transform = .identity

            let velocity = panGestureRecognizer.velocity(in: self).y
            if velocity < 0 {
                if translation < -internalHeight {
                    heightLimiter?.constant = internalHeight

                    UIView.animate(withDuration: 0.1) {
                        self.layoutIfNeeded()
                    }
                }
                
                
                print("dismiss")
            } else {
                heightLimiter?.constant = 127 //TODO: Max size
                UIView.animate(withDuration: 0.2) {
                    self.layoutIfNeeded()
                }
            }
        }
    }
}
