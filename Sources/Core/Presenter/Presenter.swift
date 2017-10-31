//
// Created by Vitor Travain on 5/23/17.
// Copyright (c) 2017 Vitor Travain. All rights reserved.
//

import Foundation
import UIKit

public enum PresentationContext {
    case window
    case view(UIView)
    case viewController(UIViewController)
}

public enum PresentationMode {
    case indefinite
    case timed(TimeInterval)
}

public final class DismissalToken {
    private let _dismiss: () -> ()
    private var executed: Bool = false

    public init(_ _dismiss: @escaping () -> ()) {
        self._dismiss = _dismiss
    }

    public func dismiss() {
        if !executed {
            executed = true
            self._dismiss()
        }
    }
}

public protocol Presenter {
    @discardableResult func present<T: Announcement>(announcement: T) -> DismissalToken where T : UIView
}

public final class PresenterFactory {
    private init() {}

    public static func presenter(withContext presentationContext: PresentationContext,
                                 andMode presentationMode: PresentationMode = .indefinite) -> Presenter {
        switch presentationMode {
        case .indefinite:
            return presenter(presentationContext: presentationContext)
        case .timed(let interval):
            return TimedPresenter(
                presenter: presenter(presentationContext: presentationContext),
                timeInterval: interval
            )
        }
    }

    internal static func presenter(presentationContext: PresentationContext) -> Presenter {
        switch presentationContext {
        case .window:
            return WindowPresenter()
        case .view(let view):
            return ViewPresenter(context: view)
        case .viewController(let vc):
            return ViewControllerPresenter(viewController: vc)
        }
    }
}
