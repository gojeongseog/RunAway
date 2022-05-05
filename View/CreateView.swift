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
    
//    @State private var isGoalSteps = false
    
    var body: some View {
        
        ZStack {
            
            Image("Hday")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                Text("DAY \(day)")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                
                
                
                if gameOver {
                    
                    Image(Day.low.hImageName)
                        .resizable()
                        .frame(width: 350, height: 350)
                        .shadow(radius: 10)
                    .padding(30)
                    
                    Text("무서운 꿈을 꾸었나요? 어서 다시 도망가요!")
                        .bold()
                } else {
                    
                    Image(Night.low.mImageName)
                        .resizable()
                        .frame(width: 350, height: 350)
                        .shadow(radius: 10)
                    .padding(30)
                    
                    Text("무서운 존재가 당신의 냄새를 맡았어요 도망가요!")
                        .bold()
                }
                
                
                
                
                HStack {
                    Text("목표 걸음 : ")
                    
                    Picker("목표 걸음 수를 정하세요.", selection: $selectedSteps) {
                        ForEach(goalStepsArr, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .frame(width: 50, height: 55)
                    .pickerStyle(.menu)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                }
                
                
                
                Text("당신'\(selectedSteps)'걸음 걷기 입니다.")
                
                Button(action: {
                    goalSteps = selectedSteps
                    isGoalStep = true
                    gameOver = false
                    day = 1
                }, label: {
                    Text("도망가!")
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(30)
                })
            }
        }
        
        
    }
}

//struct CreateView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateView(goalSteps: 2000, gameOver: false, isGoalStep: false)
//    }
//}
