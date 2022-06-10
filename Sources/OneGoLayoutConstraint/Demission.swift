//
//  File.swift
//  
//
//  Created by Мурат Камалов on 6/8/22.
//

import UIKit

extension UIView {
    
    // MARK: - Demission cases

    public enum Demission {
        public static let height: Demission = .height(0)
        public static let width: Demission = .width(0)

        case height(CGFloat)
        case width(CGFloat)
    }
}
