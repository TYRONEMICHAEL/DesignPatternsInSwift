//: Playground - noun: a place where people can play

import Cocoa

protocol Component {
    func doSomething () -> String
}

struct ConcreteComponent: Component {
    func doSomething() -> String {
        return "Doing something..."
    }
}

struct AnotherConcreteComponent: Component {
    func doSomething() -> String {
        return "Doing something else..."
    }
}

class CompositeComponent: Component {
    var children: [Component];
    
    init() {
        self.children = [Component]()
    }
    
    func addComponent(component: Component) {
        self.children.append(component)
    }
    
    func removeComponent(index: Int) {
        self.children.removeAtIndex(index)
    }
    
    func doSomething() -> String {
        var str = ""
        for component in self.children {
            str += component.doSomething()
        }
        return str
    }
    
    private func decorate() -> String {
        return "Decorating -> "
    }
}

// Usage

let compositeComponent = CompositeComponent()
compositeComponent.addComponent(ConcreteComponent())
compositeComponent.addComponent(AnotherConcreteComponent())

compositeComponent.doSomething()
