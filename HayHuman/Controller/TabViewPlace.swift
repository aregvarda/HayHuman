import SwiftUI

struct TabViewPlace: View {
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack(spacing: 0) {
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .culture, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "paintpalette", tabName: "Culture")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .military, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "shield", tabName: "Military")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .science, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "atom", tabName: "Science")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .politics, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "person.2", tabName: "Politics")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .business, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "briefcase", tabName: "Business")
                }
                .frame(width: geometry.size.width, height: geometry.size.height/8)
                .background(Color(.systemBackground).shadow(radius: 2))
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TabViewPlace_Previews: PreviewProvider {
    static var previews: some View {
        TabViewPlace()
            .environmentObject(ViewRouter())
    }
}
