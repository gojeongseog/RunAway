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
            if humanSteps >= goalSteps {
                return Day.high.hImageName
            } else if humanSteps >= goalSteps / 2 {
                return Day.mid.hImageName
            } else {
                return Day.low.hImageName
            }
        } else {
            
            if humanSteps - monsterSteps <= 0 {
                return Night.die.hImageName
            } else if humanSteps - monsterSteps < goalSteps / 3 {
                return Night.high.hImageName
            } else if humanSteps - monsterSteps < goalSteps / 2 {
                return Night.mid.hImageName
            } else {
                return Day.low.hImageName
            }
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
                    Text("DAY 8")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    
                    HStack {
                        Text(String(humanSteps))
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
                .frame(width: 350, height: 350)
                
            }
            
            
        }
        
    }
    
}

//struct HumanView_Previews: PreviewProvider {
//    static var previews: some View {
//        HumanView()
//    }
//}
