//
//  MonsterView.swift
//  RunAway
//
//  Created by KoJeongseok on 2022/05/03.
//

import SwiftUI

struct MonsterView: View {
    @Binding var goalSteps: Int
    @Binding var humanSteps: Int
    @Binding var monsterSteps: Int
    @Binding var dayTime: Bool
    @Binding var gameOver: Bool
    //    @State var backGround = "Hday"
    
    func dayBackgroundImage() -> String {
        if dayTime {
            return "Hday"
        } else {
            return "Night"
        }
    }
    
    func FaceImage() -> String {
        if dayTime {
            return "Msleep"
        } else {
            if humanSteps <= monsterSteps {
                return Night.die.mImageName
            } else if monsterSteps < goalSteps / 10 {
                return Night.low.mImageName
            } else if monsterSteps < goalSteps / 2 {
                return Night.mid.mImageName
            } else if monsterSteps < goalSteps {
                return Night.high.mImageName
            } else if monsterSteps == goalSteps && monsterSteps < humanSteps {
                return Night.survive.mImageName
            } else {
                return Night.mid.mImageName
            }
        }
    }
    
    func mText() -> String {
        if dayTime {
            return "ZZzzz"
        } else {
            if humanSteps <= monsterSteps {
                return Night.die.mText
            } else if monsterSteps < goalSteps / 10 {
                return Night.low.mText
            } else if monsterSteps < goalSteps / 2 {
                return Night.mid.mText
            } else if monsterSteps < goalSteps {
                return Night.high.mText
            } else if monsterSteps == goalSteps && monsterSteps < humanSteps {
                return Night.survive.mText
            } else {
                return Night.mid.mText
            }
        }
    }
    
    var body: some View {
        ZStack {
            
            Image(dayBackgroundImage())
                .resizable()
                .ignoresSafeArea()
            VStack {
                if dayTime {
                    Text("DAY 8")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                } else {
                    
                    Text("DAY 8")
                        .foregroundColor(Color("Mred"))
                        .font(.largeTitle)
                        .bold()
                        .padding()
                }
                Image(FaceImage())
                    .resizable()
                    .frame(width: 350, height: 350)
                    .shadow(radius: 10)
                    .padding(30)
                
                Text(mText())
                    .font(.largeTitle)
                    .bold()
                HStack {
                    if dayTime {
                        Text("\(monsterSteps) / \(humanSteps)")
                            .font(.largeTitle)
                            .bold()
                    } else {
                        Text("\(monsterSteps) / \(humanSteps)")
                            .foregroundColor(Color("Mred"))
                            .font(.largeTitle)
                            .bold()
                    }
                    Button(action: {
                        monsterSteps += 500
                    }, label: {
                        if dayTime {
                            Image("Mstep2")
                        } else {
                            Image("Mstep")
                        }
                    })
                }
                .padding()
            }
        }
        
    }
}

//struct MonsterView_Previews: PreviewProvider {
//    static var previews: some View {
//        MonsterView()
//    }
//}
