//
//  Search.swift
//  SwiftUI-Timer
//
//  Created by RANA  on 5/6/24.
//
import SwiftUI

struct Home: View {

    @Bindable  var viewModel : TimerViewModel = TimerViewModel()
    @State private var isStart : Bool = false
    
    var body: some View {
        VStack {
            Text("Timer")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            ZStack {

                Circle()
                    .stroke(LinearGradient(
                        colors: [ .green, .blue , .purple, .orange, Color.yellow],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),style: StrokeStyle(lineWidth: 20,
                                               lineCap: .butt,
                                         dash: [3,6]
                                              ))
                    .opacity(0.3)
                    .foregroundColor(.blue)
                
                    Circle()
                    .trim(from: 0.0, to: CGFloat(min(Double(viewModel.timeRemaining) / Double(viewModel.totalTime), 1.0)))
                        .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .butt, lineJoin: .round, dash: [3.6]))
                        .foregroundStyle(.green)
                        .rotationEffect(Angle(degrees: 270))
                        .animation(.linear, value: viewModel.timeRemaining)

                
    
                
                Text(viewModel.timeString(from: viewModel.timeRemaining))
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .padding()
            }
            .frame(width: 300, height: 300)
            .padding()
            
            Spacer()
            
            HStack {
                TimerView(hours: $viewModel.hours , minutes: $viewModel.minutes, seconds: $viewModel.seconds)
                
            }
            
            Spacer()
            
            HStack {
                if !isStart {
                    Button(action: {
                        viewModel.startTimer()
                        isStart.toggle()
                    }, label: {
                        Text("Start")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(15)
                    })

                } else {
                    Button(action: {
                        viewModel.stopTimer()
                        isStart.toggle()
                    }, label: {
                        Text("Stop")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(15)
                    })
//                    Button(action: viewModel.stopTimer) {
//                        Text("Stop")
//                            .font(.title2)
//                            .fontWeight(.bold)
//                            .foregroundColor(.white)
//                            .padding()
//                            .background(Color.red)
//                            .cornerRadius(15)
//                    }
                }

                Spacer()
                Button {
                    viewModel.resetTimer()
                    isStart = false
                } label: {
                    Text("Reset")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(15)
                }


            }
            .padding()
            .padding(.horizontal, 30)
            Spacer()
        }
        .padding()
        .background(LinearGradient(colors: [.red.opacity(0.5),.blue.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
    

}

#Preview {
    Home()
}
