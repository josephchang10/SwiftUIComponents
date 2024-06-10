//
//  ReplyCard.swift
//
//
//  Created by Jiafu Zhang on 6/3/24.
//

import SwiftUI

public struct ReplyCard<Header: View>: View {
    private let buttonTitle: LocalizedStringKey
    private let header: Header
    private let text: Binding<String>
    private let textFieldTitleKey: LocalizedStringKey
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            header
            textField
            ButtonPrimary(.medium, title: buttonTitle) {
                Image(systemName: "chevron.right")
            }
        }
        .padding(12)
        .frame(minWidth: 240)
        .background(.container(.background))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .inset(by: 0.5)
                .stroke(.container(.border), lineWidth: 1)
        }
    }
    
    private var textField: some View {
        TextField(textFieldTitleKey, text: text, axis: .vertical)
            .font(.footnoteRegular)
            .foregroundStyle(.foreground(.primary))
            .textFieldStyle(.plain)
            .padding(10)
            .background(.container(.background))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .inset(by: 0.5)
                    .stroke(.container(.border), lineWidth: 1)
            }
    }
    
    public init(textFieldTitleKey: LocalizedStringKey, text: Binding<String>, buttonTitle: LocalizedStringKey, @ViewBuilder header: () -> Header) {
        self.textFieldTitleKey = textFieldTitleKey
        self.text = text
        self.buttonTitle = buttonTitle
        self.header = header()
    }
}

struct ReplyCardView: View {
    var body: some View {
        ReplyCard(textFieldTitleKey: "", text: .constant("Yes, if you’re new to SwiftUI, I recommend taking the iOS course first since it covers more the basics and is more complete with 60 videos."), buttonTitle: "Reply to comment") {
            HStack(spacing: 12) {
                AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=2680&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
                VStack(alignment: .leading) {
                    Text("Alexander Hipp, Designer")
                        .font(.footnoteMedium)
                        .foregroundStyle(.foreground(.primary))
                    Text("Designer at a tech startup")
                        .font(.smallMedium)
                        .foregroundStyle(.foreground(.secondary))
                }
            }
        }
        .frame(width: 320)
    }
}

#Preview {
    HStack(spacing: 20) {
        ReplyCardView()
            .environment(\.colorScheme, .light)
        ReplyCardView()
            .environment(\.colorScheme, .dark)
    }
    .padding(20)
    .background(.background(.secondary))
    .background(Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255))
}
