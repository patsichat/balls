//
//  main.swift
//  balls
//
//  Created by Patsicha Tongteeka on 5/3/17.
//  Copyright © 2017 Nick. All rights reserved.
//

import Foundation

var balls = ["1","2","3","4","5","6","7","8"]

var input = readLine()
let numberOfOperations = Int(input!.components(separatedBy: " ")[0])!
let numberOfSets = Int(input!.components(separatedBy: " ")[1])!

var commands = [[Int]]()
for i in 1...numberOfOperations {
    var command = readLine()
    let firstBall = Int(command!.components(separatedBy: " ")[0])!
    let secondBall = Int(command!.components(separatedBy: " ")[1])!
    commands += [[firstBall,secondBall]]
}

var temp = [String]()
for setIndex in 1...numberOfSets{
    for command in commands {
        let temp = balls[command[0]-1]
        balls[command[0]-1] = balls[command[1]-1]
        balls[command[1]-1] = temp
    }
    
    if temp.contains(balls.joined(separator: " ")) {
        balls = temp[(numberOfSets % temp.count) - 1].components(separatedBy: " ")
        break
    }else{
        temp += [balls.joined(separator: " ")]
    }
    
}



print(balls.joined(separator: " "))
