//
//  File.swift
//  
//
//  Created by Мурат Камалов on 6/8/22.
//

import UIKit

public extension UIView {

    // MARK: - Side cases

    enum Side {

        // MARK: - Instance Properties

        public static let allSides: [Side] = [Side.topR, Side.bottomR, Side.leftR, Side.rightR]

        public static let topR: Side = .top(0, .required)
        public static let bottomR: Side = .bottom(0, .required)
        public static let rightR: Side = .right(0, .required)
        public static let leftR: Side = .left(0, .required)
        public static let centerXR: Side = .centerX(0, .required)
        public static let centerYR: Side = .centerY(0, .required)

        public static let topH: Side = .top(0, .defaultHigh)
        public static let bottomH: Side = .bottom(0, .defaultHigh)
        public static let rightH: Side = .right(0, .defaultHigh)
        public static let leftH: Side = .left(0, .defaultHigh)
        public static let centerXH: Side = .centerX(0, .defaultHigh)
        public static let centerYH: Side = .centerY(0, .defaultHigh)

        public static let topL: Side = .top(0, .defaultLow)
        public static let bottomL: Side = .bottom(0, .defaultLow)
        public static let rightL: Side = .right(0, .defaultLow)
        public static let leftL: Side = .left(0, .defaultLow)
        public static let centerXL: Side = .centerX(0, .defaultLow)
        public static let centerYL: Side = .centerY(0, .defaultLow)

        public static let top: (CGFloat) -> Side = { value in
            return .top(value, .required)
        }

        public static let bottom: (CGFloat) -> Side = { value in
            return .bottom(value, .required)
        }

        public static let left: (CGFloat) -> Side = { value in
            return .left(value, .required)
        }

        public static let right: (CGFloat) -> Side = { value in
            return .right(value, .required)
        }

        public static let centerX: (CGFloat) -> Side = { value in
            return .centerX(value, .required)
        }

        public static let centerY: (CGFloat) -> Side = { value in
            return .centerY(value, .required)
        }

        case top(CGFloat,UILayoutPriority)
        case bottom(CGFloat,UILayoutPriority)
        case left(CGFloat,UILayoutPriority)
        case right(CGFloat,UILayoutPriority)
        case centerX(CGFloat,UILayoutPriority)
        case centerY(CGFloat,UILayoutPriority)

    }
}

