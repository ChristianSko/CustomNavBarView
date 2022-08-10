//
//  ContentView.swift
//  CustomNavBarView
//
//  Created by Skorobogatow, Christian on 10/8/22.
//

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
        CustomNavView {
            ZStack {
                Color.orange.ignoresSafeArea()
                
                CustomNavLink(destination:
                                Text("Destination")
                    .customNavigationTitle("Second Screen")
                    .customNavigationSubtitle("Custom Subtitle")) {
                    Text("Navigate")
                }

            }
            .customNavigationTitle("Custom Title")
            .customNavigationBarBackButtonHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavBarView()
    }
}

extension AppNavBarView {
    private var defaultNativeNavView: some View {
        NavigationView {
            ZStack {
                Color.red.ignoresSafeArea()
                
                NavigationLink {
                    Text("Destination")
                        .navigationTitle("Title2")
                        .navigationBarHidden(false)
                } label: {
                    Text("Navigation")
                }

            }
            .navigationTitle("Nav title here")
        }
    }
}
