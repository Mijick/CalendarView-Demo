//
//  HomeView.swift of CalendarView Demo
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import MijickNavigattie
import MijickGridView

struct HomeView: NavigatableView {
    var body: some View {
        VStack(spacing: 0) {
            Spacer.height(64)
            createHeader()
            Spacer.height(44)
            createButtons()
            Spacer()
            createFooter()
            Spacer.height(4)
        }
    }
}

private extension HomeView {
    func createHeader() -> some View {
        HeaderView()
    }
    func createButtons() -> some View {
        ButtonsView()
    }
    func createFooter() -> some View {
        FooterView()
    }
}


// MARK: - Header
fileprivate struct HeaderView: View {
    var body: some View {
        VStack(spacing: 16) {
            createTitle()
            createDescription()
        }
        .padding(.horizontal, margins * 2)
    }
}
private extension HeaderView {
    func createTitle() -> some View {
        Text("calendarview.")
            .font(.headline(36))
            .foregroundStyle(.onBackgroundPrimary)
            .multilineTextAlignment(.center)
    }
    func createDescription() -> some View {
        Text("Thank you for trying out our library. If you like it, please leave a star on GitHub. Check out more of our projects using the links in the footer.".lowercased())
            .font(.regular(16))
            .foregroundStyle(.onBackgroundSecondary)
            .multilineTextAlignment(.center)
    }
}

// MARK: - Buttons
fileprivate struct ButtonsView: View {
    var body: some View {
        GridView(1...4, id: \.self, content: createButton, configBuilder: configureGridView)
            .padding(.horizontal, margins)
    }
}
private extension ButtonsView {
    func createButton(_ index: Int) -> some View {
        Btn.Rectangle(imageName: "calendar-\(index)") { onButtonTap(index) }
    }
    func configureGridView(_ config: GridView.Config) -> GridView.Config { config
        .columns(2)
        .horizontalSpacing(12)
        .verticalSpacing(12)
    }
}
private extension ButtonsView {
    func onButtonTap(_ index: Int) { switch index {
        case 1: CalendarView1().push(with: .scale)
        case 2: CalendarView2().push(with: .scale)
        case 3: CalendarView3().push(with: .scale)
        case 4: CalendarView4().push(with: .scale)
        default: fatalError()
    }}
}

// MARK: - Footer
fileprivate struct FooterView: View {
    var body: some View {
        VStack(spacing: 12) {
            createDivider()
            createContent()
        }
    }
}
private extension FooterView {
    func createDivider() -> some View {
        Divider()
    }
    func createContent() -> some View {
        HStack(spacing: 0) {
            createMijickLogo()
            Spacer()
            createButtons()
        }
        .padding(.horizontal, margins)
    }
}
private extension FooterView {
    func createMijickLogo() -> some View {
        Image("mijick")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 62)
            .foregroundStyle(.onBackgroundPrimary)
            .frame(height: 0)
    }
    func createButtons() -> some View {
        HStack(spacing: 12) {
            createGithubButton()
            createXButton()
        }
    }
}
private extension FooterView {
    func createGithubButton() -> some View {
        Btn.Circle(imageName: "github", action: onGithubButtonTap)
    }
    func createXButton() -> some View {
        Btn.Circle(imageName: "x", action: onXButtonTap)
    }
}
private extension FooterView {
    func onGithubButtonTap() {
        UIApplication.shared.open(.init(string: "https://www.github.com/Mijick")!)
    }
    func onXButtonTap() {
        UIApplication.shared.open(.init(string: "https://www.twitter.com/MijickTeam")!)
    }
}


// MARK: - Modifiers
fileprivate let margins: CGFloat = 28


// MARK: - Preview
#Preview {
    HomeView()
}
