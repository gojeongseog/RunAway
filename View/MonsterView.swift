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
    
    func dayFaceImage(goalSteps: Int, humanSteps: Int) -> String {
        
        if dayTime {
            return "Msleep"
        } else {
            
            return Night.survive.mImageName
            
//            if humanSteps - monsterSteps <= 0 {
//                return Night.die.mImageName
//            } else if humanSteps - monsterSteps < goalSteps / 3 {
//                return Night.high.mImageName
//            } else if humanSteps - monsterSteps < goalSteps / 2 {
//                return Night.mid.mImageName
//            } else {
//                return Night.low.mImageName
//            }
        }
    }
    
    var body: some View {
        ZStack {
            
                Image(dayBackgroundImage())
                    .resizable()
                    .ignoresSafeArea()
            
            
            
            
            
            VStack {
                
                Image(dayFaceImage(goalSteps: goalSteps, humanSteps: humanSteps))
                    .resizable()
                    .frame(width: 350, height: 350)
                    .shadow(radius: 10)
                    .padding(.top, 120)
                //                Circle()
                //                    .frame(width: 350, height: 350)
                //                    .padding(.top, 120)
                
                
                
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
                            if !dayTime {
                                Image("Mstep")
                            }
                            
                        })
                        
                    }
                    .padding()
                    
                }
                .frame(width: 350, height: 350)
                
            }
            
            
        }
        
    }
    
}

//struct MonsterView_Previews: PreviewProvider {
//    static var previews: some View {
//        MonsterView()
//    }
//}
