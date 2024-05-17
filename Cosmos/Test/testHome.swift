//
//  testHome.swift
//  Cosmos
//
//  Created by 😏 😏 on 22/10/2022.
//

import SwiftUI

struct testHome: View {
    var body: some View {
        NavigationView{
        ZStack(alignment: .topLeading){
            Rectangle()
                .fill(Color("testBg"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading){
            
            Image("testHeader")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 220)
                .edgesIgnoringSafeArea(.all)
                .padding(.bottom, -130)
                
            ScrollView{
                VStack{
                    
                HStack{
                    Spacer()
                    NavigationLink{
                        LDQ_test()
                    } label: {
                            LDQ_Button()
                        }
                    .padding(.bottom, 4 )
                    Spacer()
                    NavigationLink{
                        CAS_test()
                    } label: {
                            CAS_Button()
                    }
                    .padding(.bottom, 4 )
                    Spacer()
                }.padding()
                
                HStack{
                    Spacer()
                    NavigationLink{
                        HAI_test()
                    } label: {
                            HAI_Button()
                        }
                    .padding(.bottom, 4 )
                    Spacer()
                    NavigationLink{
                        AAI_test()
                    } label: {
                            AAI_Button()
                    }
                    .padding(.bottom, 4 )
                    Spacer()
                }.padding()
                
                
                HStack{
                    Spacer()
                    NavigationLink{
                        MDQ_test()
                    } label: {
                            MDQ_Button()
                        }
                    .padding(.bottom, 4 )
                    Spacer()
                    NavigationLink{
                        CUDOS_test()
                    } label: {
                            CUDOS_Button()
                    }
                    .padding(.bottom, 4 )
                    Spacer()
                }.padding()
                
                HStack{
                    Spacer()
                    NavigationLink{
                        DES_test()
                    } label: {
                        DES_Button()
                    }
                    .padding(.bottom, 4 )
                    Spacer()
                    NavigationLink{
                        ED15_test()
                    } label: {
                        ED15_Button()
                    }
                    .padding(.bottom, 4 )
                    Spacer()
                }.padding()
                    
                HStack{
                    Spacer()
                    NavigationLink{
                        HRS_test()
                    } label: {
                        HRS_Button()
                    }
                    .padding(.bottom, 4 )
                    Spacer()
                    NavigationLink{
                        CPAQ_test()
                    } label: {
                        CPAQ_Button()
                    }
                    .padding(.bottom, 4 )
                    Spacer()
                }.padding()
                
                HStack{
                    Spacer()
                    NavigationLink{
                        IPS_test()
                    } label: {
                        IPS_Button()
                    }
                    .padding(.bottom, 4 )
                    Spacer()
                    NavigationLink{
                        ESS_test()
                    } label: {
                        ESS_Button()
                    }
                    .padding(.bottom, 4 )
                    Spacer()
                }.padding()
                    
                }
                }
               
                VStack{
                    Text("")
                }
        }
            
        }
    }
}
}
