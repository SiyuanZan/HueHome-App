//
//  Scene.swift
//  HueHome
//
//  Created by Siyuan Zan on 4/29/20.
//  Copyright © 2020 Siyuan Zan. All rights reserved.
//

import SwiftUI

struct Scene: View {
    
    @Binding var ifon:Bool
    @Binding var a:Bool
    @Binding var ifon2:Bool
    @Binding var briV:Float
    @Binding var briV2:Float
    @Binding var sat:Float
    @Binding var ct:Float
    @Binding var hueS:Float
    @Binding var sectionState:[Bool]
    @Binding var ifSave:Bool
    @ObservedObject var appModel = AppModel()
    
    var body: some View {
        ZStack{
            HStack{
                Text("Theme")
                    .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                    .font(.system(size: 25, weight: .bold))
                    .offset(x:-110,y:-300)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    //                    ForEach(sectionData) { item in
                    ForEach(appModel.sectionData,id:\.title){ section in
                        
                        GeometryReader { geometry in
                            //                            SectionView(section: item)
                            SectionView(section:section,ifon:self.$ifon,a:self.$a,ifon2: self.$ifon2, briV: self.$briV, briV2: self.$briV2, sat: self.$sat, ct: self.$ct, hueS: self.$hueS,sectionState:self.$sectionState,ifSave: self.$ifSave)
                                .rotation3DEffect(Angle(degrees:
                                    Double(geometry.frame(in: .global).minX - 30) / -20
                                ), axis: (x: 0, y: 10, z: 0))
                            
                        }
                        .frame(width: 275, height: 275)
                        
                    }
                }
                .padding(30)
                .padding(.bottom, 30)
            }
            
            
            Spacer()
            
            
            
            
            
            
        }.frame(width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height+100).background(Color.black).edgesIgnoringSafeArea(.all)
        
        
        
    }
}

struct Scene_Previews: PreviewProvider {
    static var previews: some View {
        Scene( ifon: .constant(false), a:  .constant(false), ifon2: .constant(false), briV: .constant(0), briV2: .constant(0), sat: .constant(0), ct: .constant(0), hueS: .constant(1416),sectionState:.constant([false,false,false]),ifSave:.constant(false))
    }
}


struct SectionView: View {
    @ObservedObject var appModel = AppModel()
    @State var section: Section
    @State var num1=[0,0,0,0,0,0,0,0,0]
    @Binding var ifon:Bool
    @Binding var a:Bool
    @Binding var ifon2:Bool
    @Binding var briV:Float
    @Binding var briV2:Float
    @Binding var sat:Float
    @Binding var ct:Float
    @Binding var hueS:Float
    @Binding var sectionState:[Bool]
    @Binding var ifSave:Bool
    @State var timer3=Timer.publish(every:1, on:.main, in: .default).autoconnect()
    
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                
                
            } .offset(y:-30)
            
            Text(section.text)
                .font(.system(size: 16, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .offset(y:0)
            
            HStack(spacing:20){
                Text(self.section.durationText[0]).font(.system(size: 16, weight: .semibold)) .foregroundColor(self.section.duration[0] ? Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)) : Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))).frame(width:50,height:25).border(self.section.duration[0] ? Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)) : Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), width:2)
                    .onTapGesture {
                        self.section.duration[0].toggle()
                        
                        if(self.section.duration[0]==true){
                            
                            self.section.duration[1]=false
                            self.section.duration[2]=false
                            if(self.section.title=="Spring comes and winter goes"){
                                self.timer3=Timer.publish(every:1, on:.main, in: .default).autoconnect()
                            }else if(self.section.title != "Spring comes and winter goes"){
                                
                                self.timer3=Timer.publish(every:1, on:.main, in: .default).autoconnect()
                                self.num1[5]=5
                                
                            }
                        }
                }
                Text(self.section.durationText[1]).font(.system(size: 16, weight: .semibold)) .foregroundColor(self.section.duration[1] ? Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)) : Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))).frame(width:50,height:25).border(self.section.duration[1] ? Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)) : Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), width:2)
                    .onTapGesture {
                        self.section.duration[1].toggle()
                        
                        if(self.section.duration[1]==true){
                            self.section.duration[0]=false
                            self.section.duration[2]=false
                            if(self.section.title=="Spring comes and winter goes"){
                                self.timer3=Timer.publish(every:5, on:.main, in: .default).autoconnect()
                            }else if(self.section.title != "Spring comes and winter goes"){
                                
                                self.timer3=Timer.publish(every:1, on:.main, in: .default).autoconnect()
                                self.num1[5]=5400
                                
                            }
                        }
                }
                Text(self.section.durationText[2]).font(.system(size: 16, weight: .semibold)) .foregroundColor(self.section.duration[2] ? Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)) : Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))).frame(width:50,height:25).border(self.section.duration[2] ? Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)) : Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), width:2)
                    .onTapGesture {
                        self.section.duration[2].toggle()
                        
                        if(self.section.duration[2]==true){
                            self.section.duration[0]=false
                            self.section.duration[1]=false
                            if(self.section.title=="Spring comes and winter goes"){
                                self.timer3=Timer.publish(every:10, on:.main, in: .default).autoconnect()
                            }else if(self.section.title != "Spring comes and winter goes"){
                                
                                self.timer3=Timer.publish(every:1, on:.main, in: .default).autoconnect()
                                
                            }
                        }
                }
                
                
            }.offset(x:-10,y:10)
            
            
            HStack{
                
                
                
                Text("play").foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                    .font(.system(size: 16, weight: .bold))
                    .frame(width:50,height:35)
                
                
            } .background(self.section.ifclick ? Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)) : Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))) .cornerRadius(18).offset(x:80,y:25)
                .onTapGesture {
                    self.section.ifclick.toggle()
                    
                    
            }
            
            
            
            
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(section.ifclick ? 0.8: 0.3),section.color]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
        .onReceive(self.timer3){_ in
            
            if(self.section.title=="Spring comes and winter goes"){
                
                //                print(self.briV2,self.sat,self.hueS, self.num1[3])
                if(self.section.ifclick==true){
             
                        self.sectionState[0]=true
                        //ice melting
                        self.num1[3]+=1
                        
                        if(self.num1[3]<=4){
                            self.ifon=false
                            self.briV=0
                            self.ifon2=true
                            self.briV2=255
                            self.hueS=37024
                            self.sat=242
                            self.appModel.lightSp(on:self.ifon2,bri:Int(self.briV2),hue:Int(self.hueS),sat:Int(self.sat))
                            self.appModel.lightWhite(on:self.ifon, bri: Int(self.briV))
                            self.num1[4]=250
                        }
                        else if(self.num1[3]>4&&self.num1[4]>0){
                         
                            self.ifon2=true
                            self.num1[4]-=10
                            
                            self.briV2=Float(self.num1[4])
                            if( self.num1[4]<=100){
                                self.ifon=true
                                self.briV=0
                            }
                            self.appModel.lightSp(on:self.ifon2,bri:Int(self.briV2),hue:Int(self.hueS),sat:Int(self.sat))
                            self.appModel.lightWhite(on:self.ifon, bri: Int(self.briV))
                            
                            
                        }
                        
                        if( self.num1[4]<=0){
                            self.num1[4]=0
                            //spring
                            self.ifon=true
                            self.ifon2=true
                            self.briV=Float(self.num1[0])
                            self.sat=0
                            self.hueS=1416
                            self.briV2=Float(self.num1[1])+5
                            
                            if(Int(self.briV)<=255 && self.num1[1]<255&&self.num1[0]<255){
                                self.num1[0]+=5
                                self.num1[1]+=5
                                self.appModel.lightWhite(on:self.ifon, bri: Int(self.briV))
                                self.appModel.lightSp(on:self.ifon2,bri:Int(self.briV2),hue:Int(self.hueS),sat:Int(self.sat))
                            }
                            if(Int(self.briV2)>=255){
                                self.briV2=255
                                self.sat=Float(self.num1[2])
                                if(self.sat<=120 && self.num1[2]<=100){
                                    self.num1[2]+=5
                                    self.appModel.lightSp(on:self.ifon2,bri:Int(self.briV2),hue:Int(self.hueS),sat:Int(self.sat))
                                }else{
                                    self.sat=120
                                    self.appModel.lightSp(on:self.ifon2,bri:Int(self.briV2),hue:Int(self.hueS),sat:Int(self.sat))
                                }
                            }
                        }
          
                }
                
            }
            
            
            if(self.section.title=="Spring comes and winter goes"){
                
                
                if(self.section.ifclick==true ){
                    self.sectionState[0]=true
                }else{
                    self.sectionState[0]=false
                }
                
            }
            if(self.section.title=="Sleeping"){
                
                if(self.section.ifclick==true && self.section.duration[2]==true ){
                    
                    
                    self.sectionState[1]=true
                    self.ifon2=true
                    self.ifon=true
                    self.briV2=90
                    self.sat=255
                    self.briV=0
                    self.hueS=48715
                    self.appModel.lightWhite(on:self.ifon, bri:Int(self.briV))
                    
                    self.appModel.lightSp(on:self.ifon2,bri:Int(self.briV2),hue:Int(self.hueS),sat:Int(self.sat))
                }else if(self.section.ifclick==true && self.num1[5]>0 && self.section.duration[2]==false){
                    self.num1[5]-=1
                    self.sectionState[1]=true
                    self.ifon2=true
                    self.ifon=true
                    self.briV2=90
                    self.sat=255
                    self.briV=0
                    self.hueS=48715
                    self.appModel.lightWhite(on:self.ifon, bri:Int(self.briV))
                    self.appModel.lightSp(on:self.ifon2,bri:Int(self.briV2),hue:Int(self.hueS),sat:Int(self.sat))
                }
                else{
                    self.sectionState[1]=false
                    //                      self.num1[5]=6
                    self.ifon=false
                    self.ifon2=false
                    self.section.ifclick=false
                }
            }
            
            if(self.section.title=="Reading"){
                
                if(self.section.ifclick==true && self.section.duration[2] == true){
                    
                    self.sectionState[2]=true
                    self.ifon2=true
                    self.ifon=true
                    self.briV2=255
                    self.sat=0
                    self.briV=255
                    self.appModel.lightWhite(on:self.ifon, bri:Int(self.briV))
                    self.appModel.lightSp(on:self.ifon2,bri:Int(self.briV2),hue:Int(self.hueS),sat:Int(self.sat))
                    
                    
                }else if(self.section.ifclick==true && self.num1[5]>0 && self.section.duration[2]==false){
                    print( self.num1[5])
                    self.num1[5]-=1
                    self.sectionState[2]=true
                    self.ifon2=true
                    self.ifon=true
                    self.briV2=255
                    self.sat=0
                    self.briV=255
                    self.appModel.lightWhite(on:self.ifon, bri:Int(self.briV))
                    self.appModel.lightSp(on:self.ifon2,bri:Int(self.briV2),hue:Int(self.hueS),sat:Int(self.sat))
                    
                    
                }
                else{
                    self.sectionState[2]=false
                    //                    self.appModel.lightSp(on:self.ifon2,bri:Int(self.briV2),hue:Int(self.hueS),sat:Int(self.sat))
                    self.ifon=false
                    self.ifon2=false
                    self.section.ifclick=false
                }
                
                
                
            }
            
            
            if(self.section.title=="Theme\(self.sectionState.count)"){
                let index = self.sectionState.count-4
                
                if(self.section.ifclick==true && self.section.duration[2] == true){
                    
                    self.sectionState[self.sectionState.count-1]=true
                    self.ifon = lightdata[index].ifon
                    self.ifon2 = lightdata[index].ifon2
                    self.briV=Float(lightdata[index].briV)
                    self.briV2=Float(lightdata[index].briV2)
                    self.sat=Float(lightdata[index].sat)
                    self.hueS=Float(lightdata[index].hueS)
                    self.ct=Float(lightdata[index].ct)
                    self.appModel.lightWhite(on:self.ifon, bri:Int(self.briV))
                    if(lightdata[index].ctMode==true){
                        
                        self.appModel.SpCt(on:self.ifon2,ct:Int(self.ct))
                    }else{
                        
                        self.appModel.lightSp(on:self.ifon2,bri:Int(self.briV2),hue:Int(self.hueS),sat:Int(self.sat))
                        
                    }
                    
                }
                else if(self.section.ifclick==true && self.num1[5]>0 && self.section.duration[2]==false){
//                    print( self.num1[5])
                    self.num1[5]-=1
                    self.sectionState[self.sectionState.count-1]=true
                    self.ifon = lightdata[index].ifon
                    self.ifon2 = lightdata[index].ifon2
                    self.briV=Float(lightdata[index].briV)
                    self.briV2=Float(lightdata[index].briV2)
                    self.sat=Float(lightdata[index].sat)
                    self.hueS=Float(lightdata[index].hueS)
                    self.ct=Float(lightdata[index].ct)
                    self.appModel.lightWhite(on:self.ifon, bri:Int(self.briV))
                    if(lightdata[index].ctMode==true){
                        
                        self.appModel.SpCt(on:self.ifon2,ct:Int(self.ct))
                    }else{
                        
                        self.appModel.lightSp(on:self.ifon2,bri:Int(self.briV2),hue:Int(self.hueS),sat:Int(self.sat))
                        
                    }
                }
                else{
                    self.section.ifclick=false
                    self.sectionState[self.sectionState.count-1]=false
                    self.ifon=false
                    self.ifon2=false
                    
                }
                
                
            }
            
        }
        
        
        
    }
    
}

struct Section {
    //    var id = UUID()
    var title: String
    var text: String
    var ifclick:Bool
    var duration:[Bool]
    var color: Color
    var durationText:[String]
}


class AppModel: ObservableObject {
    
    var sectionData=[Section]()
    
    let timer1=Timer.publish(every:0.5, on:.main, in: .default).autoconnect()
    let timer2=Timer.publish(every:0.5, on:.main, in: .default).autoconnect()
    
    init(){
        let a1 = Section(title: "Spring comes and winter goes", text: "Duration",ifclick:false, duration: [true,false,false], color: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)),durationText:["1/s","5/s","10/s"])
        sectionData.append(a1)
        let a2 = Section(title: "Sleeping", text: "Duration", ifclick:false,duration: [false,false,false], color:Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)),durationText:["0.5h","3h","never"])
        sectionData.append(a2)
        let a3 =  Section(title: "Reading", text: "Duration", ifclick:false,duration: [false,false,false],color: Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)),durationText:["0.5h","3h","never"])
        sectionData.append(a3)
        
        for i in 0..<lightSection.count{
            
            sectionData.append(lightSection[i])
            
        }
        
    }
    
    
    func lightWhite(on:Bool,bri:Int){
        
        let state=Statelight(on: on, bri:bri )
        let putRequest=APIRequest(endpoint: "state")
        putRequest.save(state, completion:{ result in
            
            switch result{
            case .success( _):
                print("success")
            case .failure( _):
                print("")
                
            }
            
        })
    }
    
    func lightSp(on:Bool,bri:Int,hue:Int,sat:Int){
        let stripState=StateStrip(on:on,bri:bri,hue:hue,sat:sat)
        let stripPutRequest=StripAPIRequest(endpoint: "state")
        stripPutRequest.save(stripState, completion:{ result in
            
            switch result{
            case .success( _):
                print("success")
            case .failure( _):
                print("")
                
            }
            
        })
        
    }
    func SpCt(on:Bool,ct:Int){
        let stripState=StateStripCt(on:on,ct:ct)
        let stripPutRequest=StripAPIRequestCt(endpoint: "state")
        stripPutRequest.save(stripState, completion:{ result in
            
            switch result{
            case .success( _):
                print("success")
            case .failure( _):
                print("")
                
            }
            
        })
        
    }
    
}







