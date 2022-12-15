//
//  ZoomViewController.swift
//  SlideShowApplication
//
//  Created by 伊藤敬 on 2022/12/14.
//

import UIKit

class ZoomViewController: UIViewController {
    @IBOutlet weak var zoomImage: UIImageView!
    
    var slideName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        zoomImage.image = UIImage(named: slideName)
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
