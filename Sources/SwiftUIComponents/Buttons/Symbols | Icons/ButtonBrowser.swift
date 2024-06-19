//
//  ButtonBrowser.swift
//
//
//  Created by Jiafu Zhang on 4/8/24.
//

import SwiftUI

public struct ButtonBrowser: View {
    public enum _State {
        case normal, close, minimize, expand
    }
    
    @Environment(\.colorScheme) var colorScheme
    
    private let state: _State
    
    public var body: some View {
        ZStack {
            switch state {
            case .normal:
                Image(systemName: "minus")
                    .frame(width: 8, height: 8)
                    .hidden()
            case .close:
                Image(systemName: "xmark")
                    .resizable()
                    .fontWeight(.black)
                    .scaledToFit()
                    .frame(width: 5)
            case .minimize:
                Image(systemName: "minus")
                    .resizable()
                    .scaledToFit()
                    .fontWeight(.bold)
                    .frame(width: 7)
                
            case .expand:
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                    .resizable()
                    .scaledToFit()
                    .fontWeight(.bold)
                    .frame(width: 6)
            }
        }
        .foregroundStyle(.foreground(.primary))
        .frame(width: 12, height: 12)
        .background(LinearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .top, endPoint: .bottom).opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .inset(by: 0.5)
                .stroke(colorScheme == .dark ? LinearGradient(colors: [.white.opacity(0.3), .white.opacity(0)], startPoint: .top, endPoint: .bottom) :  LinearGradient(colors: [.black.opacity(0), .black], startPoint: .init(x: 0.4, y: 0.7), endPoint: .init(x: 0.7, y: 0)), lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                .stroke(.primary.opacity(0.1), lineWidth: 1)
        }
    }
    
    public init(state: _State = .normal) {
        self.state = state
    }
}

struct ButtonBrowserView: View {
    var body: some View {
        HStack(spacing: 20) {
            ButtonBrowser()
            ButtonBrowser(state: .close)
            ButtonBrowser(state: .minimize)
            ButtonBrowser(state: .expand)
        }
    }
}

#Preview {
    HStack(spacing: 20) {
        ButtonBrowserView()
            .environment(\.colorScheme, .light)
        ButtonBrowserView()
            .environment(\.colorScheme, .dark)
    }
    .padding(20)
    .background(Color(red: 53 / 255, green: 53 / 255, blue: 53 / 255))
}
