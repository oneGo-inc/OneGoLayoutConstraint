//
//  File.swift
//  
//
//  Created by Мурат Камалов on 6/8/22.
//

import UIKit

public extension UIView {

    // MARK: - Instance Methods
    
    func pinToSuperView(sides: [Side] = Side.allSides) {
        guard let view = self.superview else { return }
        self.pin(sides: sides, toSameSidesOn: view)
    }

    func pin(side: Side, toSameSidesOn view: UIView) {
        self.pin(sides: [side], toSameSidesOn: view)
    }

    func pin(sides: [Side] = Side.allSides, toSameSidesOn view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        for side in sides {
            let layout: NSLayoutConstraint
            switch side {
            case .top(let cGFloat, let uILayoutPriority):
                layout = self.topAnchor.constraint(equalTo: view.topAnchor, constant: cGFloat)
                layout.priority = uILayoutPriority
            case .bottom(let cGFloat, let uILayoutPriority):
                layout = self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: cGFloat)
                layout.priority = uILayoutPriority
            case .left(let cGFloat, let uILayoutPriority):
                layout = self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: cGFloat)
                layout.priority = uILayoutPriority
            case .right(let cGFloat, let uILayoutPriority):
                layout = self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: cGFloat)
                layout.priority = uILayoutPriority
            case .centerX(let cGFloat, let uILayoutPriority):
                layout = self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: cGFloat)
                layout.priority = uILayoutPriority
            case .centerY(let cGFloat, let uILayoutPriority):
                layout = self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: cGFloat)
                layout.priority = uILayoutPriority
            }
            layout.isActive = true
        }
    }

    func pin(side: Side,to viewSide: ViewSide) {
        let layout: NSLayoutConstraint?
        switch (side, viewSide) {
        case (.top(let constant, let uILayoutPriority), .top(let view)):
            layout = self.topAnchor.constraint(equalTo: view.topAnchor, constant: constant)
            layout?.priority = uILayoutPriority
        case (.top(let constant, let uILayoutPriority), .bottom(let view)):
            layout = self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: constant)
            layout?.priority = uILayoutPriority
        case (.bottom(let constant, let uILayoutPriority), .top(let view)):
            layout = self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: constant)
            layout?.priority = uILayoutPriority
        case (.bottom(let constant, let uILayoutPriority), .bottom(let view)):
            layout = self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: constant)
            layout?.priority = uILayoutPriority
        case (.left(let constant, let uILayoutPriority), .right(let view)):
            layout = self.leftAnchor.constraint(equalTo: view.rightAnchor, constant: constant)
            layout?.priority = uILayoutPriority
        case (.left(let constant, let uILayoutPriority), .left(let view)):
            layout = self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: constant)
            layout?.priority = uILayoutPriority
        case (.right(let constant, let uILayoutPriority), .right(let view)):
            layout = self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: constant)
            layout?.priority = uILayoutPriority
        case (.right(let constant, let uILayoutPriority), .left(let view)):
            layout = self.rightAnchor.constraint(equalTo: view.leftAnchor, constant: constant)
            layout?.priority = uILayoutPriority
        default:
            print("ERROR IN SET CONSTRAINT")
            return
        }
        layout?.isActive = true
    }

    @discardableResult
    func setDemission(_ demission: Demission) -> NSLayoutConstraint {
        let constraint: NSLayoutConstraint
        switch demission {
        case .height(let constant):
            constraint = self.heightAnchor.constraint(equalToConstant: constant)
        case .width(let constant):
            constraint = self.widthAnchor.constraint(equalToConstant: constant)
        }
        constraint.isActive = true
        return constraint
    }

    func setEqualSize(constant: CGFloat) {
        self.heightAnchor.constraint(equalToConstant: constant).isActive = true
        self.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }

    func equal(_ demission: Demission, to view: UIView) {
        switch demission {
        case .height(let constant):
            self.heightAnchor.constraint(equalTo: view.heightAnchor, constant: constant).isActive = true
        case .width(let constant):
            self.widthAnchor.constraint(equalTo: view.widthAnchor, constant: constant).isActive = true
        }
    }
}
