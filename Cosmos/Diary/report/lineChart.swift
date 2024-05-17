//
//  lineChart.swift
//  Cosmos
//
//  Created by 😏 😏 on 26/2/2023.
//

import SwiftUI

struct lineChart: View {
    var data : [Int]
    var days : [Int]
    var month : Int
    var body: some View {
        VStack{
            
        GeometryReader{ pxy in
            
            ForEach(0..<6){ i in
                Text("\(i*2)")
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
                    .position(x: -20, y: (200 - CGFloat(i*40)))
                
                if( i > 0 && i < 5){
                    Group{
                        Path{ path in
                            path.move(to: CGPoint(x: 0, y:(200 - CGFloat(i*40))))
                            path.addLine(to: CGPoint(x: 300, y:(200 - CGFloat(i*40))))
                        }.stroke(Color.white, style: StrokeStyle(lineWidth: 0.4, lineCap: .round, lineJoin: .round))
                    }
                   
                }
            }
            
            ZStack{
                
                //.stroke(Color.white, style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round))
                ForEach(data.indices,id:\.self){ idx in
                   
                    let point = getPoint(width: pxy.size.width, height:  pxy.size.height, idx: idx)
                    Circle()
                        .frame(width: 5 ,height: 5, alignment: .center)
                        .foregroundColor(.blue)
                        .position(x:point.x, y: point.y)
                   /* Text("\(data[idx])")
                        .font(.system(size: 10))
                        .foregroundColor(.black)
                        .position(x:point.x, y: point.y-10)*/
                    Text("\(days[idx])/\(month)")
                        .font(.system(size: 10))
                        .rotationEffect(.degrees(-30))
                        .position(x:point.x, y: pxy.size.height+20)
                        .foregroundColor(.gray)
                    
                    
                    if idx < (data.count-1){
                        Group{
                            Path{ path in
                                path.move(to: point)
                                path.addLine(to: getPoint(width: pxy.size.width, height:  pxy.size.height, idx: idx+1))
                            }.stroke(Color("lineChart"), style: StrokeStyle(lineWidth: 1.5, lineCap: .round, lineJoin: .round))
                        }
                       
                    }
                    
                }
            }
        }
        .frame(width: 300, height: 200, alignment: .center)
        .background(Color("diaryReport"))
        }
        .frame(width: 300, height: 200, alignment: .center)
        .padding()
    }
    
    
    func getHeight() -> Int{
        return 10
    }
    func getWidth() -> Int{
        return Int(data.count)
    }
    func getXStep(width:CGFloat)->CGFloat{
        return width/(CGFloat(getWidth()))
    }
    func getYStep(height:CGFloat)->CGFloat{
        return height/(CGFloat(getHeight()))
    }
    
    func getItemX(width:CGFloat,idx:Int)->CGFloat{
        return CGFloat(CGFloat(Double(idx) + 0.5)*getXStep(width: width))
    }
    func getItemY(height:CGFloat,idx:Int)->CGFloat{
        return CGFloat(data[idx])*getYStep(height:height)
    }
    func getPoint(width:CGFloat,height:CGFloat,idx:Int)->CGPoint{
        return CGPoint(x: getItemX(width: width, idx: idx), y:height-getItemY(height: height, idx: idx))
    }
}

