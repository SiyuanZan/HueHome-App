//
//  AddScene.swift
//  HueHome
//
//  Created by Siyuan Zan on 5/2/20.
//  Copyright © 2020 Siyuan Zan. All rights reserved.
//

import SwiftUI

struct lightData {
    //    var id = UUID()
    var ifon: Bool
    var briV: Int
    var ifon2:Bool
    var briV2:Int
    var sat:Int
    var ct:Int
    var ctMode:Bool
    var hueS:Int
}
var lightdata:[lightData]=[]
var lightSection:[Section]=[]

struct AddScene: View {
    @Binding var ifon:Bool
    @Binding var a:Bool
    @Binding var ifon2:Bool
    @Binding var briV:Float
    @Binding var briV2:Float
    @Binding var sat:Float
    @Binding var ct:Float
    @Binding var hueS:Float
    @Binding var chosenColor: Color
    @Binding var chosen : Int
    @Binding var ctMode:Bool
    @Binding var ifSave:Bool
    @Binding var sectionState:[Bool]
    @ObservedObject var appModel = AppModel()
    var body: some View {
        VStack{
            VStack(alignment:.leading,spacing:20){
                
                Text("Hue white lamp 1").font(.system(size: 18, weight: .bold)).foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))).offset(x:0)
                HStack{
                Text("on/off: ").foregroundColor(.white)
                Text(self.ifon ? "on" :"off").foregroundColor(.white)
                }
                Text("bri: \(Int(self.briV))").foregroundColor(.white)
                Text("Hue lightstrip plus 1").font(.system(size: 18, weight: .bold)).foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))).offset(x:0)
                HStack{
                Text("on/off ").foregroundColor(.white)
                Text(self.ifon ? "on" :"off").foregroundColor(.white)
                }
                HStack{
                Text("ct: ").foregroundColor(.white)
                Text(self.ctMode ? "on" :"off").foregroundColor(.white)
                Text(self.ctMode ? "\(Int(self.ct))" :"").foregroundColor(.white)
                }
                Text("bri: \(Int(self.briV2))").foregroundColor(.white)
                Text("sat: \(Int(self.sat))").foregroundColor(.white)
                Text("hue: \(Int(self.hueS))").foregroundColor(.white)
                
                
                
            } .frame(width:330,height:420).offset(x:-50)
                .background(LinearGradient(gradient: Gradient(colors: [.white,self.chosenColor,.black]), startPoint: .top, endPoint: .bottom).opacity(0.2+0.003*Double(Int(briV2))))
                .cornerRadius(30)
                .shadow(color: Color.gray.opacity(0.4), radius: 20, x: 0, y: 20)
            
            Text("Add").font(.headline).fontWeight(.semibold).foregroundColor(.black)
            .frame(width:50,height:30)
                .background(self.ifSave ? Color.yellow : Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                .cornerRadius(15)
                .offset(x:110,y:-40)
                .onTapGesture {
                    self.ifSave.toggle()
                    if(self.ifSave==true){
                        let a1 = Section(title: "Theme\(self.appModel.sectionData.count+1)", text: "Duration",ifclick:false, duration: [false,false,true], color: self.chosenColor,durationText:["0.5 hr","3 hrs","never"])
                      lightSection.append(a1)
                        lightdata.append( lightData(ifon: self.ifon,briV: Int(self.briV),ifon2:self.ifon2,briV2:Int(self.briV2),sat:Int(self.sat),ct:Int(self.ct)
                            ,ctMode:self.ctMode, hueS:Int(self.hueS)))
                        self.sectionState.append(false)
                    }
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        .frame(width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height+20)
        .background(Color.black)
    }
}

struct AddScene_Previews: PreviewProvider {
    static var previews: some View {
        AddScene(ifon: .constant(false), a:  .constant(false), ifon2: .constant(false), briV: .constant(0), briV2: .constant(0), sat: .constant(0), ct: .constant(0), hueS: .constant(1416),chosenColor: Binding.constant(Color.white), chosen:Binding.constant(0),ctMode:.constant(false),ifSave: .constant(false),sectionState:.constant([false,false,false]))
    }
}
