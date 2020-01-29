//
//  Operations.swift
//  Assignment3
//
//  Created by Somya on 27/01/20.
//  Copyright © 2020 Somya. All rights reserved.
//

import Foundation

class Operations {
static var uniqueId=Set<Int>()
func getParents() {
    print("enter the node id of the node whose parent you want to find ?")
    let node_id=Int(readLine()!)
    if node_id==nil {
        print("Node id must be an integer")
    } else {
        let NodeList=DAG.getNodeList()
        var tempNode=Node(node_id:-1,node_name:"")
        for node in NodeList {
            if node.node_id==node_id {
                tempNode=node
                break
            }
        }
        if tempNode.node_id == -1 {
            print("No such node exists!!")
        } else {
            let dag=DAG()
            dag.displayParents(node: tempNode)
        }
    }
}

func getChildren() {
    print("enter the node id of the node whose children you want to find ?")
    let node_id=Int(readLine()!)
    if node_id==nil {
        print("Node id must be an integer")
    } else {
        let NodeList=DAG.getNodeList()
        var tempNode:Node?=nil
        for node in NodeList {
            if node.node_id==node_id {
                tempNode=node
                break
            }
        }
        if tempNode==nil {
            print("No such node exists!!")
        } else {
            let dag=DAG()
            dag.displayChildren(node:tempNode!)
        }
    }
}

func getAncestors() {
    print("enter the node id of the node whose ancestors you want to find?")
       let node_id=Int(readLine()!)
       if node_id==nil {
           print("Node id must be an integer")
       } else {
           let NodeList=DAG.getNodeList()
           var tempNode:Node?=nil
           for node in NodeList {
               if node.node_id==node_id {
                   tempNode=node
                   break
               }
           }
           if tempNode==nil {
               print("No such node exists!!")
           } else {
               let dag=DAG()
               dag.displayAncestors(node:tempNode!)
           }
       }
}

func getDescendants() {
    print("enter the node id of the node whose descendants you want to find?")
       let node_id=Int(readLine()!)
       if node_id==nil {
           print("Node id must be an integer")
       } else {
           let NodeList=DAG.getNodeList()
        var tempNode=Node(node_id:-1,node_name:"")
           for node in NodeList {
               if node.node_id==node_id {
                   tempNode=node
                   break
               }
           }
        if tempNode.node_id == -1 {
               print("No such node exists!!")
           } else {
               let dag=DAG()
               dag.displayDescendants(node:tempNode)
           }
       }
}

func delDependency() {
    print("Enter the node id of parent ?")
    let parent_id=Int(readLine()!)
    print("Enter the node id of child ?")
    let child_id=Int(readLine()!)
    if (parent_id==nil || child_id==nil) {
        print("Node id's must be integers!! ")
    } else {
        var parent=Node(node_id: -1,node_name: "")
        var child=Node(node_id: -1,node_name: "")
        let NodeList=DAG.getNodeList()
        for node in NodeList {
            if node.node_id==parent_id {
                parent=node
            }
            if node.node_id==child_id {
                child=node
            }
        }
        if (parent.node_id == -1 || child.node_id == -1) {
            print("Parent or child do not exist!")
        } else {
            parent.removeChild(child: child)
            child.removeParent(parent:parent)
            print("Dependency removed!!")
        }
    }
}

func delNode() {
    print("Enter the node id of node to be deleted ?")
    let input=Int(readLine()!)
    if input==nil {
        print("Node id must be an integer!")
        exit(0)
    }
    else {
    var temp_node=Node(node_id:-1,node_name:"")
    let node_id=input
    let NodeList=DAG.getNodeList()
    for node in NodeList {
        if node.node_id==node_id {
            temp_node=node
            break
        }
    }
    if temp_node.node_id == -1 {
        print("No such node exist!")
    } else {
        DAG.deleteNode(node_id:temp_node.node_id)
    }
  }
}


func addDependency() {
   print("Enter the node id of parent ?")
    let parent_id=Int(readLine()!)
    print("Enter the node id of child ?")
    let child_id=Int(readLine()!)
    if (parent_id==nil || child_id==nil) {
        print("Node id's must be integers!! ")
    } else {
        var parent=Node(node_id: -1,node_name: "")
        var child=Node(node_id: -1,node_name: "")
        let NodeList=DAG.getNodeList()
        for node in NodeList {
            if node.node_id==parent_id {
                parent=node
            }
            if node.node_id==child_id {
                child=node
            }
        }
        if (parent.node_id == -1 || child.node_id == -1) {
            print("Parent or child do not exist!")
        } else {
            parent.addChild(child:child)
            child.addParent(parent:parent)
            print("Dependency added!!")
        }
    }
}

func addNode() {
    print("Enter the node id of node to be added ?")
       let node_id=Int(readLine()!)
       if node_id==nil {
           print("Node id must be an integer!")
       }
       else if Operations.uniqueId.contains(node_id!) {
           print("Node with id \(node_id) already exists!")
       }
       else {
            print("Enter node name ?")
            let node_name=String(readLine()!)
            if (node_name==nil || node_id!<=0) {
                print("Please enter valid  inputs! ")
            } else {
                DAG.createNode(node_id: node_id!,node_name: node_name)
                print("Node successfully added!")
            }
           }
       }
}

