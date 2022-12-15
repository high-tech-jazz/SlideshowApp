//
//  ViewController.swift
//  SlideShowApplication
//
//  Created by 伊藤敬 on 2022/12/14.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slideImage: UIImageView!
    var cnt:Int = 1
    var timer: Timer!
    let sample = ["sample1.jpeg", "sample2.jpeg", "sample3.jpeg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let sampleImage = UIImage(named: "sample1")
        slideImage.image = sampleImage
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let zoomImage: ZoomViewController = segue.destination as! ZoomViewController
        if cnt == 1 {
            zoomImage.slideName = sample[0]
        } else if cnt == 2 {
            zoomImage.slideName = sample[1]
        } else if cnt == 3 {
            zoomImage.slideName = sample[2]
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }

    @IBAction func nextSlide(_ sender: Any) {
        if self.timer == nil {
            changeSlide()
        }
    }
    
    @IBAction func goBack(_ sender: Any) {
        if self.timer == nil {
            if cnt == 3 {
                slideImage.image = UIImage(named: sample[1])
            } else if cnt == 2 {
                slideImage.image = UIImage(named: sample[0])
            } else if cnt == 1 {
                slideImage.image = UIImage(named: sample[2])
                cnt = 4
            }
            cnt -= 1
        }
    }
    
    @IBAction func playPause(_ sender: UIButton) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(autoPlay(_ :)), userInfo: nil, repeats: true)
            sender.setTitle("一時停止", for: .normal)
        } else {
            self.timer.invalidate()
            self.timer = nil
            sender.setTitle("再生", for: .normal)
        }
    }
    
    @objc func autoPlay(_ timer: Timer){
        changeSlide()
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        self.timer.invalidate()
        self.timer = nil
    }
    
    func changeSlide(){
        if cnt == 1 {
            slideImage.image = UIImage(named: sample[1])
        } else if cnt == 2 {
            slideImage.image = UIImage(named: sample[2])
        } else if cnt == 3 {
            slideImage.image = UIImage(named: sample[0])
            cnt = 0
        }
        cnt += 1
    }
}

