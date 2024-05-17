//
//  barChart.swift
//  Cosmos
//
//  Created by 😏 😏 on 28/2/2023.
//

import SwiftUI

struct barChart: View {
    var data : [Int]
    var days : [Int]
    var month : Int
    var body: some View {
        VStack{
            BarChartView(values: data, days: days, month: month)
        }.frame(width: 300, height: 200, alignment: .center)
    }
}

struct BarChartView: View {
    var values : [Int]
    var days : [Int]
    var month : Int
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .bottom) {
                ForEach(values.indices,id:\.self){ i in
                    CapsuleView(value: values[i], day: days[i], month: month)
                }
            }
        }
    }
}

struct CapsuleView: View {
    let value: Int
    let day: Int
    let month : Int

    var body: some View {
        HStack(alignment: .bottom, spacing: 2) {
            VStack {
                VStack(spacing: 2) {
                    Text("\(value)")
                        .font(.system(size: 11))
                        .foregroundColor(Color(.gray))
                    Capsule()
                        .frame(width: 12, height: CGFloat(value) * 20.0 )
                        .foregroundColor(Color("barChart"))
                }
                
                Text("\(day)/\(month)")
                    .font(.system(size: 10))
                    .rotationEffect(.degrees(-30))
                    .foregroundColor(.gray)
                    .padding(.top, 0)

            }
        }
        .padding(.top, 10)
    }
}
