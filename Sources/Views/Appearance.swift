//
// Created by Vitor Travain on 5/23/17.
// Copyright (c) 2017 Vitor Travain. All rights reserved.
//

import Foundation
import UIKit

public protocol Appearance {
    static func defaultAppearance() -> Self
}

public struct MessageAppearance: Appearance {
    public let font: UIFont
    public let alignment: NSTextAlignment
    public let numberOfLines: Int
    public let lineBreakMode: NSLineBreakMode
    public let foregroundColor: UIColor
    public let backgroundColor: UIColor

    public init(font: UIFont = .systemFont(ofSize: 11.0),
                alignment: NSTextAlignment = .center,
                numberOfLines: Int = 0,
                lineBreakMode: NSLineBreakMode = .byTruncatingTail,
                foregroundColor: UIColor,
                backgroundColor: UIColor) {
        self.font = font
        self.alignment = alignment
        self.numberOfLines = numberOfLines
        self.lineBreakMode = lineBreakMode
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }

    public static func defaultAppearance() -> MessageAppearance {
        return MessageAppearance(foregroundColor: .black, backgroundColor: .gray)
    }
}

public struct MessageWithTitleAppearance: Appearance {
    public let titleFont: UIFont
    public let messageFont: UIFont

    public let foregroundColor: UIColor
    public let backgroundColor: UIColor

    public init(titleFont: UIFont = .boldSystemFont(ofSize: 12.0),
                messageFont: UIFont = .systemFont(ofSize: 11.0),
                foregroundColor: UIColor,
                backgroundColor: UIColor) {
        self.titleFont = titleFont
        self.messageFont = messageFont
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }

    public static func defaultAppearance() -> MessageWithTitleAppearance {
        return MessageWithTitleAppearance(foregroundColor: .black, backgroundColor: .gray)
    }
}

public struct MessageWithImageAppearance: Appearance {
    public let titleFont: UIFont
    public let messageFont: UIFont

    public let foregroundColor: UIColor
    public let backgroundColor: UIColor

    public let imageSize: CGSize
    public let imageCornerRadius: CGFloat
    public let imageContentMode: UIViewContentMode

    public init(titleFont: UIFont = .boldSystemFont(ofSize: 12.0),
                messageFont: UIFont = .systemFont(ofSize: 11.0),
                foregroundColor: UIColor,
                backgroundColor: UIColor,
                imageSize: CGSize = CGSize(width: 40.0, height: 40.0),
                imageCornerRadius: CGFloat = 4.0,
                imageContentMode: UIViewContentMode = .scaleAspectFill) {
        self.titleFont = titleFont
        self.messageFont = messageFont
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.imageSize = imageSize
        self.imageCornerRadius = imageCornerRadius
        self.imageContentMode = imageContentMode
    }

    public static func defaultAppearance() -> MessageWithImageAppearance {
        return MessageWithImageAppearance(foregroundColor: .black, backgroundColor: .gray)
    }
}

public struct DraggableMessageWithImageAppearance: Appearance {
    public let titleFont: UIFont
    public let messageFont: UIFont
    
    public let foregroundColor: UIColor
    public let backgroundColor: UIColor
    public let dragIndicatorColor: UIColor
    
    public let imageSize: CGSize
    public let imageCornerRadius: CGFloat
    public let imageContentMode: UIViewContentMode
    
    public let dragIndicatorSize: CGSize
    public let dragIndicatorCornerRadius: CGFloat
    
    public init(titleFont: UIFont = .boldSystemFont(ofSize: 12.0),
                messageFont: UIFont = .systemFont(ofSize: 11.0),
                foregroundColor: UIColor,
                backgroundColor: UIColor,
                dragIndicatorColor: UIColor,
                imageSize: CGSize = CGSize(width: 40.0, height: 40.0),
                imageCornerRadius: CGFloat = 4.0,
                imageContentMode: UIViewContentMode = .scaleAspectFill,
                dragIndicatorSize: CGSize = CGSize(width: 40.0, height: 6.0),
                dragIndicatorCornerRadius: CGFloat? = nil) {
        self.titleFont = titleFont
        self.messageFont = messageFont
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.dragIndicatorColor = dragIndicatorColor
        self.imageSize = imageSize
        self.imageCornerRadius = imageCornerRadius
        self.imageContentMode = imageContentMode
        self.dragIndicatorSize = dragIndicatorSize
        self.dragIndicatorCornerRadius = dragIndicatorCornerRadius ?? dragIndicatorSize.height / 2
    }
    
    public static func defaultAppearance() -> DraggableMessageWithImageAppearance {
        return DraggableMessageWithImageAppearance(foregroundColor: .black, backgroundColor: .gray, dragIndicatorColor: .lightGray)
    }
}
