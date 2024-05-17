//
//  changePortrait.swift
//  Cosmos
//
//  Created by 😏 😏 on 22/10/2022.
//

import SwiftUI

struct changePortrait: View {
    
    @Binding var user : Account
    @Binding var animalName : String
    @State var showAlert = false;
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        ZStack{
            ScrollView{
                
            Spacer()
                VStack{
                    Text("Change Head Portrait!")
                        .bold()
                        .font(.title)
                        .foregroundColor(.gray)
                }.padding(40)
            
                
                VStack{
            HStack{
                Spacer()
                
                VStack{
                    animalPortrait(imageName: "bear")
                }.padding()
                .onTapGesture {
                    showAlert = true
                    animalName = "bear"
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Change head portarit"),
                        message: Text("Choose ") + Text(animalName) + Text(" as new head portrait."),
                        primaryButton: .default(
                            Text("Yes"),
                            action: {changeAnimal()}
                        ),
                        secondaryButton: .destructive(
                            Text("Cancel"),
                            action: {
                                animalName = ""
                            }
                        )
                    )
                }
                
                Spacer()
                
                VStack{
                    animalPortrait(imageName: "zebra")
                }.padding()
                .onTapGesture {
                    showAlert = true
                    animalName = "zebra"
                }
                
                Spacer()
                
                VStack{
                    animalPortrait(imageName: "tiger")
                }.padding()
                .onTapGesture {
                    showAlert = true
                    animalName = "tiger"
                }
                
                Spacer()
            }
            
            Spacer()
            HStack{
                Spacer()
                
                VStack{
                    animalPortrait(imageName: "cat")
                }.padding()
                .onTapGesture {
                    showAlert = true
                    animalName = "cat"
                }
                
                Spacer()
                
                VStack{
                    animalPortrait(imageName: "leopard")
                }.padding()
                .onTapGesture {
                    showAlert = true
                    animalName = "leopard"
                }
                
                Spacer()
                
                VStack{
                    animalPortrait(imageName: "rhino")
                }.padding()
                .onTapGesture {
                    showAlert = true
                    animalName = "rhino"
                }
                
                Spacer()
            }
            Spacer()
            HStack{
                Spacer()
                
                VStack{
                    animalPortrait(imageName: "wolf")
                }.padding()
                .onTapGesture {
                    showAlert = true
                    animalName = "wolf"
                }
                
                Spacer()
                
                VStack{
                    animalPortrait(imageName: "cheetah")
                }.padding()
                .onTapGesture {
                    showAlert = true
                    animalName = "cheetah"
                }
                
                Spacer()
                
                VStack{
                    animalPortrait(imageName: "monkey")
                }.padding()
                .onTapGesture {
                    showAlert = true
                    animalName = "monkey"
                }
                
                Spacer()
            }
            Spacer()
            HStack{
                Spacer()
                
                VStack{
                    animalPortrait(imageName: "rhinoceros")
                }.padding()
                .onTapGesture {
                    showAlert = true
                    animalName = "rhinoceros"
                }
                
                Spacer()
                
                VStack{
                    animalPortrait(imageName: "squirrel")
                }.padding()
                .onTapGesture {
                    showAlert = true
                    animalName = "squirrel"
                }
                
                Spacer()
                
                VStack{
                    animalPortrait(imageName: "baby")
                }.padding()
                .onTapGesture {
                    showAlert = true
                    animalName = "baby"
                }
                
                Spacer()
            }
                }
        }
        }
    }
    
    func changeAnimal() -> Bool{
        user.animal = animalName
        showAlert = false
        do {
            try viewContext.save()
            return true
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

/*
struct changePortrait_Previews: PreviewProvider {
    static var previews: some View {
        changePortrait()
    }
}

*/
