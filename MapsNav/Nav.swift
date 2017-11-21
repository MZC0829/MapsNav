//
//  Nav.swift
//  MapsNav
//
//  Created by 麦志超 on 2017/11/21.
//  Copyright © 2017年 MZC. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


// MARK: - 跳转到第三方地图导航
///
/// - Parameters:
///   - toPoint: 位置坐标
///   - toPointName: 位置名称
public func mapsNav(toPoint : CLLocationCoordinate2D, toPointName: String? = "Point Name")
{
    
    let selectMapsAlert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    
    // MARK: 高德地图
    if UIApplication.shared.canOpenURL(URL(string: "iosamap://")!)
    {
        let AMapAction = UIAlertAction(title: "高德地图", style: .default, handler: { (alert) in
            
            let urlString = "iosamap://navi?sourceApplication=MapsNav&poiname=toPointName&poiid=BGVIS&lat=\(toPoint.latitude)&lon=\(toPoint.longitude)&dev=0&style=2"
            
            let url = URL(string: urlString)
            
            if #available(iOS 10, *)
            {
                UIApplication.shared.open(url!, options: [:], completionHandler: nil)
            }
            else
            {
                UIApplication.shared.openURL(url!)
            }
            
        })
        
        selectMapsAlert.addAction(AMapAction)
    }
    
    // MARK: Google地图
    if UIApplication.shared.canOpenURL(URL(string: "comgooglemaps://")!)
    {
        let googleMapAction = UIAlertAction(title: "Google地图", style: .default, handler: { (alert) in
            
            let urlString = "comgooglemaps://?x-source=AMPOWER&x-success=comgooglemaps://&saddr=&daddr=\(toPoint.latitude),\(toPoint.longitude)&directionsmode=driving"
            
            let url = URL(string: urlString)
            
            if #available(iOS 10.0, *)
            {
                UIApplication.shared.open(url!, options: [:], completionHandler: nil)
            }
            else
            {
                UIApplication.shared.openURL(url!)
            }
        })
        
        selectMapsAlert.addAction(googleMapAction)
    }
    
    // MARK: 苹果地图
    let appleMapAction = UIAlertAction(title: "苹果地图", style: .default)
    { (alert) in
        
        let currentLocation = MKMapItem.forCurrentLocation()
        var toLocation = MKMapItem()
        
        if #available(iOS 10.0, *)
        {
            toLocation = MKMapItem(placemark: MKPlacemark(coordinate: toPoint))
        }
        else
        {
            toLocation = MKMapItem(placemark: MKPlacemark(coordinate: toPoint, addressDictionary: nil))
        }
        
        toLocation.name = toPointName
        
        MKMapItem.openMaps(with: [currentLocation,toLocation], launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving, MKLaunchOptionsShowsTrafficKey : NSNumber(value : true)])
        
    }
    selectMapsAlert.addAction(appleMapAction)
    
//    // MARK: 百度地图
//    if UIApplication.shared.canOpenURL(URL(string: "baidumap://")!)
//    {
//        let baiduMapAction = UIAlertAction(title: "百度地图", style: .default, handler: { (alert) in
//
//            let originLatitude = MKMapItem.forCurrentLocation().placemark.coordinate.latitude
//
//            let originLongitude = MKMapItem.forCurrentLocation().placemark.coordinate.longitude
//
//            let urlString = "baidumap://map/direction?origin=\(originLatitude),\(originLongitude)&destination=\(toPoint.latitude),\(toPoint.longitude)&mode=driving&src=webapp.navi.yourCompanyName.yourAppName"
//
//            let url = URL(string: urlString)
//
//            if #available(iOS 10, *)
//            {
//                UIApplication.shared.open(url!, options: [:], completionHandler: nil)
//            }
//            else
//            {
//                UIApplication.shared.openURL(url!)
//            }
//
//        })
//
//        selectMapsAlert.addAction(baiduMapAction)
//    }
    
//    // MARK: 腾讯地图
//    if UIApplication.shared.canOpenURL(URL(string: "qqmap://")!)
//    {
//        let AMapAction = UIAlertAction(title: "腾讯地图", style: .default, handler: { (alert) in
//            
//            //let urlString = "qqmap://map/routeplan?from=22.222,112.333&type=drive&tocoord=\(toPoint.latitude),\(toPoint.longitude)&to=\(toPointName!)&policy=1&referer=myapp"
//            
//            let urlString = "http://apis.map.qq.com/uri/v1/routeplan?type=drive&from=中关村&to=望京&policy=0&referer=MapsNav"
//            
//            let url = URL(string: urlString)
//            
//            if #available(iOS 10, *)
//            {
//                UIApplication.shared.open(url!, options: [:], completionHandler: nil)
//            }
//            else
//            {
//                UIApplication.shared.openURL(url!)
//            }
//            
//        })
//        
//        selectMapsAlert.addAction(AMapAction)
//    }
    
    
    
    let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
    selectMapsAlert.addAction(cancelAction)
    
    let currentVC = UIViewController.currentViewController()
    currentVC?.present(selectMapsAlert, animated: true, completion: nil)
}
