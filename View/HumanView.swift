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
    @Binding var day: Int
    
    func dayBackgroundImage() -> String {
        if dayTime {
            return "Mday"
        } else {
            return "Hnight"
        }
    }
    
    var body: some View {
        
        ZStack {
            
            Image(dayBackgroundImage())
                .resizable()
                .edgesIgnoringSafeArea(.top)
            
            VStack {
                VStack {
                    
                    Text("DAY \(day)")
                        .font(.largeTitle)
                        .bold()
                    
                    ZStack {
                        Image(FaceImage())
                            .resizable()
                            .frame(width: 300, height: 300)
                            .shadow(radius: 10)
                            .padding()
                        if dayTime {
                            Image("blind")
                                .resizable()
                                .frame(width: 300, height: 300)
                                .opacity(0)
                                .padding()
                        } else {
                            Image("blind")
                                .resizable()
                                .frame(width: 300, height: 300)
                                .opacity(0.3)
                                .padding()
                        }
                    }
                    
                    Spacer()
                    Text(hText())
                        .font(.largeTitle)
                        .bold()
                    
                }
                
                ZStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width, height: 250)
                        .foregroundColor(.white)
                        .cornerRadius(20, corners: [.topLeft, .topRight])

                    
                    VStack {
                        Text("MY GOAL : \(goalSteps)")
                            .font(.body)
                            .bold()
                            .padding()
                        
                        Text("MY STEPS : \(humanSteps)")
                            .foregroundColor(Color("Hgreen"))
                            .font(.system(size: 40))
                            .bold()
                    }
                }
            }
            HStack {
                VStack {
                    Button(action: {
                        humanSteps += 500
                    }, label: {
                            Image("step")
                                .resizable().frame(width: 40, height: 40)
                    })
                    .padding()
                    Spacer()
                }
                Spacer()
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




struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
