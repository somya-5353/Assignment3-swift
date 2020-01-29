//
//  main.swift
//  Assignment3
//
//  Created by Somya on 27/01/20.
//  Copyright © 2020 Somya. All rights reserved.
//

import Foundation

var choice:Int?=0
while !(choice==9) {
    print("--------------------MENU----------------------")
    print("1. Get Immediate Parents of a node")
    print("2. Get Immediate Chidren of a node")
    print("3. Get ancestors of a node")
    print("4. Get descendants of a node")
    print("5. Delete dependency from a tree")
    print("6. Delete a node from a tree")
    print("7. Add dependency to a tree")
    print("8. Add node to a tree")
    print("9. Exit")
    print("Select your option")
    choice=Int(readLine()!)
    if choice==nil {
        print ("Wrong choice provided!!")
        exit(0)
    } else {
        switch choice {
        
        case 1:let op=Operations()
               op.getParents()
        case 2:let op=Operations()
               op.getChildren()
        case 3:let op=Operations()
               op.getAncestors()
        case 4:let op=Operations()
               op.getDescendants()
        case 5:let op=Operations()
               op.delDependency()
        case 6:let op=Operations()
               op.delNode()
        case 7:let op=Operations()
               op.addDependency()
        case 8:let op=Operations()
               op.addNode()
        case 9:exit(0)
        default:print("Invalid choice!!")
                
        }
    }
}
