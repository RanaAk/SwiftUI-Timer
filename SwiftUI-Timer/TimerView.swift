//
//  Timer.swift
//  SwiftUI-Timer
//
//  Created by RANA  on 6/6/24.
//

import SwiftUI

struct TimerView: View {
//    @State private var timeRemaining = 0
//    @State private var totalTime = 0
    @Binding var hours : Int
    @Binding var minutes : Int
    @Binding var seconds : Int
//    @State private var isTimerRunning = false
//    @State private var timer: Timer?
    var body: some View {
        VStack{
            HStack {
                Picker("Hours", selection: $hours) {
                    ForEach(0..<24) { hour in
                        Text("\(hour) h").tag(hour)
                    }
                    .bold()
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 100, height: 100)
                
                Picker("Minutes", selection: $minutes) {
                    ForEach(0..<60) { minute in
                        Text("\(minute) m").tag(minute)
                    }
                    .bold()
                    
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 100, height: 100)
                
                Picker("Seconds", selection: $seconds) {
                    ForEach(0..<60) { second in
                        Text("\(second) s").tag(second)
                    }
                    .bold()
                }
                //.labelsHidden()
                .pickerStyle(WheelPickerStyle())
                .frame(width: 100, height: 100)

                
            }
            
        }
    }
}

#Preview {
    TimerView(hours: .constant(0), minutes: .constant(0), seconds: .constant(0))
}
