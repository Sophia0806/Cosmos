//
//  ContentView.swift
//  Cosmos
//
//  Created by 😏 😏 on 19/10/2022.
//

import SwiftUI
import CoreData


struct ContentView: View{
    
    @State var loginStatus = false
    @State var user = Account()
    
    @State var existDiary = false
    @State var mood = "happy"
    @State var weather = "sun"
    @State var content = ""
    
    var body: some View{
        ZStack{
            if loginStatus{
                Home(user: self.$user,loginStatus: self.$loginStatus, existDiary: self.$existDiary, mood: self.$mood, weather: self.$weather, content: self.$content)
            }
            else{
                LoginAndRegister(user: self.$user, loginStatus: self.$loginStatus, existDiary: self.$existDiary, mood: self.$mood, weather: self.$weather, content: self.$content)
            }
        }
    }
}

struct LoginAndRegister: View{
    @State var isShow = false
    @Binding var user : Account
    @Binding var loginStatus : Bool
    
    @Binding var existDiary : Bool
    @Binding var mood : String
    @Binding var weather : String
    @Binding var content : String
    
    var body: some View{
        NavigationView{
            ZStack{
                NavigationLink(
                    destination: Register(isShow: self.$isShow),
                    isActive: self.$isShow,
                    label: {
                        Text("")
                    }).hidden()
                LoginView(isShow: self.$isShow, loginStatus: self.$loginStatus, user:self.$user, existDiary: self.$existDiary, mood: self.$mood, weather: self.$weather, content: self.$content)
            }
        }
    }
}

/*
struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}

*/


/*struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        Text("Hello World")
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    } label: {
                        Text(item.timestamp!, formatter: itemFormatter)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
*/
