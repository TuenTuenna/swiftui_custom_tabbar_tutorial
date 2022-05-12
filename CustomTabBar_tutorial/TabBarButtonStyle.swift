//
//  TabBarButtonStyle.swift
//  CustomTabBar_tutorial
//
//  Created by Jeff Jeong on 2022/05/13.
//

import Foundation
import SwiftUI

struct TabBarButtonStyle : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .scaleEffect(configuration.isPressed ? 0.6 : 1)
            .animation(.spring(), value: configuration.isPressed)
    }
}
