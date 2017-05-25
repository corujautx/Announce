//
// Created by Vitor Travain on 5/25/17.
// Copyright (c) 2017 Vitor Travain. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import Announce

final class AppearanceSpec: QuickSpec {
    override func spec() {
        describe("The appearance of a Message") {
            it("instantiates") {
                let appearance = MessageAppearance(
                    font: .systemFont(ofSize: 12.0),
                    alignment: .left,
                    numberOfLines: 1,
                    lineBreakMode: .byClipping,
                    foregroundColor: .white,
                    backgroundColor: .black
                )

                expect(appearance.font).to(equal(UIFont.systemFont(ofSize: 12.0)))
                expect(appearance.alignment).to(equal(NSTextAlignment.left))
                expect(appearance.numberOfLines).to(equal(1))
                expect(appearance.lineBreakMode).to(equal(NSLineBreakMode.byClipping))
                expect(appearance.foregroundColor).to(equal(UIColor.white))
                expect(appearance.backgroundColor).to(equal(UIColor.black))
            }

            it("has a default appearance") {
                let appearance = MessageAppearance.defaultAppearance()

                expect(appearance.backgroundColor).to(equal(UIColor.gray))
                expect(appearance.foregroundColor).to(equal(UIColor.black))
                expect(appearance.font).to(equal(UIFont.systemFont(ofSize: 11)))
                expect(appearance.alignment).to(equal(NSTextAlignment.center))
                expect(appearance.numberOfLines).to(equal(0))
                expect(appearance.lineBreakMode).to(equal(NSLineBreakMode.byTruncatingTail))
            }
        }

        describe("The appearance of a Message with Title") {
            it("instantiates") {
                let appearance = MessageWithTitleAppearance(
                    titleFont: .boldSystemFont(ofSize: 13.0),
                    messageFont: .systemFont(ofSize: 12.0),
                    foregroundColor: .white,
                    backgroundColor: .black
                )

                expect(appearance.titleFont).to(equal(UIFont.boldSystemFont(ofSize: 13.0)))
                expect(appearance.messageFont).to(equal(UIFont.systemFont(ofSize: 12.0)))
                expect(appearance.foregroundColor).to(equal(UIColor.white))
                expect(appearance.backgroundColor).to(equal(UIColor.black))
            }

            it("has a default appearance") {
                let appearance = MessageWithTitleAppearance.defaultAppearance()

                expect(appearance.titleFont).to(equal(UIFont.boldSystemFont(ofSize: 12.0)))
                expect(appearance.messageFont).to(equal(UIFont.systemFont(ofSize: 11.0)))
                expect(appearance.foregroundColor).to(equal(UIColor.black))
                expect(appearance.backgroundColor).to(equal(UIColor.gray))
            }
        }

        describe("The appearance of a Message with Image") {
            it("instantiates") {
                let appearance = MessageWithImageAppearance(
                    titleFont: .boldSystemFont(ofSize: 13.0),
                    messageFont: .systemFont(ofSize: 12.0),
                    foregroundColor: .white,
                    backgroundColor: .black,
                    imageSize: CGSize(width: 30.0, height: 30.0),
                    imageCornerRadius: 5.0,
                    imageContentMode: .scaleAspectFit
                )

                expect(appearance.titleFont).to(equal(UIFont.boldSystemFont(ofSize: 13.0)))
                expect(appearance.messageFont).to(equal(UIFont.systemFont(ofSize: 12.0)))
                expect(appearance.foregroundColor).to(equal(UIColor.white))
                expect(appearance.backgroundColor).to(equal(UIColor.black))
                expect(appearance.imageSize).to(equal(CGSize(width: 30.0, height: 30.0)))
                expect(appearance.imageCornerRadius).to(equal(5.0))
                expect(appearance.imageContentMode).to(equal(UIViewContentMode.scaleAspectFit))
            }

            it("has a default appearance") {
                let appearance = MessageWithImageAppearance.defaultAppearance()

                expect(appearance.titleFont).to(equal(UIFont.boldSystemFont(ofSize: 12.0)))
                expect(appearance.messageFont).to(equal(UIFont.systemFont(ofSize: 11.0)))
                expect(appearance.foregroundColor).to(equal(UIColor.black))
                expect(appearance.backgroundColor).to(equal(UIColor.gray))
                expect(appearance.imageSize).to(equal(CGSize(width: 40.0, height: 40.0)))
                expect(appearance.imageCornerRadius).to(equal(4.0))
                expect(appearance.imageContentMode).to(equal(UIViewContentMode.scaleAspectFill))
            }
        }
    }
}
