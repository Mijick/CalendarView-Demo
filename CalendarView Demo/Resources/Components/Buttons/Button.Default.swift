//
//  Button.Default.swift of CalendarView Demo
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

extension Btn { struct Default: View {
    let title: String
    let action: () -> ()

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.bold(16))
                .foregroundStyle(.white)
                .frame(height: 48)
                .frame(maxWidth: .infinity)
                .background(.accent, in: Capsule())
        }
    }
}}

// MARK: - Preview
#Preview {
    Btn.Default(title: "Test", action: {})
}
