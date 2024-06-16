//
//  SwiftUIView.swift
//  
//
//  Created by Jiafu Zhang on 6/16/24.
//

import SwiftUI

public extension Icon {
    enum Files: String {
        case fileMultiple
    }
}

struct FilesView: View {
    var body: some View {
        Icon(.files(.fileMultiple))
            .frame(width: 24, height: 24)
    }
}

#Preview {
    FilesView()
        .padding(60)
}
