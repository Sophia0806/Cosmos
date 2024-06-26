//
//  pieChart.swift
//  Cosmos
//
//  Created by 😏 😏 on 28/2/2023.
//

import SwiftUI

struct pieChart: View {
  @Binding var data: [Double]
  @Binding var labels: [String]
  
  private let count: Int
  private let colors: [Color]
  private let borderColor: Color
  private let sliceOffset: Double = -.pi / 2
  @State var display : [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false]
  
  
    init(data: Binding<[Double]>, labels: Binding<[String]>, colors: [Color], borderColor: Color, count: Int) {
    self._data = data
    self._labels = labels
    self.colors = colors
    self.borderColor = borderColor
    self.count  = count
  }
  
  var body: some View {
    GeometryReader { geo in
      ZStack(alignment: .center) {
        ForEach(0 ..< data.count) { index in
          PieSlice(startAngle: startAngle(for: index), endAngle: endAngle(for: index))
            .fill(colors[index % colors.count])
          
          PieSlice(startAngle: startAngle(for: index), endAngle: endAngle(for: index))
            .stroke(Color.white, lineWidth: 1)
          
        if(data[index] > 0.0){
          PieSliceText(
            title: "\(labels[index])",
            data: data[index],
            count: count)
          .offset(textOffset(for: index, in: geo.size))
          .zIndex(1)
        }
        }
      }
    }.frame(width: 300, height: 200, alignment: .center)
  }
  
  private func startAngle(for index: Int) -> Double {
    switch index {
      case 0:
        return sliceOffset
      default:
        let ratio: Double = data[..<index].reduce(0.0, +) / data.reduce(0.0, +)
        return sliceOffset + 2 * .pi * ratio
    }
  }
  
  private func endAngle(for index: Int) -> Double {
    switch index {
      case data.count - 1:
        return sliceOffset + 2 * .pi
      default:
        let ratio: Double = data[..<(index + 1)].reduce(0.0, +) / data.reduce(0.0, +)
        return sliceOffset + 2 * .pi * ratio
    }
  }
  
  private func textOffset(for index: Int, in size: CGSize) -> CGSize {
    let radius = min(size.width, size.height) / 3
    let dataRatio = (2 * data[..<index].reduce(0, +) + data[index]) / (2 * data.reduce(0, +))
    let angle = CGFloat(sliceOffset + 2 * .pi * dataRatio)
    return CGSize(width: radius * cos(angle), height: radius * sin(angle))
  }
}

struct PieSlice: Shape {
  let startAngle: Double
  let endAngle: Double
  
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let radius = min(rect.width, rect.height) / 2
    let alpha = CGFloat(startAngle)
    
    let center = CGPoint(
      x: rect.midX,
      y: rect.midY
    )
    
    path.move(to: center)
    
    path.addLine(
      to: CGPoint(
        x: center.x + cos(alpha) * radius,
        y: center.y + sin(alpha) * radius
      )
    )
    
    path.addArc(
      center: center,
      radius: radius,
      startAngle: Angle(radians: startAngle),
      endAngle: Angle(radians: endAngle),
      clockwise: false
    )
    
    path.closeSubpath()
    
    return path
  }
}

struct PieSliceText: View {
  let title: String
  let data : Double
  let count : Int
  
  var body: some View {
    VStack {
      Text(title)
        .font(.system(size: 10, design: .serif).weight(.light))
        .foregroundColor(Color.white)
        Text(String(format:"%.2f%%",(data*100.0)/Double(count)))
        .font(.system(size: 10, design: .serif).weight(.light))
        .foregroundColor(Color.white)
    }
  }
}
