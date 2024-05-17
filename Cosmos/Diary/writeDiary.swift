//
//  writeDiary.swift
//  Cosmos
//
//  Created by 😏 😏 on 21/2/2023.
//

import SwiftUI

struct writeDiary: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.calendar) var calendar
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: Diary.entity(), sortDescriptors: [])
    var diarys: FetchedResults<Diary>
    
    @Binding var user : Account
    @Binding var existDiary : Bool
    @Binding var mood : String
    @Binding var weather : String
    @Binding var content : String
    @Binding var date : Date

    @State var updateDiary = false
    @State var exitAlert = false
    @State var showMood = false
    @State var showWeather = false
    
    
    var body: some View {
    NavigationView{
        ZStack(alignment: .topLeading){
           Image("diary_bg")
                .resizable()
                .edgesIgnoringSafeArea(.all)
        VStack(alignment: .leading){
            
            HStack{
            Button(action: {
                    exitAlert = true
            }, label:{
                    Image("diary_cancel")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 45, height: 45)
            }).padding()
                .alert(isPresented: $exitAlert) {
                    Alert(
                        title: Text("Are you sure to exit?"),
                        message: Text("The content will not be saved if you exit."),
                        primaryButton: .default(
                                Text("Yes"),
                                action: {self.presentationMode.wrappedValue.dismiss()}),
                        secondaryButton: .destructive(
                            Text("Cancel"),
                            action: {
                                exitAlert = false
                            })
                        )
                }
                Spacer()
                
                Button(action:{
                    if(!existDiary){
                        saveDiary()
                    }
                    if(existDiary && updateDiary){
                        updateD()
                    }
                },label:{
                    Image("diary_write")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 45, height: 45)
                }).padding()
            }
    
            ScrollView{
                if(calendar.isDateInToday(date)){
                    Text("How do you feel today?")
                        .font(.system(size: 23, design: .serif)
                                .weight(.semibold))
                        .foregroundColor(Color("diary_title"))
                }
                else{
                    Text("How did you feel on that day?")
                        .font(.system(size: 23, design: .serif)
                                .weight(.semibold))
                        .foregroundColor(Color("diary_title"))
                }
                DatePicker("", selection: $date, in: ...Date(),displayedComponents: [.date])
                    .clipped()
                    .labelsHidden()
                    .onChange(of: self.date, perform: {(value) in
                        checkDiary()
                    })
                
                HStack{
                    Spacer()
                    Image(mood)
                        .resizable()
                        .frame(width: 60.0, height: 60.0)
                        .padding()
                        .onTapGesture {
                            showMood.toggle()
                        }
                        .sheet(isPresented: $showMood, content: {
                            changeMood(selectedMood: $mood)
                        })
                    Spacer()
                    Image(weather)
                        .resizable()
                        .frame(width: 55.0, height: 55.0)
                        .padding()
                        .onTapGesture {
                            showWeather.toggle()
                        }
                        .sheet(isPresented: $showWeather, content: {
                            changeWeather(selectedWeather: $weather)
                        })
                    Spacer()
                }
                
                if(!existDiary){
                    
                    Text("No diary yet.")
                        .frame(width: 330)
                    
                    TextEditor(text: $content)
                        .foregroundColor(.black)
                        .cornerRadius(5)
                        .frame(width: 300, height: 500, alignment: .top)
                        .padding(.bottom,20)
                        .autocapitalization(.none)
                        .onAppear(){
                            UITextView.appearance().backgroundColor = .clear
                        }
                        .background(Color("diary_text"))
                }
                if(existDiary && !updateDiary){
                    VStack(alignment: .leading){
                        Text(content)
                            .multilineTextAlignment(.leading)
                            .frame(alignment: .topLeading)
                            .padding([.leading, .trailing], 10)
                            .padding(.bottom)
                    }.frame(maxWidth: 350, alignment: .leading)
                    
                    HStack{
                        Spacer()
                        Text("Edit")
                            .foregroundColor(.gray)
                            .onTapGesture {
                                updateDiary = true
                            }
                        Spacer()
                        Text("Delete")
                            .foregroundColor(.gray)
                            .onTapGesture {
                                deleteD()
                            }
                        Spacer()
                    }
                    
                    VStack(alignment: .leading){
                        sentimentAnalysis(content: content)
                    }
                }
                if(existDiary && updateDiary){
                    TextEditor(text: $content)
                        .foregroundColor(.black)
                        .cornerRadius(5)
                        .frame(width: 300, height: 500, alignment: .top)
                        .padding(.bottom,20)
                        .autocapitalization(.none)
                        .onAppear(){
                            UITextView.appearance().backgroundColor = .clear
                        }
                        .background(Color("diary_text"))
                }
                }
            
            Text("")
        }
        }.navigationBarHidden(true)
    }.navigationBarHidden(true)
    }
    
    func checkDiary()-> Bool{
        for diary in diarys {
            if diary.writeBy == user{
                if(diary.day == self.calendar.component(.day, from: date) && diary.month == self.calendar.component(.month, from: date) && diary.year == self.calendar.component(.year, from: date)){
                    mood = diary.mood!
                    weather = diary.weather!
                    content = diary.content!
                    existDiary = true
                    updateDiary = false
                    return true
                }
            }
        }
        mood = "happy"
        weather = "sun"
        content = ""
        existDiary = false
        updateDiary = false
        return false
    }
    
    func saveDiary() -> Bool{
        let newDiary = Diary(context: viewContext)
        newDiary.id = UUID()
        newDiary.content = content
        newDiary.mood = mood
        newDiary.weather = weather
        newDiary.day = Int32(self.calendar.component(.day, from: date))
        newDiary.month = Int32(self.calendar.component(.month, from: date))
        newDiary.year = Int32(self.calendar.component(.year, from: date))
        user.addToWriteDiary(newDiary)
        do {
            try viewContext.save()
            existDiary = true
            return true
        } catch {
            let nsError = error as NSError
        }
        return true
    }
    
    func updateD() -> Bool{
        for diary in diarys {
            if diary.writeBy == user{
                if(diary.day == self.calendar.component(.day, from: date) && diary.month == self.calendar.component(.month, from: date) && diary.year == self.calendar.component(.year, from: date)){
                    diary.mood = mood
                    diary.weather = weather
                    diary.content = content
                    do {
                        try viewContext.save()
                        updateDiary = false
                        return true
                    } catch {
                        let nsError = error as NSError
                    }
                }
            }
        }
        return true
    }
    
    func deleteD() -> Bool{
        for diary in diarys {
            if diary.writeBy == user{
                if(diary.day == self.calendar.component(.day, from: date) && diary.month == self.calendar.component(.month, from: date) && diary.year == self.calendar.component(.year, from: date)){
                    user.removeFromWriteDiary(diary)
                    viewContext.delete(diary)
                    do {
                        try viewContext.save()
                        existDiary = false
                        mood = "happy"
                        weather = "sun"
                        content = ""
                        return true
                    } catch {
                        let nsError = error as NSError
                    }
                }
            }
        }
        return true
    }

}


