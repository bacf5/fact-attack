//
//  PhotoView.swift
//  FactAttack
//
//  Created by Bruno Agustin Caruso Fassa on 02.09.25.
//

import SwiftUI

struct PhotoView: View {
    @Environment(\.dismiss) var dismiss
    
    var uiImage: UIImage
    let animal: String
    
    
    var body: some View {
        
        ZStack {
            // bg image
            Image(animal.self)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            
            VStack {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 800 , height: 600 )
            }
        }
        
        
    }
}

//#Preview {
//
//    PhotoView(uiImage: uiImage)
//}
