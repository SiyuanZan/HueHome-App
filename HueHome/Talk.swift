//
//  Talk.swift
//  HueHome
//
//  Created by Siyuan Zan on 5/5/20.
//  Copyright © 2020 Siyuan Zan. All rights reserved.
//

import SwiftUI
let numberOfSamples: Int = 3
struct Talk: View {
    @ObservedObject private var mic = MicrophoneMonitor(numberOfSamples: numberOfSamples)
    @ObservedObject var appModel = AppModel()
    @Binding var ifSing:Bool
    @Binding var briV:Float
    @Binding var hueS:Float
    @Binding var currentColor: Color
    @State var ifStartSing=false
    
    @State var conic = RadialGradient(gradient: Gradient(colors: [Color.white.opacity(0),.red]), center: .center, startRadius: 50, endRadius: 100)
    @State var conic2 = RadialGradient(gradient: Gradient(colors: [Color.white.opacity(0),Color.white.opacity(0.4),Color.white.opacity(0.7)]), center: .center, startRadius: 6, endRadius: 50)
    private func normalizeSoundLevel(level: Float) -> Float {
        let level = max(0.2, CGFloat(level) + 50) / 2 // between 0.1 and 25
        
        
        
        return Float(level * (255 / 25))
        // scaled to max at 300 (our height of our bar)
    }
    
    
    private func circleOpacity()->Double{
        
        let level = max(0.2, CGFloat(self.mic.soundSamples[2]) + 50) / 2
        let circleWidth = Double(level * (0.5 / 25)+0.3)
        
        return circleWidth
    }
    
    private func circleRadius()->CGFloat{
        
        let level = max(0.2, CGFloat(self.mic.soundSamples[0]) + 50) / 2
        let circleWidth = CGFloat(level * (300 / 25)+100)
        
        return circleWidth
    }
    private func circleRadius2()->CGFloat{
        
        let level = max(0.2, CGFloat(self.mic.soundSamples[1]) + 50) / 2
        let circleWidth = CGFloat(level * (70 / 25)+30)
        
        return circleWidth
    }
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack() {
                    
                    Circle()
                        .fill(self.conic)
                        .frame(width: self.circleRadius(), height: 350)
                    
                    ZStack{
                        Circle()
                            .fill(self.conic2)
                            .frame(width: self.circleRadius2(), height: 350)
                    }.offset(x:100,y:-170)
                    
                    
                }.onReceive(self.appModel.timer1){ _ in
                    self.conic = RadialGradient(gradient: Gradient(colors: [Color.white.opacity(0),Color.white.opacity(0.35),self.currentColor.opacity(self.circleOpacity())]), center: .center, startRadius: 30, endRadius: 100)
                    
                    
                    //                 self.briV=Float(self.normalizeSoundLevel(level: self.mic.soundSamples[1]))
                    //                                       print(self.normalizeSoundLevel(level: self.mic.soundSamples[0]),self.normalizeSoundLevel(level: self.mic.soundSamples[1]))
                    
                    if(self.ifStartSing==true){
                        self.appModel.lightWhite(on: true, bri:Int(self.normalizeSoundLevel(level: self.mic.soundSamples[1])))
                        self.appModel.lightSp(on:true,bri:Int(self.normalizeSoundLevel(level: self.mic.soundSamples[0])),hue:Int(self.hueS), sat:Int(self.normalizeSoundLevel(level: self.mic.soundSamples[2])))
                    }
                }
                
                
                ZStack{
                    Text("play").font(.headline).fontWeight(.semibold).foregroundColor(.black)
                        .frame(width:50,height:30)
                        .background(self.ifStartSing ? Color.white : Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                        .cornerRadius(15)
                        .padding(.bottom, 64)
                        
                        .onTapGesture {
                            
                            self.ifStartSing.toggle()
                    }
                    
                }.offset(x:100,y:50)
                
            }
            
        }.frame(width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height+10).background(Color.black).edgesIgnoringSafeArea(.all)
        
    }
}

struct Talk_Previews: PreviewProvider {
    static var previews: some View {
        Talk(ifSing: .constant(false),briV:.constant(100),hueS:.constant(1416),currentColor:.constant(.clear))
    }
}


//struct BarView: View {
//    var value: CGFloat
//    let conic = RadialGradient(gradient: Gradient(colors: [Color.white.opacity(0),.yellow,.blue, .purple]), center: .center, startRadius: 30, endRadius: 200)
//    var body: some View {
//        ZStack {
////            RoundedRectangle(cornerRadius: 20)
////                .fill(LinearGradient(gradient: Gradient(colors: [.purple, .blue]),
////                                     startPoint: .top,
////                                     endPoint: .bottom))
////                .frame(width: (UIScreen.main.bounds.width - CGFloat(numberOfSamples) * 4) / CGFloat(numberOfSamples), height: value)
//
//
//           Circle()
//                .fill(conic)
//                .frame(width: 300, height: 300)
//        }
//
//    }
//}
