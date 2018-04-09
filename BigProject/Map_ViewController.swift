//
//  Map_ViewController.swift
//  BigProject
//
//  Created by Thiprat on 1/22/18.
//  Copyright © 2018 Thiprat. All rights reserved.
//

import UIKit

import GoogleMaps




class Map_ViewController: UIViewController,GMSMapViewDelegate, CLLocationManagerDelegate {

    
//-------------------------------------lable&textField----------------------------------
    @IBOutlet weak var LeadingConstaraint: NSLayoutConstraint!
    var MenuShowing = false
    @IBOutlet weak var MenuView: UIView!
    
    

    @IBOutlet weak var GoogleMapView: GMSMapView!
    
//-------------------------------------Endlable&textField----------------------------------
  
    
    
    
//-------------------------------------value----------------------------------------------

    var cameraLati: Double = 0
    var cameraLongti: Double = 0

//-------------------------------------Endvalue----------------------------------------------


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        MenuView.layer.shadowOpacity = 1
        MenuView.layer.shadowRadius = 6

        print("BlogFullName:\(StructOperation.atas.UserFullName)")
        print("BlogUserID:\(StructOperation.atas.UserID)")
        print("BlogLa:\(StructOperation.atas.data_Latitude)")
        print("BlogLon:\(StructOperation.atas.data_Longtitude)")
        print("BlogBlogPole:\(StructOperation.atas.data_Pole_ID)")

        var v = 0
        var i = 0
        
        v = StructOperation.atas.data_Latitude.count
        
        while i < v {
            let la = StructOperation.atas.data_Latitude[i]
            let lon = StructOperation.atas.data_Longtitude[i]
            let doubleLa: Double = (la as NSString).doubleValue
            let doubleLon: Double = (lon as NSString).doubleValue
            
//         Creates a marker in the center of the map.
        let marker = GMSMarker()
        
        marker.icon = UIImage(named:"Poi-EVBoxPNG")

        marker.position = CLLocationCoordinate2D(latitude: doubleLa, longitude: doubleLon)
        //marker.title = "มหาวิทยาลัยธุรกิจบัณฑิตย์"
        marker.title = StructOperation.atas.data_Pole_ID[i]
        //marker.snippet = "ประชาชื่น"
        marker.map = self.GoogleMapView

        i = i + 1
            
            self.cameraLati = doubleLa
            self.cameraLongti = doubleLon
    
        }

        
        let Camera = GMSCameraPosition.camera(withLatitude: cameraLati, longitude: cameraLongti, zoom: 8.5)
        
        
        self.GoogleMapView.camera = Camera
        

        self.GoogleMapView.delegate = self
        self.GoogleMapView?.isMyLocationEnabled = true
        self.GoogleMapView.settings.myLocationButton = true
        self.GoogleMapView.settings.compassButton = true
        self.GoogleMapView.settings.zoomGestures = true

    }
    
    
//---------------------------------------MenuBar--------------------------------------
    
    @IBAction func MenuButton(_ sender: Any) {
        
        if(MenuShowing){
            LeadingConstaraint.constant = -200
            UIView.animate(withDuration: 0.3, animations: {
                
                self.view.layoutIfNeeded()
            })
        }
        else{
            LeadingConstaraint.constant = 0
            UIView.animate(withDuration: 0.3, animations: {
                
                self.view.layoutIfNeeded()
            })
        }
        MenuShowing = !MenuShowing
    }
    
 //---------------------------------------MenuBar--------------------------------------
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    



}
