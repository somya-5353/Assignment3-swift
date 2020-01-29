//
//  DAG.swift
//  Assignment3
//
//  Created by Somya on 27/01/20.
//  Copyright © 2020 Somya. All rights reserved.
//

import Foundation

class DAG {
    static private var NodeList=[Node]()
    
    static func createNode(node_id:Int,node_name:String) {
        let new_node=Node(node_id: node_id,node_name: node_name)
        NodeList.append(new_node)
    }
    
    static func getNodeList()->[Node] {
        return  NodeList
    }
    
    static func deleteNode(node_id:Int) {
        var index = -1
        var temp_node=Node(node_id:-1,node_name:"")
        var c=0
        for node in NodeList {
            if node.node_id==node_id {
               temp_node = node
               index=c
                break
            }
            c=c+1
        }
        if index == -1 {
            print("No such node exists with the given node_id!!")
        } else {
            NodeList.remove(at: index)
            for node in NodeList {
                let temp=node
                temp.parentsOfNode.remove(temp_node)
                temp.childrenOfNode.remove(temp_node)
            }
            print("Node with \(node_id) deleted!!")
        }
    }
    
    func displayParents(node:Node) {
        var parents=Set<Node>()
        print("The parents of the node are:")
        parents=node.getParents()
        for nd in parents {
            print("Node id -> \(nd.node_id) Node name -> \(nd.node_name)")
        }
    }
    
    func displayChildren(node:Node) {
        var children=Set<Node>()
        print("The children of the node are:")
        children=node.getChildren()
        for nd in children {
            print("Node id -> \(nd.node_id) Node name -> \(nd.node_name)")
        }
    }
    
    func displayAncestors(node:Node) {
        
        if (node.parentsOfNode).isEmpty {
            print("There are no more ancestors for the node!!")
        } else {
            var parents=Set<Node>()
            parents=node.getParents()
            for nd in parents {
                print("Node id -> \(nd.node_id) Node name -> \(nd.node_name)")
                displayAncestors(node:nd)
            }
        }
    }
    
  func displayDescendants(node:Node) {
      if (node.childrenOfNode).isEmpty {
          print("There are no more descendants for the node!!")
      } else {
        var children=Set<Node>()
        children=node.getChildren()
          for nd in children {
              print("Node id -> \(nd.node_id) Node name -> \(nd.node_name)")
              displayDescendants(node:nd)
          }
      }
  }
}

