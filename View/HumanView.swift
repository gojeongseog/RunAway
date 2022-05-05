//
//  HumanView.swift
//  RunAway
//
//  Created by KoJeongseok on 2022/05/03.
//

import SwiftUI

struct HumanView: View {
    @Binding var goalSteps: Int
    @Binding var humanSteps: Int
    @Binding var monsterSteps: Int
    @Binding var dayTime: Bool
    @Binding var gameOver: Bool
    
    func dayBackgroundImage() -> String {
        if dayTime {
            return "Hday"
        } else {
            return "Night"
        }
    }
    
    var body: some View {
        
        ZStack {
            Image(dayBackgroundImage())
                .resizable()
                .ignoresSafeArea()
            VStack {
                Text("DAY 8")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                ZStack {
                    Image(FaceImage())
                        .resizable()
                        .frame(width: 350, height: 350)
                        .shadow(radius: 10)
                    .padding(30)
                    if dayTime {
                        Image("blind")
                            .resizable()
                            .frame(width: 350, height: 350)
                            .opacity(0)
                        .padding(30)
                    } else {
                        Image("blind")
                            .resizable()
                            .frame(width: 350, height: 350)
                            .opacity(0.3)
                            .padding(30)
                    }
                }
                    Text(hText())
                        .font(.largeTitle)
                        .bold()
                    HStack {
                        Text(String(humanSteps))
                            .foregroundColor(Color("Hgreen"))
                            .font(.largeTitle)
                            .bold()
                        Button(action: {
                            humanSteps += 500
                        }, label: {
                            Image("step")
                        })
                    }
                    .padding()
            }
        }
    }
}


extension HumanView {
    
    func FaceImage() -> String {
        if dayTime {
            if humanSteps >= goalSteps {
                return Day.high.hImageName
            } else if humanSteps >= goalSteps / 2 {
                return Day.mid.hImageName
            } else {
                return Day.low.hImageName
            }
        } else {
            
            if humanSteps <= monsterSteps {
                return Night.die.hImageName
            } else if monsterSteps < goalSteps / 10 {
                return Night.low.hImageName
            } else if monsterSteps < goalSteps / 2 {
                return Night.mid.hImageName
            } else if monsterSteps < goalSteps {
                return Night.high.hImageName
            } else if monsterSteps == goalSteps && monsterSteps < humanSteps {
                return Night.survive.hImageName
            } else {
                return Night.mid.hImageName
            }
        }
    }
    
    func hText() -> String {
        if dayTime {
            if humanSteps >= goalSteps {
                return Day.high.hText
            } else if humanSteps >= goalSteps / 2 {
                return Day.mid.hText
            } else {
                return Day.low.hText
            }
        } else {
            if humanSteps <= monsterSteps {
                return Night.die.hText
            } else if monsterSteps < goalSteps / 10 {
                return Night.low.hText
            } else if monsterSteps < goalSteps / 2 {
                return Night.mid.hText
            } else if monsterSteps < goalSteps {
                return Night.high.hText
            } else if monsterSteps == goalSteps && monsterSteps < humanSteps {
                return Night.survive.hText
            } else {
                return Night.mid.hText
            }
        }
    }
}
