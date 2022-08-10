//
//  CustomNavbarContainerView.swift
//  CustomNavBarView
//
//  Created by Skorobogatow, Christian on 10/8/22.
//

import SwiftUI

struct CustomNavbarContainerView<Content:View>: View {
    
    let content: Content
    
    @State private var showBackButton: Bool = true
    @State private var title: String = ""
    @State private var subtitle: String? = nil
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(showBackButton: showBackButton, title: title, subtitle: subtitle)
            content
                .frame(maxWidth: .infinity,  maxHeight: .infinity)
        }
        .onPreferenceChange(CustomNavBarTitlePreferenceKey.self) { value in
            self.title = value
        }
        .onPreferenceChange(CustomNavBarSubTitlePreferenceKey.self) { value in
            self.subtitle = value
        }
        .onPreferenceChange(CustomNavBackButtonHiddenPreferenceKey.self) { value in
            self.showBackButton = !value
        }
    }
}

struct CustomNavbarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavbarContainerView {
            ZStack{
                Color.green.ignoresSafeArea()
                
                Text("Hello World!")
                    .foregroundColor(.white)
            }
            .customNavigationTitle("Test")
            .customNavigationSubtitle("Test Subtitle")
            .customNavigationBarBackButtonHidden(true)
        }
    }
}
