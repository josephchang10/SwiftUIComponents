//
//  Switch.swift
//
//
//  Created by Jiafu Zhang on 6/10/24.
//

import SwiftUI

public struct Switch: View {
    @Binding private var isOn: Bool
    
    public var body: some View {
        HStack(spacing: 10) {
            Circle()
                .fill(.container(.background))
                .frame(width: 24)
                .overlay {
                    Circle()
//                        .inset(by: 0.5)
                        .stroke(.container(.border), lineWidth: 1)
                }
                .shadow(color: .init(red: 142 / 255, green: 155 / 255, blue: 174 / 255).opacity(0.2), radius: 7.11, x: 0.89, y: 1.78)
                .offset(x: isOn ? 34 : 0)
            Circle()
                .fill(.container(.background))
                .frame(width: 24)
                .overlay {
                    Circle()
                        .stroke(.container(.border), lineWidth: 1)
                }
                .opacity(0)
        }
        .padding(2)
        .fixedSize()
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(isOn ? .button(.normal) : .button(.inactive))
        }
        .onTapGesture {
            isOn.toggle()
        }
        .animation(.easeOut, value: isOn)
    }
    
    public init(isOn: Binding<Bool>) {
        _isOn = isOn
    }
}

struct SwitchView: View {
    @State private var isOn = false
    
    var body: some View {
        Switch(isOn: $isOn)
    }
}

#Preview {
    SwitchView()
        .padding(60)
}
