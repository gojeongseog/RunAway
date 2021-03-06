//
//  CreateView.swift
//  RunAway
//
//  Created by KoJeongseok on 2022/05/03.
//

import SwiftUI

struct CreateView: View {
    
//    @AppStorage("goalStep") var goalSteps
    
    @Binding var goalSteps: Int
    @Binding var gameOver: Bool
    @Binding var isGoalStep: Bool
    @Binding var day: Int
    var goalStepsArr = [2000, 4000, 6000, 8000, 10000, 15000, 20000]
    
    
    @State private var selectedSteps = 2000
    @State var startImage = "CreateBack1"
    @State var startFaceImage = Day.mid.hImageName
    
    @State var rePlayImage = "RePlayBack"
    @State var rePlayFaceImage = Day.die.hImageName
    
    
//    @State private var isGoalSteps = false
    
    var body: some View {

        ZStack {
            
            VStack {
                
                
                if !isGoalStep {
                    
                    Image(startImage)
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.top)

                } else {
                    Image(rePlayImage)
                        .scaledToFill()
                        .ignoresSafeArea()
                }
               
                
                Spacer()
            }
            
            VStack {
                Spacer()
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width, height: 350)
                    .edgesIgnoringSafeArea(.bottom)
                    .foregroundColor(.white)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
            }

            VStack {
                
                if !isGoalStep {
                    Image(startFaceImage)
                        .resizable()
                        .frame(width: 250, height: 250)
                        .shadow(radius: 10)
                        .padding(.top, 280)
                        .padding(.bottom, 40)
                } else {
                    Image(rePlayFaceImage)
                        .resizable()
                        .frame(width: 250, height: 250)
                        .shadow(radius: 10)
                        .padding(.top, 280)
                        .padding(.bottom, 40)
                }

                
                
                
                if gameOver {
                    Text("????????? ?????? ????????????? ?????? ?????? ????????????!")
                        .bold()
                } else {
                    Text("???????????? ????????? ????????????! ????????????!")
                        .bold()
                }
                
                
                
                
                HStack {
                    Text("?????? ?????? : ")
                    
                    Picker("?????? ?????? ?????? ????????????.", selection: $selectedSteps) {
                        ForEach(goalStepsArr, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .frame(width: 50, height: 55)
                    .pickerStyle(.menu)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                }
                
                
                
//                Text("??????'\(selectedSteps)'?????? ?????? ?????????.")
                
                Button(action: {
                    goalSteps = selectedSteps
                    isGoalStep = true
                    gameOver = false
                    day = 1
                }, label: {
                    Text("?????????!")
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(20)
                })
            }
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                if !isGoalStep {
                    startImage = "CreateBack"
                    startFaceImage = Day.low.hImageName
                } else {
                    rePlayImage = "CreateBack"
                    rePlayFaceImage = Day.mid.hImageName
                }
                
            }
        }
        
        
    }
}

//struct CreateView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateView(goalSteps: 2000, gameOver: false, isGoalStep: false)
//    }
//}
