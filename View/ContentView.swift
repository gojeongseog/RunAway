//
//  ContentView.swift
//  RunAway
//
//  Created by KoJeongseok on 2022/04/28.
//

import SwiftUI

struct ContentView: View {
    
    init() {
            UITabBar.appearance().barTintColor = UIColor.blue
            UITabBar.appearance().tintColor = .green
        }
    
    @State var goalSteps = 5000
    
    @State var humanSteps = 0
    @State var monsterSteps = 0
//    @Binding var star: Date
//    @Binding var today: Date
    @State var dayTime = true
    @State var gameOver = false
    @State var isGoalStep = false
    
    
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
            .font(.headline)
            .accentColor(.white)
                
            
            
            HStack {
                Spacer()
                VStack {
                    
                    Button(action: {
                        dayTime.toggle()
                        
                        if dayTime {
                            monsterSteps = 0
                            humanSteps = 0
                        }
                        
                    }, label: {
                        
                        if dayTime {
                           // monsterSteps = 0
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
            
            if gameOver || !isGoalStep {
                CreateView(goalSteps: $goalSteps, gameOver: $gameOver, isGoalStep: $isGoalStep)
            }
        }
        
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
