//
// Created by Vitor Travain on 5/24/17.
// Copyright (c) 2017 Vitor Travain. All rights reserved.
//

import Foundation
import UIKit

final class TimedPresenter: Presenter {
    let presenter: Presenter
    let timeInterval: TimeInterval

    init(presenter: Presenter, timeInterval: TimeInterval) {
        self.presenter = presenter
        self.timeInterval = timeInterval
    }

    @discardableResult func present<T:Announcement>(announcement: T) -> DismissalToken where T: UIView {
        let internalToken = presenter.present(announcement: announcement)

        var executed: Bool = false
        let executedSemaphore = DispatchSemaphore(value: 1)

        let task = DispatchWorkItem {
            executedSemaphore.wait()

            if !executed {
                internalToken.dismiss()
                executed = true
            }

            executedSemaphore.signal()
        }

        let dismissalToken = DismissalToken {
            executedSemaphore.wait()

            if !executed {
                task.cancel()
                internalToken.dismiss()
                executed = true
            }

            executedSemaphore.signal()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + timeInterval, execute: task)

        return dismissalToken
    }
}
