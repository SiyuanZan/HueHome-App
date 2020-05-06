//
//  state.swift
//  HueHome
//
//  Created by Siyuan Zan on 4/21/20.
//  Copyright © 2020 Siyuan Zan. All rights reserved.
//

import Foundation

// white bulb json data
final class Statelight:Codable{
    var on:Bool
    var bri:Int
    
    init(on:Bool,bri:Int){
        self.on=on
        self.bri=bri
    }
    
    
}

// light strip json data
final class StateStrip:Codable{
    var on:Bool
    var bri:Int
    var hue:Int
    var sat:Int
//    var ct:Int
    
    init( on:Bool,bri:Int,hue:Int,sat:Int){
        self.on=on
        self.bri=bri
       self.hue=hue
        self.sat=sat
//        self.ct=ct
    }
    
    
}

final class StateStripCt:Codable{
    var on:Bool
    var ct:Int
  
    
    init(on:Bool,ct:Int){
      self.on=on
      self.ct=ct

    }
    
    
}
