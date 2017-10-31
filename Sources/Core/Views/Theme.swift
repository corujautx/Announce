//
// Created by Vitor Travain on 5/24/17.
// Copyright (c) 2017 Vitor Travain. All rights reserved.
//

import Foundation
import UIKit

public enum Theme {
    case neutral
    case success
    case info
    case warning
    case danger
}

extension Theme {
    static var neutralBackgroundColor: UIColor {
        return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    static var successBackgroundColor: UIColor {
        return #colorLiteral(red: 0.1254901961, green: 0.8666666667, blue: 0.4901960784, alpha: 1.0)
    }

    static var infoBackgroundColor: UIColor {
        return #colorLiteral(red: 0.03137254902, green: 0.8117647059, blue: 0.9058823529, alpha: 1.0)
    }

    static var warningBackgroundColor: UIColor {
        return #colorLiteral(red: 0.9921568627, green: 0.7647058824, blue: 0.2352941176, alpha: 1.0)
    }

    static var dangerBackgroundColor: UIColor {
        return #colorLiteral(red: 1.0, green: 0.3450980392, blue: 0.3450980392, alpha: 1.0)
    }
}

extension Theme {
    public func appearanceForMessage() -> MessageAppearance {
        switch self {
        case .neutral:
            return MessageAppearance(
                font: .systemFont(ofSize: 12.0),
                foregroundColor: .black,
                backgroundColor: Theme.neutralBackgroundColor
            )
        case .success:
            return MessageAppearance(
                font: .systemFont(ofSize: 12.0),
                foregroundColor: .white,
                backgroundColor: Theme.successBackgroundColor
            )
        case .info:
            return MessageAppearance(
                font: .systemFont(ofSize: 12.0),
                foregroundColor: .white,
                backgroundColor: Theme.infoBackgroundColor
            )
        case .warning:
            return MessageAppearance(
                font: .systemFont(ofSize: 12.0),
                foregroundColor: .white,
                backgroundColor: Theme.warningBackgroundColor
            )
        case .danger:
            return MessageAppearance(
                font: .systemFont(ofSize: 12.0),
                foregroundColor: .white,
                backgroundColor: Theme.dangerBackgroundColor
            )
        }
    }

    public func appearanceForMessageWithTitle() -> MessageWithTitleAppearance {
        switch self {
        case .neutral:
            return MessageWithTitleAppearance(
                titleFont: .boldSystemFont(ofSize: 14.0),
                messageFont: .systemFont(ofSize: 12.0),
                foregroundColor: .black,
                backgroundColor: Theme.neutralBackgroundColor
            )
        case .success:
            return MessageWithTitleAppearance(
                titleFont: .boldSystemFont(ofSize: 14.0),
                messageFont: .systemFont(ofSize: 12.0),
                foregroundColor: .white,
                backgroundColor: Theme.successBackgroundColor
            )
        case .info:
            return MessageWithTitleAppearance(
                titleFont: .boldSystemFont(ofSize: 14.0),
                messageFont: .systemFont(ofSize: 12.0),
                foregroundColor: .white,
                backgroundColor: Theme.infoBackgroundColor
            )
        case .warning:
            return MessageWithTitleAppearance(
                titleFont: .boldSystemFont(ofSize: 14.0),
                messageFont: .systemFont(ofSize: 12.0),
                foregroundColor: .white,
                backgroundColor: Theme.warningBackgroundColor
            )
        case .danger:
            return MessageWithTitleAppearance(
                titleFont: .boldSystemFont(ofSize: 14.0),
                messageFont: .systemFont(ofSize: 12.0),
                foregroundColor: .white,
                backgroundColor: Theme.dangerBackgroundColor
            )
        }
    }

    public func appearanceForMessageWithImage() -> MessageWithImageAppearance {
        switch self {
        case .neutral:
            return MessageWithImageAppearance(
                titleFont: .boldSystemFont(ofSize: 14.0),
                messageFont: .systemFont(ofSize: 12.0),
                foregroundColor: .black,
                backgroundColor: Theme.neutralBackgroundColor
            )
        case .success:
            return MessageWithImageAppearance(
                titleFont: .boldSystemFont(ofSize: 14.0),
                messageFont: .systemFont(ofSize: 12.0),
                foregroundColor: .white,
                backgroundColor: Theme.successBackgroundColor
            )
        case .info:
            return MessageWithImageAppearance(
                titleFont: .boldSystemFont(ofSize: 14.0),
                messageFont: .systemFont(ofSize: 12.0),
                foregroundColor: .white,
                backgroundColor: Theme.infoBackgroundColor
            )
        case .warning:
            return MessageWithImageAppearance(
                titleFont: .boldSystemFont(ofSize: 14.0),
                messageFont: .systemFont(ofSize: 12.0),
                foregroundColor: .white,
                backgroundColor: Theme.warningBackgroundColor
            )
        case .danger:
            return MessageWithImageAppearance(
                titleFont: .boldSystemFont(ofSize: 14.0),
                messageFont: .systemFont(ofSize: 12.0),
                foregroundColor: .white,
                backgroundColor: Theme.dangerBackgroundColor
            )
        }
    }
    
    public func appearanceForDraggableMessageWithImage() -> DraggableMessageWithImageAppearance {
        switch self {
        case .neutral:
            return DraggableMessageWithImageAppearance(
                titleFont: .boldSystemFont(ofSize: 14.0),
                messageFont: .systemFont(ofSize: 12.0),
                foregroundColor: .black,
                backgroundColor: Theme.neutralBackgroundColor,
                dragIndicatorColor: .lightGray
            )
        case .success:
            return DraggableMessageWithImageAppearance(
                titleFont: .boldSystemFont(ofSize: 14.0),
                messageFont: .systemFont(ofSize: 12.0),
                foregroundColor: .white,
                backgroundColor: Theme.successBackgroundColor,
                dragIndicatorColor: .lightGray
            )
        case .info:
            return DraggableMessageWithImageAppearance(
                titleFont: .boldSystemFont(ofSize: 14.0),
                messageFont: .systemFont(ofSize: 12.0),
                foregroundColor: .white,
                backgroundColor: Theme.infoBackgroundColor,
                dragIndicatorColor: .lightGray
            )
        case .warning:
            return DraggableMessageWithImageAppearance(
                titleFont: .boldSystemFont(ofSize: 14.0),
                messageFont: .systemFont(ofSize: 12.0),
                foregroundColor: .white,
                backgroundColor: Theme.warningBackgroundColor,
                dragIndicatorColor: .lightGray
            )
        case .danger:
            return DraggableMessageWithImageAppearance(
                titleFont: .boldSystemFont(ofSize: 14.0),
                messageFont: .systemFont(ofSize: 12.0),
                foregroundColor: .white,
                backgroundColor: Theme.dangerBackgroundColor,
                dragIndicatorColor: .lightGray
            )
        }
    }
}
