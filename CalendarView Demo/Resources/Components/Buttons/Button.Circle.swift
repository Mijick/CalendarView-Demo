//
//  Button.Circle.swift of CalendarView Demo
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

extension Btn { struct Circle: View {
    let imageName: String
    let action: () -> ()

    var body: some View {
        Button(action: action) {
            Image(imageName)
                .resizable()
                .padding(6)
                .foregroundStyle(.onBackgroundPrimary)
                .frame(40)
                .background(.backgroundSecondary, in: SwiftUI.Circle())
        }
    }
}}

// MARK: - Preview
#Preview {
    Btn.Circle(imageName: "github", action: {})
}
