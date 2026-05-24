// MARK: - Views/Drills/DrillTimerView.swift

import SwiftUI

struct DrillTimerView: View {
    let duration: Int
    @Binding var isCompleted: Bool
    @State private var remainingTime: Int
    @State private var timer: Timer?

    init(duration: Int, isCompleted: Binding<Bool>) {
        self.duration = duration
        self._isCompleted = isCompleted
        self._remainingTime = State(initialValue: duration)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Thời gian tập:")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.blue)

            // Dòng hiển thị thời gian
            Text(timeString(from: remainingTime))
                .font(.system(size: 40, weight: .bold, design: .monospaced))
                .foregroundColor(.blue)
            
            // Các nút điều khiển nằm ở dưới
            HStack(spacing: 20) {
                Button(action: {
                    if timer == nil {
                        startTimer()
                    } else {
                        stopTimer()
                    }
                }) {
                    Text(timer == nil ? "Bắt Đầu" : "Tạm Dừng")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 20)
                        .background(timer == nil ? Color.green : Color.orange)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    resetTimer()
                }) {
                    Text("Đặt Lại")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 20)
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
        }
        .onDisappear {
            stopTimer()
        }
    }

    private func startTimer() {
        isCompleted = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if remainingTime > 0 {
                remainingTime -= 1
            } else {
                stopTimer()
                isCompleted = true
            }
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    private func resetTimer() {
        stopTimer()
        remainingTime = duration
        isCompleted = false
    }

    private func timeString(from totalSeconds: Int) -> String {
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct DrillTimerView_Previews: PreviewProvider {
    static var previews: some View {
        DrillTimerView(duration: 300, isCompleted: .constant(false))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
