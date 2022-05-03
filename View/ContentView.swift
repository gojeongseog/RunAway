//
//  ContentView.swift
//  RunAway
//
//  Created by KoJeongseok on 2022/04/28.
//

import SwiftUI

struct ContentView: View {
    
    @State var goalSteps = 10000
    @State var humanSteps = 0
    @State var monsterSteps = 0
//    @Binding var star: Date
//    @Binding var today: Date
    @State var dayTime = true
    @State var gameOver = false
    
    
    var body: some View {
        
        ZStack {
            
            TabView {
                HumanView(goalSteps: $goalSteps, humanSteps: $humanSteps, monsterSteps: $monsterSteps, dayTime: $dayTime, gameOver: $gameOver)
                
                
                    .tabItem {
                        Text("me")
                        Image(systemName: "face.smiling")
                        
                    }
                
                MonsterView(goalSteps: $goalSteps, humanSteps: $humanSteps, monsterSteps: $monsterSteps, dayTime: $dayTime, gameOver: $gameOver)
                    .tabItem {
                        Text("monster")
                        Image(systemName: "eye")
                    }
            }
            
            
            HStack {
                Spacer()
                VStack {
                    
                    Button(action: {
                        dayTime.toggle()
                    }, label: {
                        
                        if dayTime {
                            Image("sun")
                                .resizable().frame(width: 50, height: 50)

                                .padding()
                        } else {
                            Image("moon")
                                .resizable().frame(width: 40, height: 50)
                                .padding()
                        }
                            
                        
                    })
                    Spacer()
                }
            }
            
            
        }
        
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



class User: ObservableObject {
    @Published var step = 0
    @Published var index = 0
}
