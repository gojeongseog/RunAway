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
    @Binding var day: Int
    //    @State var backGround = "Hday"
    
    func dayBackgroundImage() -> String {
        if dayTime {
            return "Mday"
        } else {
            return "Mnight"
        }
    }
    
    
    
    var body: some View {
        
        ZStack {
            
            Image(dayBackgroundImage())
                .resizable()
                .edgesIgnoringSafeArea(.top)
            
            VStack {
                VStack {
                    
                    if dayTime {
                        Text("DAY \(day)")
                            .font(.largeTitle)
                            .bold()
                            
                    } else {
                        
                        Text("DAY \(day)")
                            .foregroundColor(Color("Mred"))
                            .font(.largeTitle)
                            .bold()
                            
                    }
                    
                    Image(FaceImage())
                        .resizable()
                        .frame(width: 300, height: 300)
                    //                    .shadow(radius: 10)
                        .padding()
                    
                    Spacer()
                    
                    if dayTime {
                        Text(mText())
                            .font(.largeTitle)
                            .bold()
                    } else {
                        Text(mText())
                            .foregroundColor(Color("Mred"))
                            .font(.largeTitle)
                            .bold()
                    }
                    
                }
                
                
                
                ZStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width, height: 250)
                        .foregroundColor(.white)
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                    
                    
                    
                    VStack {
                        Text("MY STEPS : \(humanSteps)")
                            .foregroundColor(Color("Hgreen"))
                            .font(.body)
                            .bold()
                            .padding()
                        
                        if dayTime {
                            Text("MONSTER STEPS : \(monsterSteps)")
                                .font(.system(size: 30))
                                .bold()
                        } else {
                            Text("MONSTER STEPS : \(monsterSteps)")
                                .foregroundColor(Color("Mred"))
                                .font(.system(size: 30))
                                .bold()
                            
                        }
                        
                        
                    }
                }
            }
            HStack {
                VStack {
                    Button(action: {
                        if monsterSteps <= goalSteps - 500 {
                            monsterSteps += 500
                        }
                        
                        if humanSteps == monsterSteps {
                            day = 0
                            gameOver = true
                        }
                    }, label: {
                        if dayTime {
                            Image("Mstep2")
                                .resizable().frame(width: 40, height: 40)
                        } else {
                            Image("Mstep")
                                .resizable().frame(width: 40, height: 40)
                        }
                    })
                    .padding()
                    Spacer()
                }
                Spacer()
            }
        }
    }
}



extension MonsterView {
    
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
    
}
//struct MonsterView_Previews: PreviewProvider {
//    static var previews: some View {
//        MonsterView()
//    }
//}
