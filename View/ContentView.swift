//
//  ContentView.swift
//  RunAway
//
//  Created by KoJeongseok on 2022/04/28.
//

import SwiftUI

struct ContentView: View {
    
    @State var goalSteps = 2000
    @State var day = 0
    @State var humanSteps = 0
    @State var monsterSteps = 0
    @State var dayTime = true
    @State var gameOver = false
    @State var isGoalStep = false
    
    
    var body: some View {
        
        ZStack {
            
            TabView {
                HumanView(goalSteps: $goalSteps, humanSteps: $humanSteps, monsterSteps: $monsterSteps, dayTime: $dayTime, gameOver: $gameOver, day: $day)
                
                
                    .tabItem {
                        Text("ME")
                        Image(systemName: "face.smiling")
                        
                    }
                
                MonsterView(goalSteps: $goalSteps, humanSteps: $humanSteps, monsterSteps: $monsterSteps, dayTime: $dayTime, gameOver: $gameOver, day: $day)
                    .tabItem {
                        Text("MONSTER")
                        Image(systemName: "eye")
                    }
            }
//            .accentColor(tabItemColor())
            

            HStack {
                Spacer()
                VStack {
                    
                    Button(action: {
                        dayTime.toggle()
                        
                        if dayTime {
                            monsterSteps = 0
                            humanSteps = 0
                            if !gameOver {
                                day += 1
                            }
                            
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
            if dayTime {
                if gameOver || !isGoalStep {
                    CreateView(goalSteps: $goalSteps, gameOver: $gameOver, isGoalStep: $isGoalStep, day: $day)
                }
            }
            
            
        }
        
    }
}


extension ContentView {
    func tabItemColor() -> Color {
        if dayTime {
            return Color.black
        } else {
            return Color.white
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
