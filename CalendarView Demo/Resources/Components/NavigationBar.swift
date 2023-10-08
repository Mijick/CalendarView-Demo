//
//  NavigationBar.swift of CalendarView Demo
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

struct NavigationBar: View {
    let logoName: String


    var body: some View {
        ZStack {
            createBackButton()
            createLogo()
        }
        .padding(.top, 8)
        .padding(.bottom, 12)
        .frame(maxWidth: .infinity)
    }
}
private extension NavigationBar {
    func createBackButton() -> some View {
        Btn.Icon(imageName: "back", colour: .accent, action: pop)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    func createLogo() -> some View {
        Image(logoName)
            .resizable()
            .frame(32)
            .foregroundStyle(.onBackgroundPrimary)
    }
}

// MARK: - Preview
#Preview {
    NavigationBar(logoName: "calendar-1").padding(.horizontal, 24)
}
