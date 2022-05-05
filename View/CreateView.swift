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
    var goalStepsArr = [2000, 4000, 6000, 8000, 10000, 15000, 20000]
    
    
    @State private var selectedSteps = 5000
    
//    @State private var isGoalSteps = false
    
    var body: some View {
        
        ZStack {
            
            Image("Hday")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Picker("목표 걸음 수를 정하세요.", selection: $selectedSteps) {
                    ForEach(goalStepsArr, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.wheel)
                
                Text("당신의 목표는 '\(selectedSteps)'걸음 걷기 입니다.")
                
                Button(action: {
                    isGoalStep = true
                    print(Date())
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
//        CreateView()
//    }
//}
