//
//  ViewController.swift
//  FizzBuzz
//
//  Created by Home on 28/10/17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    
    var numberArray : NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.FizzBuzz()
    }

    func FizzBuzz() {
        var result = ""
        for var i in 1..<101 {
            if i%15 == 0 {
                result = "\(i)-FizzBuzz"
            } else if (i%3==0) {
                result = "\(i)-Fizz"
            } else if (i%5==0) {
                result = "\(i)-Buzz"
            } else {
                result = "\(i)"
            }
            
            self.numberArray.add(result)
        }
        
        DispatchQueue.main.async {
            self.mainTableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numberArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.mainTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.numberArray.object(at: indexPath.row) as? String
        return cell
    }
    
}
