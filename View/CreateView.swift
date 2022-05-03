//
//  CreateView.swift
//  RunAway
//
//  Created by KoJeongseok on 2022/05/03.
//

import SwiftUI

struct CreateView: View {
    
    var goalSteps = [2500, 5000, 7500, 10000, 12500, 15000, 17500, 20000]
    
    @State private var selectedSteps = "5000"
    @State private var isGoalSteps = false
    
    var body: some View {
        VStack {
                    Picker("목표 걸음 수를 정하세요.", selection: $selectedSteps) {
                        ForEach(goalSteps, id: \.self) {
                            Text(String($0))
                        }
                        
                    }.background(Color.blue)
            Text("당신은 '\(selectedSteps)' 걸음을 걸어야만 합니다..")
                    
            
            Button(action: {
                isGoalSteps = true
                print(Date())
            }, label: {
                Text("Run Away!")
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(30)
            })
            
            
            
            
                }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
