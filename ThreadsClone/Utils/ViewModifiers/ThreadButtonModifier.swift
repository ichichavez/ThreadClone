//
//  ThreadButtonModifier.swift
//  ThreadsClone
//
//  Created by Isidro Chávez on 2024-05-15.
//

import SwiftUI

struct ThreadsButtonModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(width: 352, height: 44)
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
}
