//
// Created by Vitor Travain on 5/24/17.
// Copyright (c) 2017 Vitor Travain. All rights reserved.
//

import Foundation

public protocol Announcement {
    associatedtype AppearanceType: Appearance

    var appearance: AppearanceType { get }
}
