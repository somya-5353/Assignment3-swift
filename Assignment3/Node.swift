//
//  Node.swift
//  Assignment3
//
//  Created by Somya on 27/01/20.
//  Copyright © 2020 Somya. All rights reserved.
//

import Foundation

class Node:Hashable {
    var node_id = -1
    var node_name:String=""
    var parentsOfNode:Set<Node>
    var childrenOfNode:Set<Node>
    var hashValue: Int {
             return node_id.hashValue
        }
    static func ==(lhs: Node, rhs: Node) -> Bool {
         return lhs.node_id == rhs.node_id
    }
    
    //init method to initialize the members of the structure Node
    init(node_id:Int,node_name:String) {
        self.node_id=node_id
        self.node_name=node_name
        self.parentsOfNode=Set<Node>()
        self.childrenOfNode=Set<Node>()
    }
    
    //fuctions to add a parent or a child to a node
    func addParent(parent:Node) {
        if !(self.parentsOfNode.contains(parent)) {
            self.parentsOfNode.insert(parent)
        } else {
          print("The node already exists as a parent!!")
      }
   }
    
   func addChild(child:Node) {
        if !(self.childrenOfNode.contains(child)) {
            self.childrenOfNode.insert(child)
        } else {
            print("The node already exists as a child!!")
        }
    }
    
   //functions to remove a parent or a child from a node
    func removeParent(parent:Node) {
        if self.parentsOfNode.contains(parent) {
            self.parentsOfNode.remove(parent)
        } else {
            print("Dependency not present!!")
        }
    }
    
   func removeChild(child:Node) {
        if self.childrenOfNode.contains(child) {
            self.childrenOfNode.remove(child)
        } else {
            print("Dependency not present!!")
        }
    }
    
    func getParents()->Set<Node> {
        return self.parentsOfNode
    }
    
    
    func getChildren()->Set<Node> {
        return self.childrenOfNode
    }
    
    func displayNode(node:Node) {
        print("Node id -> \(node.node_id) Node name -> \(node.node_name)")
    }
}
