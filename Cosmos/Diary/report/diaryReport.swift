//
//  diaryReport.swift
//  Cosmos
//
//  Created by 😏 😏 on 24/2/2023.
//

import SwiftUI

struct dayData{
    var day : Int32
    var mood : String
    var score : Int
}

struct diaryReport: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.calendar) var calendar
    @EnvironmentObject var responsedata: ResponseData
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: Diary.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Diary.day, ascending: true)])
    var diarys: FetchedResults<Diary>
    
    @Binding var user : Account
    @State var selectedYear = 2023
    @State var selectedMonth = 0
    @State var months : [String] = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    @State var monthData : [dayData] = []
    @State var count = 0
    @State var monthScore = 0.0
    @State var scores : [Int] = []
    @State var days : [Int] = []
    @State var sentiments : [Int] = []
    @State var sentiment_result = 0
    @State var isShow = false
    
    @State var dataPie : [Double] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,]
    var colors : [Color] = [Color("cry"), Color("sad"), Color("angry"), Color("ill"), Color("tired"), Color("worried"), Color("shocked"), Color("normal"), Color("relaxed"), Color("heartbeat"), Color("happy"), Color("excited")]
    @State var labels = ["cry", "sad", "angry", "ill", "tired", "worried", "shocked", "normal", "relaxed", "heartbeat", "happy", "excited"]
    
    var body: some View {
        NavigationView{
        ZStack(alignment: .topLeading){
            Rectangle()
                .fill(Color("diaryReport"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                
            VStack{
                HStack{
                    Button(action: {self.presentationMode.wrappedValue.dismiss()
                    }, label:{
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.gray)
                    
                    }).padding()
                    Spacer()
                }.padding(.bottom, -40)
                
                HStack{
                    Spacer()
                    Button(action: {
                        selectedYear -= 1
                        selectedMonth = 0
                    }) {
                    Image(systemName: "chevron.left.square")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 25, height: 25)
                    }.padding()
                    
                    Text(String(selectedYear))
                        .font(.system(size: 25, design: .serif)
                                .weight(.light))
                        .padding()
                        .onTapGesture{
                            selectedYear = 2023
                            selectedMonth = 0
                        }
                    
                    Button(action: {
                        selectedYear += 1
                        selectedMonth = 0
                    }) {
                    Image(systemName: "chevron.right.square")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 25, height: 25)
                    }.padding()
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    ForEach(0..<6){ i in
                        if(selectedMonth == i+1){
                            Text(months[i])
                                .font(.system(size: 20, design: .serif))
                                .padding(.trailing, 8)
                                .foregroundColor(.black)
                        }
                        else{
                            Text(months[i])
                                .font(.system(size: 20, design: .serif))
                                .padding(.trailing, 8)
                                .foregroundColor(.gray)
                                .onTapGesture{
                                    selectedMonth = i+1
                                    isShow = false
                                    readData()
                                }
                        }
                    }
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    ForEach(6..<12){ i in
                        if(selectedMonth == i+1){
                            Text(months[i])
                                .font(.system(size: 20, design: .serif))
                                .padding(.trailing, 8)
                                .foregroundColor(.black)
                        }
                        else{
                            Text(months[i])
                                .font(.system(size: 20, design: .serif))
                                .padding(.trailing, 8)
                                .foregroundColor(.gray)
                                .onTapGesture{
                                    selectedMonth = i+1
                                    isShow = false
                                    readData()
                                }
                        }
                    }
                    Spacer()
                }
               
                ScrollView{
                if(self.calendar.component(.year, from: Date()) < selectedYear){
                    Text("Month in future")
                        .padding()
                }
                else if(self.calendar.component(.year, from: Date()) == selectedYear && self.calendar.component(.month, from: Date()) < selectedMonth){
                    Text("Month in future")
                        .padding()
                }
                else if(selectedMonth > 0){
                    HStack{
                        Spacer()
                        VStack{
                            Text("Diary Count")
                                .font(.system(size: 18, design: .serif))
                                .padding()
                            Text(String(count))
                                .font(.system(size: 23, design: .serif)
                                        .weight(.semibold))
                        }
                        .padding()
                        Spacer()
                        VStack{
                            Text("Emotion Score")
                                .font(.system(size: 18, design: .serif))
                                .padding()
                            if(count != 0){
                                Text(String(format:"%.2f", monthScore))
                                    .font(.system(size: 23, design: .serif)
                                        .weight(.semibold))
                            }
                            else{
                                Text("No record")
                                    .font(.system(size: 22, design: .serif)
                                        .weight(.semibold))
                            }
                        }
                        .padding()
                        Spacer()
                    }
                }
                    //graphs
                    if(count != 0){
                    if((selectedMonth > 0 && selectedYear < 2023) || (selectedMonth > 0 && selectedMonth <= self.calendar.component(.month, from: Date()) && selectedYear == 2023)){
                        
                        Image("analysis")
                            .resizable()
                            .padding()
                            .frame(width: 80.0, height: 80.0)
                            .onTapGesture{
                                if(!isShow){
                                    sentiment_analysis()
                                }
                                isShow.toggle()
                            }
                        
                        if(isShow){
                            if(sentiment_result == 1){
                                Text("You are in a positive mood this month. Keep it up :)")
                                    .padding([.leading, .trailing], 13)
                                    .padding(.bottom)
                                    .padding()
                            }
                            else if(sentiment_result == -1){
                                Text("You are in a negtive mood this month. Try to smile more and find some help from Cosmos.")
                                    .padding([.leading, .trailing], 13)
                                    .padding(.bottom)
                                    .padding()
                            }
                            else{
                                Text("You are in a neutral mood this month :|")
                                    .padding([.leading, .trailing], 13)
                                    .padding(.bottom)
                                    .padding()
                            }
                        }
                        
                        Text("Emotion Line Graph")
                            .font(.system(size: 15, design: .serif))
                        lineChart(data: scores, days: days, month: selectedMonth)
                    
                        Text("Emotion Ratio Graph")
                            .font(.system(size: 15, design: .serif))
                            .padding(.top, 20)
                            .padding()
                        pieChart.init(data: $dataPie, labels: $labels, colors: colors, borderColor: Color.white, count: count)
                        
                        Text("Emotion Bar Chart")
                            .font(.system(size: 15, design: .serif))
                            .padding(.top, 20)
                            .padding()
                        barChart(data: scores, days: days, month: selectedMonth)
                        
                        Text("")
                            .padding()
                    }
                    }
                }
                Text("")
            }
            
        }.navigationBarHidden(true)
        
    }.navigationBarHidden(true)
    }
    
    func sentiment_analysis() -> Bool{
        var pos_count = 0
        var neg_count = 0
        var net_count = 0
        sentiment_result = 0
        sentiments = []
        
        for diary in diarys {
            if diary.writeBy == user{
                if(diary.month == selectedMonth && diary.year == selectedYear){
                    sentiments.append(responsedata.API(content:diary.content!))
                }
            }
        }
        //print(sentiments)
        for sentiment in sentiments{
            if(sentiment == 1){
                pos_count += 1
            }
            else if (sentiment == -1){
                neg_count += 1
            }
            else{
                net_count += 1
            }
        }
        if(pos_count > neg_count && pos_count >= net_count ){
            sentiment_result = 1
        }
        else if(neg_count > pos_count && neg_count >= net_count){
            sentiment_result = -1
        }
        //print(sentiment_result)
        
        return true
    }
    
    func readData() -> Bool{
        count = 0
        monthData = []
        monthScore = 0.0
        scores = []
        days = []
        dataPie = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,]
        for diary in diarys {
            if diary.writeBy == user{
                if(diary.month == selectedMonth && diary.year == selectedYear){
                    let score = moodScore(mood: diary.mood!)
                    let data = dayData(day: diary.day, mood: diary.mood!, score: score)
                    monthData.append(data)
                    scores.append(score)
                    days.append(Int(diary.day))
                    count += 1
                    for i in 0...11{
                        if(diary.mood == labels[i]){
                            dataPie[i] += 1.0
                        }
                    }
                }
            }
        }
        
        if(count != 0){
            monthScore /= Double(count)
        }
        //print("Month data!")
        //print(monthData)
        //print(count)
        return true
    }
    
    func moodScore(mood: String)->Int{
        var score = 0
        if(mood == "sad"){
            score = 1
        }
        else if(mood == "angry"){
            score = 2
        }
        else if(mood == "ill" || mood == "tired"){
            score = 3
        }
        else if(mood == "worried"){
            score = 4
        }
        else if(mood == "shocked"){
            score = 5
        }
        else if(mood == "normal"){
            score = 6
        }
        else if(mood == "relaxed"){
            score = 7
        }
        else if(mood == "heartbeat"){
            score = 8
        }
        else if(mood == "happy"){
            score = 9
        }
        else if(mood == "excited"){
            score = 10
        }
        monthScore += Double(score)
        //print(mood)
        //print(score)
        return score
    }
}

fileprivate extension Calendar {
    func generateDates(
        inside interval: DateInterval,
        matching components: DateComponents
    ) -> [Date] {
        var dates: [Date] = []
        dates.append(interval.start)

        enumerateDates(
            startingAfter: interval.start,
            matching: components,
            matchingPolicy: .nextTime
        ) { date, _, stop in
            if let date = date {
                if date < interval.end {
                    dates.append(date)
                } else {
                    stop = true
                }
            }
        }

        return dates
    }
}
