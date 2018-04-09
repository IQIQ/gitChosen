//
//  TabBarPole_ViewController.swift
//  BigProject
//
//  Created by Thiprat on 4/2/18.
//  Copyright © 2018 Thiprat. All rights reserved.
//

import UIKit

class TabBarPole_ViewController: UITabBarController {
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        tabBar.items![0].image = UIImage(named: "icon-Map.png")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        //        tabBar.items![1].image = UIImage(named: "icon-MyCard.png")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        //        tabBar.items![2].image = UIImage(named: "icon-Report.png")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        //        tabBar.items![0].selectedImage = UIImage(named: "icon-Map.png")
        //        tabBar.items![1].selectedImage = UIImage(named: "icon-MyCard.png")
        //        tabBar.items![2].selectedImage = UIImage(named: "icon-Report.png")
        
        //        tabBar.items![0].selectedImage = UIImage(named: "icon-Map.png")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        //        tabBar.items![1].selectedImage = UIImage(named: "icon-MyCard.png")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        //        tabBar.items![2].selectedImage = UIImage(named: "icon-Report.png")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        //case alwaysOriginal = 1
        
        // Do any additional setup after loading the view.
        
        //self.reloadInputViews()
        
        
        //        let rect = self.tabBar.frame;
        //        self.tabBar.frame  = rect.insetBy(dx: 0, dy:  -view.frame.height + self.tabBar.frame.height + (self.navigationController?.navigationBar.frame.height)!)
        
        //TabBarView.frame =
        
        
        //        TabBarView.frame = CGRect(x: 0, y:  TabBarView.frame.size.height, width: TabBarView.frame.size.width, height: TabBarView.frame.size.height)
        //        TabBarView.frame = CGRect(x: 0, y: 0, width: TabBarView.frame.size.width, height: TabBarView.frame.size.height)
        //
        //        tabBar.frame = CGRect(x: 0, y: 0, width: tabBar.frame.size.width, height: tabBar.frame.size.height)
        //        tabBar.frame = CGRect(x: 0, y:  tabBar.frame.size.height, width: tabBar.frame.size.width, height: tabBar.frame.size.height)
        
        //self.view.layoutIfNeeded()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        
        UIApplication.shared.statusBarFrame.size.height
        tabBar.frame = CGRect(x: 0, y: 0, width: tabBar.frame.size.width, height: tabBar.frame.size.height)

        super.viewDidLayoutSubviews()
    }
    
    //-------------------------Func Refresh----------------
    func refresh(){
        
        self.viewDidLoad()
        print("Use func Reload Tab Bar")
        
    }
    //-------------------------Func Refresh----------------
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

