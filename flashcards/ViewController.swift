//
//  ViewController.swift
//  flashcards
//
//  Created by Justin Lee on 10/29/16.
//  Copyright © 2016 Justin Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var words = [String]()
    var translations = [String]()
    var size = 0
    var number = 0

    //MARK: Properties
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let bundle = Bundle.main
        let path = bundle.path(forResource: "sample", ofType: "csv")
        let content = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        let rows = content.components(separatedBy: "\n")
        size = rows.count - 1
        for row in rows {
            let columns = row.components(separatedBy: ",")
            //label.text = String(columns.count)
            if columns.count > 1 {
                words.append(columns[0])
                translations.append(columns[1])
            }
        }
        label.text = words[number]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Actions
    @IBAction func translate(_ sender: UIButton) {
        label.text = translations[number]
    }
    @IBAction func next(_ sender: UIButton) {
        number = (number + 1) % size
        label.text = words[number]
    }
}

