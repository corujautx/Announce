//
//  MessageSpec.swift
//  Announce
//
//  Created by Vitor Travain on 5/25/17.
//  Copyright © 2017 Vitor Travain. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import Announce

final class MessageSpec: QuickSpec {
    override func spec() {
        describe("A message") {
            let appearance = MessageAppearance.defaultAppearance()
            let message = Message(
                message: "A test message",
                appearance: appearance
            )

            it("assigns values") {
                expect(message.message).to(equal("A test message"))
            }

            it("configures its message label") {
                expect(message.messageLabel.text).to(equal("A test message"))

                expect(message.messageLabel.textColor).to(equal(appearance.foregroundColor))
                expect(message.messageLabel.font).to(equal(appearance.font))
                expect(message.messageLabel.textAlignment).to(equal(appearance.alignment))
                expect(message.messageLabel.numberOfLines).to(equal(appearance.numberOfLines))
                expect(message.messageLabel.lineBreakMode).to(equal(appearance.lineBreakMode))
            }

            it("configures its background") {
                expect(message.backgroundColor).to(equal(appearance.backgroundColor))
            }
        }
    }
}
