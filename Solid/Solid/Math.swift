//
//  Math.swift
//  Solid
//
//  Created by Leticia Speda on 20/10/23.
//

import Foundation

struct Mais: Operation {
    func calculate(x: Int, y: Int) -> Int {
        return x + y
    }
}

struct Menos: Operation {
    func calculate(x: Int, y: Int) -> Int {
        return x - y
    }
}

protocol Operation {
    func calculate(x: Int, y: Int) -> Int
}


func math(operation: Operation, x: Int, y: Int) {
    print(operation.calculate(x: x, y: y))
}
