//: Playground - noun: a place where people can play

import Cocoa

protocol Component {
    func doSomething () -> String
}

struct ConcreteComponent: Component {
    func doSomething() -> String {
        return "Doing Something..."
    }
}

struct DecoratedComponent: Component {
    
    let component: ConcreteComponent
    
    func doSomething() -> String {
        return decorate() + self.component.doSomething()
    }
    
    private func decorate() -> String {
        return "Decorating -> "
    }
}

// Usage

let decoratedComponent = DecoratedComponent(component: ConcreteComponent())
decoratedComponent.doSomething()




