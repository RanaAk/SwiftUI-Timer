//
//  TimerViewModel.swift
//
//  SwiftUI-Timer
//
//  Created by RANA  on 6/6/24.
//

import Foundation
import Observation

@Observable
class TimerViewModel {
    
    var timeRemaining = 0
    var totalTime = 0
    var hours = 0
    var minutes = 0
    var seconds = 0
    var isTimerRunning = false
    var timer: Timer?
    var firstTime : Bool =  true
    
    func startTimer() {
        totalTime = hours * 3600 + minutes * 60 + seconds
        if firstTime {
            timeRemaining = totalTime
        } 
        isTimerRunning = true
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if self.timeRemaining > 0 {
               // self.totalTime -= 1
                self.timeRemaining -= 1
            } else {
                self.timer?.invalidate()
                self.isTimerRunning = false
                self.firstTime = true
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        isTimerRunning = false
        firstTime = false
    }
    
    func resetTimer() {
        timer?.invalidate()
        isTimerRunning = false
        timeRemaining = 0
        firstTime = true
        totalTime = 0
        self.hours = 0
        self.minutes = 0
        self.seconds = 0
    }
    
    func timeString(from totalSeconds: Int) -> String {
        let hours = totalSeconds / 3600
        let minutes = (totalSeconds % 3600) / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
