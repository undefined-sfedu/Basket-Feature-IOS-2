//
//  TeamsViewController.swift
//  BasketFeature3.0
//
//  Created by Daniil on 07.09.2022.
//

import UIKit

class TeamsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        label.text = "Teams Screeen"
        label.frame.size = CGSize(width: 200, height: 100)
        label.center = self.view.center
        
        self.view.backgroundColor = .green
        self.view.addSubview(label)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
