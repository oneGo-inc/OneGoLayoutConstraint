//
//  File.swift
//  
//
//  Created by Мурат Камалов on 6/8/22.
//

import UIKit

public extension UIView {

    // MARK: - Instance Methods
    
    /// Pin view to superview
    /// - Parameter sides: Side to pin
    func pinToSuperView(sides: Side...) {
        guard let view = self.superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.pin(sides: sides, toSameSidesOn: view)
    }
    
    /// Pin view to superview
    /// - Parameter sides: Defaul is all sides
    func pinToSuperView(sides: [Side] = Side.allSides) {
        guard let view = self.superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.pin(sides: sides, toSameSidesOn: view)
    }
    
    /// Pin side of some view to same side of another view
    /// - Parameters:
    ///   - side: Side to pin
    ///   - view: View to which pin
    func pin(side: Side, toSameSidesOn view: UIView) {
        self.pin(sides: [side], toSameSidesOn: view)
    }
    
    /// Pin sides of some view to same side of another view
    /// - Parameters:
    ///   - side: Side to pin
    ///   - view: View to which pin
    func pin(sides: [Side] = Side.allSides, toSameSidesOn view: UIView) {
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
    
    @discardableResult
    /// Pin side of some view to safe area side of another view
    /// - Parameters:
    ///   - side: Side to pin
    ///   - viewSide: View to which pin
    ///   - isActive: Is creating Constraint is active
    /// - Returns: Created Constraint
    func pinToSafeArea(side: Side, to viewSide: ViewSide, isActive: Bool = true) -> NSLayoutConstraint? {
        let layout: NSLayoutConstraint?
        switch (side, viewSide) {
        case (.top(let constant, let uILayoutPriority), .top(let view)):
            layout = self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: constant)
            layout?.priority = uILayoutPriority
        case (.top(let constant, let uILayoutPriority), .bottom(let view)):
            layout = self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: constant)
            layout?.priority = uILayoutPriority
        case (.bottom(let constant, let uILayoutPriority), .top(let view)):
            layout = self.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: constant)
            layout?.priority = uILayoutPriority
        case (.bottom(let constant, let uILayoutPriority), .bottom(let view)):
            layout = self.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: constant)
            layout?.priority = uILayoutPriority
        case (.left(let constant, let uILayoutPriority), .right(let view)):
            layout = self.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: constant)
            layout?.priority = uILayoutPriority
        case (.left(let constant, let uILayoutPriority), .left(let view)):
            layout = self.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: constant)
            layout?.priority = uILayoutPriority
        case (.right(let constant, let uILayoutPriority), .right(let view)):
            layout = self.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: constant)
            layout?.priority = uILayoutPriority
        case (.right(let constant, let uILayoutPriority), .left(let view)):
            layout = self.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: constant)
            layout?.priority = uILayoutPriority
        default:
            print("ERROR IN SET CONSTRAINT")
            return nil
        }
        layout?.isActive = isActive
        return layout
    }

    @discardableResult
    /// Pin side of some view to side of another view
    /// Can't pin centerY & centerX, for this use pinToSuperView
    /// - Parameters:
    ///   - side: Side to pin
    ///   - viewSide: View to which pin
    ///   - isActive: Is creating Constraint is active
    /// - Returns: Created Constraint
    func pin(side: Side,to viewSide: ViewSide, isActive: Bool = true) -> NSLayoutConstraint? {
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
            return nil
        }
        layout?.isActive = isActive
        return layout
    }

    @discardableResult
    /// Set height of width for some view
    /// - Parameters:
    ///   - demission: Height of width with constant
    ///   - isActive: Is creating Constraint is active
    /// - Returns: Created Constraint
    func setDemission(_ demission: Demission, isActive: Bool = true) -> NSLayoutConstraint {
        let constraint: NSLayoutConstraint
        switch demission {
        case .height(let constant):
            constraint = self.heightAnchor.constraint(equalToConstant: constant)
        case .width(let constant):
            constraint = self.widthAnchor.constraint(equalToConstant: constant)
        }
        constraint.isActive = isActive
        return constraint
    }
    
    /// Set eqaul value for height and width of some view
    /// - Parameters:
    ///   - constant: Constant of sides
    ///   - isActive: Is creating Constraints is active
    func setEqualSize(constant: CGFloat, isActive: Bool = true) {
        self.heightAnchor.constraint(equalToConstant: constant).isActive = isActive
        self.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = isActive
    }

    @discardableResult
    /// Set eqaul value for demission of some view
    /// - Parameters:
    ///   - demission: Height or width with constant
    ///   - view: View to which set eqaul side constant
    ///   - isActive:  Constant of sides
    /// - Returns: Is creating Constraints is active
    func equal(_ demission: Demission, to view: UIView, isActive: Bool = true) -> NSLayoutConstraint{
        let constraint: NSLayoutConstraint
        switch demission {
        case .height(let constant):
            constraint = self.heightAnchor.constraint(equalTo: view.heightAnchor, constant: constant)
        case .width(let constant):
            constraint = self.widthAnchor.constraint(equalTo: view.widthAnchor, constant: constant)
        }
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    /// Set eqaul value for demission of some view
    /// - Parameters:
    ///   - demission: Height or width with constant
    ///   - view: View to which set eqaul side constant
    ///   - isActive:  Constant of sides
    /// - Returns:  Is creating Constraints is active
    func equal(_ demission: Demission, to view: ViewDemision, isActive: Bool = true) -> NSLayoutConstraint{
        let constraint: NSLayoutConstraint
        switch (demission, view) {
        case let (.height(constant), .height(view)):
            constraint = self.heightAnchor.constraint(equalTo: view.heightAnchor, constant: constant)
        case let (.height(constant), .width(view)):
            constraint = self.heightAnchor.constraint(equalTo: view.widthAnchor, constant: constant)
        case let (.width(constant), .width(view)):
            constraint = self.widthAnchor.constraint(equalTo: view.widthAnchor, constant: constant)
        case let (.width(constant), .height(view)):
            constraint = self.widthAnchor.constraint(equalTo: view.heightAnchor, constant: constant)
        }
        constraint.isActive = isActive
        return constraint
    }
}
