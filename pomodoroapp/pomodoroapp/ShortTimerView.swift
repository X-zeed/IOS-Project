import SwiftUI

struct ShortTimerView: View {
    @ObservedObject var viewModel = ViewModel()
    @State private var tapped = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                
                Text(viewModel.secondsToMinutesAndSeconds(viewModel.shortBreakTimeRemaining))
                    .font(.system(size: 90))
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack(alignment: .center, spacing: 50) {
                    if viewModel.shortBreakTimerMode == .running || viewModel.shortBreakTimerMode == .paused {
                        Button(action: {
                            viewModel.resetTimers()
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .bold()
                                .font(.system(size: 20))
                        }
                    }
                    
                    Button(action: {
                        if viewModel.shortBreakTimerMode == .running {
                            viewModel.pauseTimers()
                            tapped.toggle()
                        } else {
                            viewModel.startShortBreakTimer()
                            tapped.toggle()
                        }
                    }) {
                        ZStack {
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundColor(Color(.red))
                            Image(systemName: viewModel.shortBreakTimerMode == .running ? "pause.fill" : "play.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 34))
                        }
                    }
                    
//                    if viewModel.shortBreakTimerMode == .running || viewModel.shortBreakTimerMode == .paused {
//                        Button(action: {
//                            viewModel.advanceOneMinuteForward()
//                        }) {
//                            Image(systemName: "goforward")
//                                .foregroundColor(.white)
//                                .fontWeight(.heavy)
//                                .rotationEffect(.degrees(60))
//                                .font(.system(size: 20))
//                        }
//                    }
                }
                .padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    ShortTimerView()
}
