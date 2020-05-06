//
//  ContentView.swift
//  HueHome
//
//  Created by Siyuan Zan on 4/21/20.
//  Copyright © 2020 Siyuan Zan. All rights reserved.
//

import SwiftUI
import Combine



struct ContentView: View {
    //
    init(){
        setupTabBar()
    }
    @ObservedObject var appModel = AppModel()
    @State var ifon=false
    @State var a=false
    @State var ifon2=false
    @State var briV:Float=100
    @State var briV2:Float=100
    @State var sat:Float=234
    @State var ct:Float=269
    @State var hueS:Float=37024
    @State var currentColor: Color = .clear
    @State var current:Int = 0
    @State var ctMode:Bool = false
    @State var ifScene:Bool = false
    @State var ifAdd=false
    @State var ifSing=false
    @State var ifSave=false
    @State var oneSecond=0
    @State var sectionState=[false,false,false]
    @State var indexSectionState=0
  
   
    func hueValue()->Int{
        
        var a:Int=0;
        self.hueS=Float(self.current*65534)/226
        a=Int(self.hueS)
        return a
    }
    
    var body: some View {
        
        
        
        VStack{
            ZStack{
                ZStack{
                    Text("Hue white lamp 1")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                    
                }.offset(x:-80,y:-75)
                
                Button(action:{
                    self.ifon.toggle()
                    
                }){
                    HStack{
                        Image("whitelight").resizable()
                            .foregroundColor(self.ifon ? Color(#colorLiteral(red: 1, green: 0.8010541797, blue: 0.002334341407, alpha: 1)):Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                            .frame(width:45,height:60)
                            .offset(x:0)
                    }
                    
                }
                VStack{
                    Text(ifon ? "on" : "off" )
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                } .frame(width:40,height:30)
                    .background(ifon ? Color.yellow : Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                    .cornerRadius(15)
                    .offset(x:120,y:10)
                    .onTapGesture {
                        self.ifon.toggle()
                }
                HStack{
                    Text("bri") .fontWeight(.semibold).offset(x:-10).foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                    Image(systemName: "lightbulb")
                        .scaleEffect(1.3)
                        .foregroundColor(.yellow)
                    Slider(value:$briV, in: 0...255, step:1)
                        .padding()
                        .accentColor(.yellow)
                    //                                         Text(" \(Int(self.briV))")
                    Image(systemName: "lightbulb.fill")
                        .scaleEffect(1.3)
                        .foregroundColor(.yellow)
                    
                    
                }.padding().padding()
                    .offset(y:70)
                
                
                
            }
                
            .frame(width:330,height:200)
            .background(LinearGradient(gradient: Gradient(colors: [.white,Color(#colorLiteral(red: 0.9779339433, green: 0.8427971005, blue: 0.5463026166, alpha: 1)),.black]), startPoint: .top, endPoint: .bottom).opacity(0.2+0.003*Double(Int(briV))))
            .cornerRadius(30)
            .shadow(color: Color.gray.opacity(0.2), radius: 20, x: 0, y: 20)
                
            .offset(y:-6)
//            .onReceive(self.appModel.timer1){ _ in
//
//                //                for i in 0..<self.sectionState.count{
//                //
//                //                    if(self.sectionState[i]==true){
//                //
//                //                    }else{
//                //
//                //                        self.appModel.lightWhite(on: self.ifon, bri: Int(self.briV))
//                //                    }
//                //                }
//
//
//
//            }
            
            
            
            ZStack{
                ZStack{
                    Text("Hue lightstrip plus 1")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                    
                }.offset(x:-70,y:-183)
                
                Button(action:{
                    self.ifon2.toggle()
                    
                }){
                    HStack{
                        Image("lightStrip").resizable()
                            .foregroundColor(ifon2 ? Color(#colorLiteral(red: 1, green: 0.8010541797, blue: 0.002334341407, alpha: 1)):Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                            .frame(width:60,height:60)
                            .offset(x:0,y:-90)
                    }
                    
                }
                VStack(){
                    
                    Text(ifon2 ? "on" : "off" )
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
                    
                .frame(width:40,height:30)
                .background(ifon2 ? Color.yellow : Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                .cornerRadius(15)
                .offset(x:120,y:-80)
                .onTapGesture {
                    self.ifon2.toggle()
                }
                
                VStack(spacing:-70){
                    
                    HStack{
                        Text("ct")
                            .fontWeight(.semibold).foregroundColor(Color.black)
                           .frame(width:40,height:25) .background(self.ctMode ? Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)):Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))  .cornerRadius(15).offset(x:-15)
                            .onTapGesture {
                                self.ctMode.toggle()
                        }
                        Image(systemName: "sun.max")
                            .scaleEffect(1.5)
                            .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                        Slider(value:$ct, in: 153...500, step:1)
                            .padding()
                            .accentColor(Color(#colorLiteral(red: 0.9656279683, green: 0.9081972837, blue: 0.7340887189, alpha: 1)))
                        Image(systemName: "sun.max.fill")
                            .scaleEffect(1.5)
                            .foregroundColor(Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)))
                        
                        
                    }.padding().padding()
                    HStack(){
                        
                        Text("bri") .fontWeight(.semibold).offset(x:-10).foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                        
                        Image(systemName: "lightbulb")
                            .scaleEffect(1.3)
                            .foregroundColor(.yellow)
                        Slider(value:$briV2, in: 0...255, step:1)
                            .padding()
                            .accentColor(.yellow)
                        Image(systemName: "lightbulb.fill")
                            .scaleEffect(1.3)
                            .foregroundColor(.yellow)
                        
                        
                    }.padding().padding()
                    
                    HStack{
                        Text("sat") .fontWeight(.semibold).offset(x:-10).foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                        Image(systemName: "circle")
                            .scaleEffect(1.3)
                            .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                        Slider(value:$sat, in: 0...255, step:1)
                            .padding()
                            .accentColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                        Image(systemName: "circle.righthalf.fill")
                            .scaleEffect(1.3)
                            .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                    }.padding().padding()
                    
                    
                    
                    
                    
                    HStack{
                        Text("hue") .fontWeight(.semibold).offset(x:-22).foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                        ColorPickerView(chosenColor: $currentColor,chosen: $current)
                            .frame(width:200, height: 50)
                        
                        
                    }.padding().padding()
                    
                    
                    
                    
                }.offset(y:70)
                
            }
            .frame(width:330,height:420)
            .background(LinearGradient(gradient: Gradient(colors: [.white,self.currentColor,.black]), startPoint: .top, endPoint: .bottom).opacity(0.2+0.003*Double(Int(briV2))))
            .cornerRadius(30)
            .shadow(color: Color.gray.opacity(0.4), radius: 20, x: 0, y: 20)
            .offset(y:10)
                
            .onReceive(self.appModel.timer2){ _ in
                //
                //                print(self.appModel.sectionData)
                //                print(self.hueS)
                //                   print(lightSection)
             
      
                
                if !self.sectionState.contains(true){
                    
                    if(self.ifSing==false){
                    
                    self.appModel.lightWhite(on: self.ifon, bri: Int(self.briV))
                    if(self.ctMode==true){
                        
                        self.appModel.SpCt(on:self.ifon2,ct:Int(self.ct))
                    }
                    else{
                        
                        self.appModel.lightSp(on:self.ifon2,bri:Int(self.briV2),hue:self.hueValue(), sat:Int(self.sat))
                    }
                        
                    }
                }
                
            }
            
            
            
            
            HStack{
                VStack{
                    Image(systemName: "plus.circle").foregroundColor(self.ifAdd ? Color.white: Color.gray).scaleEffect(1.3)
                    
                    Text("add").foregroundColor(self.ifAdd ? Color.white: Color.gray) .font(.system(size: 13, weight: .regular))
                    
                }.offset(x:-90,y:30)
                    .onTapGesture {
                        self.ifAdd.toggle()
                } .sheet(isPresented: self.$ifAdd){
                    
                    AddScene(ifon:self.$ifon, a: self.$a, ifon2: self.$ifon2, briV: self.$briV,briV2: self.$briV2, sat: self.$sat, ct: self.$ct, hueS: self.$hueS,chosenColor: self.$currentColor,chosen: self.$current,ctMode:self.$ctMode,ifSave: self.$ifSave,sectionState:self.$sectionState)
                }
                
                
                VStack{
                                  Image(systemName: "music.house").foregroundColor(self.ifSing ? Color.white: Color.gray).scaleEffect(1.3)
                                  
                                  Text("sing").foregroundColor(self.ifAdd ? Color.white: Color.gray).font(.system(size: 13, weight: .regular))
                                  
                              }.offset(x:5,y:30)
                                .onTapGesture {
                                      self.ifSing.toggle()
                              } .sheet(isPresented: self.$ifSing){
                                Talk(ifSing:self.$ifSing,briV:self.$briV,hueS:self.$hueS,currentColor:self.$currentColor)
                                
                                
                               
                              }
                
              
                
                VStack{
                    
                    Image(systemName: "t.circle").foregroundColor(self.ifScene ? Color.white: Color.gray).scaleEffect(1.3)
                    Text("theme").foregroundColor(self.ifScene ? Color.white: Color.gray).font(.system(size: 13, weight: .regular))
                    
                }.offset(x:90,y:30)
                    .onTapGesture {
                        self.ifScene.toggle()
                }
                .sheet(isPresented: self.$ifScene){
                    ZStack(alignment: .topTrailing) {
                        Scene(ifon:self.$ifon, a: self.$a, ifon2: self.$ifon2, briV: self.$briV,briV2: self.$briV2, sat: self.$sat, ct: self.$ct, hueS: self.$hueS,sectionState:self.$sectionState,ifSave: self.$ifSave)
                            .frame(width: 50, height: 200)
                            .offset(x: 0, y: 75) }.edgesIgnoringSafeArea(.all)
                }
                
            }
            
            
        }.edgesIgnoringSafeArea(.all)
            .frame(width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height+20)
            .background(Color.black)
        
        
        
        
        
        
    }
}
extension ContentView {
    func setupTabBar() {
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().layer.borderColor = UIColor.clear.cgColor
        UITabBar.appearance().clipsToBounds = true
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

