//
//  CalendarView1.TitleView.swift of CalendarView Demo
//
//  Created by Alina Petrovska on 01.12.2023.
//    - Mail: alina.petrovskaya@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2023 Mijick. Licensed under MIT License.

import SwiftUI

// MARK: Title View
extension CalendarView1 {
    struct TitleView: View {
       var body: some View {
           VStack(spacing: 0) {
               createTitle()
               Spacer.height(17)
               createSubTitle()
               Spacer.height(28)
               createButtons()
           }
       }
   }
}
private extension CalendarView1.TitleView {
    func createTitle() -> some View {
        Text("Choose your date")
            .font(.semiBold(18))
            .foregroundStyle(.onBackgroundPrimary)
            .contentTransition(.numericText(countsDown: true))
    }
    func createSubTitle() -> some View  {
        Text("Cupidatat consequat consectetur cupidatat officia laboris.")
            .font(.regular(16))
            .padding(.horizontal, 50)
            .multilineTextAlignment(.center)
            .foregroundStyle(.onBackgroundSecondary)
            .contentTransition(.numericText(countsDown: true))
    }
    func createButtons() -> some View {
        HStack(spacing: 12) {
            createButton("$114-", color: .greenAccent)
            createButton("$161-", color: .orangeAccent)
            createButton("$175+", color: .redAccent)
        }
    }
}
private extension CalendarView1.TitleView {
    func createButton(_ text: String, color: Color) -> some View {
        Button(action: {}) {
            Text(text)
                .font(.bold(14))
                .foregroundStyle(.white)
                .frame(width: 76, height: 36)
                .background(color, in: RoundedRectangle(cornerRadius: 7))
        }
    }
}
