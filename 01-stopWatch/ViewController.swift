//
//  ViewController.swift
//  01-stopWatch
//
//  Created by 张延 on 2017/8/24.
//  Copyright © 2017年 com.CocoaLemon.www. All rights reserved.
//


// http://blog.csdn.net/reylen/article/details/49907949 注释
// 宏定义  http://blog.csdn.net/timtian008/article/details/53784953，http://www.cnblogs.com/JianweiWang/p/5142306.html
import UIKit

class ViewController: UIViewController {

    var resetBtn:UIButton?
    var numLab:UILabel?
    var startBtn:UIButton?
    var stopBtn:UIButton?
    var timer:Timer?
    var count:Double = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    // MARK:***开始***
    func startBtnAction(){
        
        startBtn!.alpha = 0.7
        stopBtn!.alpha = 1.0;
        stopBtn!.isEnabled = true
        startBtn!.isEnabled = false

        if (timer != nil) {
            
            timer?.fireDate = NSDate.init() as Date

        }else{
            
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        }
        print("开始")
        
    }
    // MARK:***暂停***
    func stopBtnAction() {

        timer?.fireDate = Date.distantFuture
        stopBtn?.isEnabled = false
        stopBtn?.alpha = 0.7;
        startBtn?.alpha = 1.0
        startBtn?.isEnabled = true
        print("暂停")

    }
    // MARK:***重置***
    func resetBtnAction() {
        
        if count == 0 {
            
            
        }else{
            
            timer?.invalidate()
            timer = nil
            numLab?.text = "0.0"
            startBtn?.alpha = 1.0
            stopBtn?.alpha = 1.0
            startBtn?.isEnabled = true
            stopBtn?.isEnabled = true
            count = 0
 
        }
        
    }
    // MARK:***计时器***
    func timerAction() {
        
        count = count + 0.1
        numLab?.text = String(format: "%.1f", count)

    }

    // MARK:***界面***
    func setView() {
        view.backgroundColor = UIColor.black
        
        let topView = UIView.init()
        topView.backgroundColor = UIColor.black
        topView.frame = CGRect.init(x: 0, y: 0, width: KWidth, height: KHeight * 0.4)
        view.addSubview(topView)
        
        // 重置按钮
        resetBtn = UIButton.init(type: UIButtonType.custom)
        resetBtn!.frame = CGRect.init(x: KWidth - 80, y: 30, width: 50, height: 30)
        resetBtn!.backgroundColor = UIColor.black;
        resetBtn!.setTitle("Reset", for: UIControlState.normal)
        resetBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        resetBtn!.setTitleColor(UIColor.white, for: UIControlState.normal)
        resetBtn!.addTarget(self, action: #selector(resetBtnAction), for: UIControlEvents.touchUpInside)
        topView.addSubview(resetBtn!)
        
        // 时间Lab
        numLab = UILabel.init(frame: CGRect.init(x: 0, y: 70, width: KWidth, height: KHeight * 0.4 - 70))
        numLab!.backgroundColor = UIColor.black
        numLab!.text = "0.0";
        numLab!.textColor = UIColor.white
        numLab!.font = UIFont.systemFont(ofSize: 50)
        numLab!.textAlignment = NSTextAlignment.center
        topView.addSubview(numLab!)
        
        let bottomView = UIView.init(frame: CGRect.init(x: 0, y: KHeight * 0.4, width: KWidth, height: KHeight * 0.6))
        view.addSubview(bottomView)
        
        // 播放
        startBtn = UIButton.init(type: UIButtonType.custom)
        startBtn!.backgroundColor = UIColor.blue;
        startBtn!.frame = CGRect.init(x: 10, y: 0, width: (KWidth - 20)/2, height: KHeight * 0.6)
        startBtn!.setImage(UIImage.init(named: "播放"), for: UIControlState.normal)
        startBtn!.addTarget(self, action: #selector(startBtnAction), for: UIControlEvents.touchUpInside)
        bottomView.addSubview(startBtn!)
        
        // 暂停
        stopBtn = UIButton.init(type: UIButtonType.custom)
        stopBtn!.backgroundColor = UIColor.green;
        stopBtn?.frame = CGRect.init(x: 10+(KWidth - 20)/2, y: 0, width: (KWidth - 20)/2, height: KHeight * 0.6)
        stopBtn!.setImage(UIImage.init(named: "暂停"), for: UIControlState.normal)
        stopBtn!.addTarget(self, action: #selector(stopBtnAction), for: UIControlEvents.touchUpInside)
        bottomView.addSubview(stopBtn!)
        
    
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

