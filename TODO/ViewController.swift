//
//  ViewController.swift
//  TODO
//
//  Created by kazumi hayashida on 2020/07/26.
//  Copyright © 2020 kazumi hayashida. All rights reserved.
//

import UIKit

import Amplify
import AmplifyPlugins

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    performOnAppear()
  }
  
  func performOnAppear() {
    let item = Todo(name: "Finish quarterly taxes",
                    priority: .high,
                    description: "Taxes are due for the quarter next week")
    save(item: item)
  }
  
  func save(item: Todo) {
    Amplify.DataStore.query(Todo.self, completion: { result in
      switch(result) {
      case .success(let todos):
        for todo in todos {
          print("==== Todo ====")
          print("Name: \(todo.name)")
          if let priority = todo.priority {
            print("Priority: \(priority)")
          }
          if let description = todo.description {
            print("Description: \(description)")
          }
        }
      case .failure(let error):
        print("Could not query DataStore: \(error)")
      }
    })
  }
}

