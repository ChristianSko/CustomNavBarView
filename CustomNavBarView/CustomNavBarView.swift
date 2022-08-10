//
//  CustomNavBarView.swift
//  CustomNavBarView
//
//  Created by Skorobogatow, Christian on 10/8/22.
//

import SwiftUI

struct CustomNavBarView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let showBackButton: Bool
    let title: String
    let subtitle: String?
    
    var body: some View {
        HStack {
            
            if showBackButton {
                backButton
            }
            
            Spacer()
            titleSection
            Spacer()
            
            if showBackButton {
                backButton
                    .opacity(0)
            }
            
        }
        .accentColor(.white)
        .foregroundColor(.white)
        .font(.headline)
        .padding()
        .background(Color.blue.ignoresSafeArea(edges: .top))
    }
    
}

struct CustomNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomNavBarView(showBackButton: true, title: "Title here", subtitle: "Subtitle here")
            
            Spacer()
        }
        
    }
}


extension CustomNavBarView {
    
    private var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
        }
    }
    
    private var titleSection: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            
            if let subtitle = subtitle {
                Text(subtitle)
            }
        }
    }
}
