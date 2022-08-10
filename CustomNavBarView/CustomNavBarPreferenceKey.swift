//
//  CustomNavBarPreferenceKey.swift
//  CustomNavBarView
//
//  Created by Skorobogatow, Christian on 10/8/22.
//

import SwiftUI


struct CustomNavBarTitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

struct CustomNavBarSubTitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String? = ""
    
    static func reduce(value: inout String?, nextValue: () -> String?) {
        value = nextValue()
    }
}

struct CustomNavBackButtonHiddenPreferenceKey: PreferenceKey {
    
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

extension View {
    
    func customNavigationTitle(_ title: String) -> some View{
        preference(key: CustomNavBarTitlePreferenceKey.self, value: title)
    }
    
    func customNavigationSubtitle(_ subtitle: String?) -> some View{
        preference(key: CustomNavBarSubTitlePreferenceKey.self, value: subtitle)
    }
    
    func customNavigationBarBackButtonHidden(_ hidden: Bool) -> some View{
        preference(key: CustomNavBackButtonHiddenPreferenceKey.self, value: hidden)
    }
    
    func custonNavBarItems(title: String = "", subtitle: String? = nil, backbuttonHidden: Bool = false) -> some View {
        self
            .customNavigationTitle(title)
            .customNavigationSubtitle(subtitle)
            .customNavigationBarBackButtonHidden(backbuttonHidden)
    }
}


//@State private var showBackButton: Bool = true
//@State private var title: String = "Title"//""
//@State private var subtitle: String? = "Subtitle" // nil
