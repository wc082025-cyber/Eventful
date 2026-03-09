//
//  ContentView.swift
//  Eventful
//
//  Created by Chris Wahlberg on 03/03/2026.
//

import SwiftUI
import Foundation



struct ContentView: View {
    
  
    
    var body: some View {
        
        
        
        NavigationStack {
            
            ZStack() {
                Image("fish1")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .blur(radius: 5.0)
               // Color.mint.opacity(0.5)
                 // .ignoresSafeArea()
                
                VStack{
                HStack{
                    //Spacer()
                        NavigationLink(destination: Settings()) {
                            
                            
                            Image(systemName: "gear")
                                .foregroundStyle(Color.black.opacity(0.8))
                                .font(.custom("MarkerFelt-Thin", size: 30))
                                .frame(width: 65, height: 65)
                                .glassEffect(.clear.tint(.mint.opacity(0.5)).interactive())
                                .position(x: 370, y: 10)
                                .padding(.leading, 300)
                                
                                
                        }
                      
                    }
                    
                }
                
                
                HStack {
                    
                    VStack {
                        
               Spacer()
                        
                        Text("Eventful")
                            .foregroundStyle(Color.black.opacity(0.7))
                            .font(.custom("MarkerFelt-Thin", size: 50))
                         
                          //  .fontWeight(.bold)
                            .frame(width: 350, height: 90)
                            .glassEffect(.clear.tint(.teal.opacity(0.5)))
                           
                        
                            .padding()
                        
                        Spacer()
                        
                        NavigationLink(destination: CreateEventView()) {
                            
                            
                            Text("CREATE EVENT")
                                .foregroundStyle(Color.black.opacity(0.8))
                                .font(.custom("MarkerFelt-Thin", size: 30))
                                .frame(width: 300, height: 65)
                                .glassEffect(.clear.tint(.mint.opacity(0.5)).interactive())
                            
                                .padding()
                        }
                      
                        
                       NavigationLink(destination: MyEvents()) {
                            Text("My events")
                                .foregroundStyle(Color.black.opacity(0.8))
                                .font(.custom("MarkerFelt-Thin", size: 30))
                                .frame(width: 300, height: 65)
                                .glassEffect(.clear.tint(.mint.opacity(0.5)).interactive())
                            
                                .padding()
                            
                        }
                        Spacer()
                        
                    } // Vstack 1
                    
                    .padding()
                    
                } // HStack 1
                
            }// ZStack 1
            
        } // NavigationStack
        
    }
}

#Preview {
    ContentView()
}
