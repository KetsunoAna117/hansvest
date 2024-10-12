//
//  DependencyInjector.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import Foundation

struct DependencyInjector {
    private static var dependencyList: [String: Any] = [:]
    
    static func resolve<T>() -> T {
        guard let t = dependencyList[String(describing: T.self)] as? T else {
            fatalError("No provider registered for type \(T.self)")
        }
        return t
    }
    
    static func register<T>(dependency: T) {
        dependencyList[String(describing: T.self)] = dependency
    }

    // New method to unregister a dependency
    static func unregister<T>(type: T.Type) {
        dependencyList.removeValue(forKey: String(describing: type))
    }
}

@propertyWrapper struct Inject<T> {
    var wrappedValue: T
    
    init() {
        self.wrappedValue = DependencyInjector.resolve()
    }
}

@propertyWrapper struct Provider<T> {
    var wrappedValue: T
    
    init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        DependencyInjector.register(dependency: wrappedValue)
    }
}
