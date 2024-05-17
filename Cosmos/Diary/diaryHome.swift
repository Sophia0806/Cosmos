import SwiftUI

struct diaryHome: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: Diary.entity(), sortDescriptors: [])
    var diarys: FetchedResults<Diary>
    
    @State var future = false
    @State var selectedDate = Date()
    @State var dateInDatepicker = Date()
    
    @Binding var user : Account
    
    @Binding var existDiary : Bool
    @Binding var mood : String
    @Binding var weather : String
    @Binding var content : String
    
    @Environment(\.calendar) var calendar
    private var year: DateInterval {
        calendar.dateInterval(of: .month, for: Date())!
    }
    
    var body: some View {
        NavigationView{
        ZStack(alignment: .topLeading){
           Image("diary_bg")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
            ScrollView(){
            CalendarView(interval: self.year) { date in
                if(selectedDate == date){
                    if(calendar.isDateInToday(date)){
                        Image("diary_today")
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 50.0, height: 50.0)
                            .overlay(
                                Text(String(self.calendar.component(.day, from: date)))
                                    .foregroundColor(Color.black)
                                    .font(Font.system(size: 20).bold())
                            )
                    }
                    else if(date < Date()){
                        Image("diary")
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 50.0, height: 50.0)
                            .overlay(
                                Text(String(self.calendar.component(.day, from: date)))
                                    .foregroundColor(Color.black)
                                    .font(Font.system(size: 20).bold())
                            )
                    }
                    else{
                        Image("diary")
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 50.0, height: 50.0)
                            .overlay(
                                Text(String(self.calendar.component(.day, from: date)))
                                    .foregroundColor(Color.gray)
                                    .font(Font.system(size: 20).bold())
                            )
                    }
                }
                else{
                if(calendar.isDateInToday(date)){
                    Image("diary_today")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 50.0, height: 50.0)
                        .overlay(
                            Text(String(self.calendar.component(.day, from: date)))
                                .foregroundColor(Color.black)
                                .onTapGesture {
                                    future = false
                                    selectedDate = date
                                    dateInDatepicker = date
                                    checkDiary()
                                    })
                }
                else if (date > Date()){
                    Image("diary")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 50.0, height: 50.0)
                        .overlay(
                            Text(String(self.calendar.component(.day, from: date)))
                                .foregroundColor(Color.gray)
                                .onTapGesture {
                                    future = true
                                    selectedDate = date
                                    dateInDatepicker  = Date()
                                    })
                }
                else{
                    Image("diary")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 50.0, height: 50.0)
                        .overlay(
                            Text(String(self.calendar.component(.day, from: date)))
                                .foregroundColor(Color.black)
                                .onTapGesture {
                                    future = false
                                    selectedDate = date
                                    dateInDatepicker = date
                                    checkDiary()
                                })
                }
                }
            }
                
            Text(String(self.calendar.component(.day, from: selectedDate)) + "/" + String(self.calendar.component(.month, from: selectedDate)) + "/" + String(self.calendar.component(.year, from: selectedDate)))
                    .foregroundColor(Color("diary_title"))
                    .font(.system(size: 23, design: .serif)
                            .weight(.semibold))
                
            if(future){
                Text("Day in future!")
                    .padding()
            }
            else{
                if(existDiary){
                    HStack{
                        Spacer()
                        Image(mood)
                            .resizable()
                            .frame(width: 50.0, height: 50.0)
                            .padding()
                        Spacer()
                        Image(weather)
                            .resizable()
                            .frame(width: 45.0, height: 45.0)
                            .padding()
                        Spacer()
                    }
                    
                    VStack(alignment: .leading){
                        Text(content)
                            .multilineTextAlignment(.leading)
                            .frame(alignment: .topLeading)
                            .padding([.leading, .trailing], 10)
                            .padding(.bottom)
                    }.frame(maxWidth: 300, alignment: .leading)
                    
                }
                else{
                    Text("No diary on that day!")
                        .padding()
                }
                
            }
            }
            NavigationLink{
                writeDiary(user: self.$user, existDiary: $existDiary, mood: $mood, weather: $weather, content: $content, date: $dateInDatepicker)
            } label: {
                Image(systemName: "plus.app")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray)
                }
        }
    }.navigationBarHidden(true)
    }.navigationViewStyle(.stack)
    }
    
    func checkDiary()-> Bool{
        for diary in diarys {
            if diary.writeBy == user{
                if(diary.day == self.calendar.component(.day, from: selectedDate) && diary.month == self.calendar.component(.month, from: selectedDate) && diary.year == self.calendar.component(.year, from: selectedDate)){
                    mood = diary.mood!
                    weather = diary.weather!
                    content = diary.content!
                    existDiary = true
                    return true
                }
            }
        }
        mood = "happy"
        weather = "sun"
        content = ""
        existDiary = false
        return false
    }
}


fileprivate extension DateFormatter {
    static var month: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter
    }

    static var monthAndYear: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
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

struct WeekView<DateView>: View where DateView: View {
    @Environment(\.calendar) var calendar

    let week: Date
    let content: (Date) -> DateView

    init(week: Date, @ViewBuilder content: @escaping (Date) -> DateView) {
        self.week = week
        self.content = content
    }

    private var days: [Date] {
        guard
            let weekInterval = calendar.dateInterval(of: .weekOfYear, for: week)
            else { return [] }
        return calendar.generateDates(
            inside: weekInterval,
            matching: DateComponents(hour: 0, minute: 0, second: 0)
        )
    }

    var body: some View {
        HStack {
            ForEach(days, id: \.self) { date in
                HStack {
                    if self.calendar.isDate(self.week, equalTo: date, toGranularity: .month) {
                        self.content(date)
                    } else {
                        self.content(date).hidden()
                    }
                }
            }
        }
    }
}

struct MonthView<DateView>: View where DateView: View {
    @Environment(\.calendar) var calendar

    @State private var month: Date
    let showHeader: Bool
    let content: (Date) -> DateView

    init(
        month: Date,
        showHeader: Bool = true,
        localizedWeekdays: [String] = [],
        @ViewBuilder content: @escaping (Date) -> DateView
    ) {
        self._month = State(initialValue: month)
        self.content = content
        self.showHeader = showHeader
    }

    private var weeks: [Date] {
        guard
            let monthInterval = calendar.dateInterval(of: .month, for: month)
            else { return [] }
        return calendar.generateDates(
            inside: monthInterval,
            matching: DateComponents(hour: 0, minute: 0, second: 0, weekday: calendar.firstWeekday)
        )
    }
    
    func changeDateBy(_ months: Int) {
        if let date = Calendar.current.date(byAdding: .month, value: months, to: month) {
            self.month = date
        }
    }

    private var header: some View {
        let component = calendar.component(.month, from: month)
        let formatter = component == 1 ? DateFormatter.monthAndYear : .month
        return HStack{
            Text(formatter.string(from: month))
                .font(.title)
                .padding(.horizontal)
                .padding([.leading, .trailing], 4)
            Spacer()
            HStack{
                Group{
                    Button(action: {
                        self.changeDateBy(-1)
                    }) {
                    Image(systemName: "chevron.left.square") 
                        .resizable()
                    }
                    Button(action: {
                        self.month = Date()
                    }) {
                    Image(systemName: "dot.square")
                        .resizable()
                    }
                    Button(action: {
                        self.changeDateBy(1)
                    }) {
                    Image(systemName: "chevron.right.square")
                        .resizable()
                    }
                }
                .foregroundColor(Color.gray)
                .frame(width: 25, height: 25)
            }
            .padding(.trailing, 10)
        }
    }
   
    var body: some View {
        VStack {
            if showHeader {
                    header
            }
            HStack{
                ForEach(0..<7, id: \.self) {index in
                    Text("30")
                        .hidden()
                        .padding(8)
                        .clipShape(Circle())
                        .padding(.horizontal, 5)
                        .overlay(
                            Text(getWeekDaysSorted()[index].uppercased()))
                }
            }
            
            ForEach(weeks, id: \.self) { week in
                WeekView(week: week, content: self.content)
            }
        }
    }
    
    func getWeekDaysSorted() -> [String]{
        let weekDays = Calendar.current.shortWeekdaySymbols
        let sortedWeekDays = Array(weekDays[Calendar.current.firstWeekday - 1 ..< Calendar.current.shortWeekdaySymbols.count] + weekDays[0 ..< Calendar.current.firstWeekday - 1])
        return sortedWeekDays
    }
}

struct CalendarView<DateView>: View where DateView: View {
    @Environment(\.calendar) var calendar

    let interval: DateInterval
    let content: (Date) -> DateView

    init(interval: DateInterval, @ViewBuilder content: @escaping (Date) -> DateView) {
        self.interval = interval
        self.content = content
    }

    private var months: [Date] {
        calendar.generateDates(
            inside: interval,
            matching: DateComponents(day: 1, hour: 0, minute: 0, second: 0)
        )
    }

    var body: some View {
   
            ForEach(months, id: \.self) { month in
                MonthView(month: month, content: self.content)
            }

    }
}
