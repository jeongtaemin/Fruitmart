//
//  ProductDetailView.swift
//  FruitMart
//
//  Created by Giftbot on 2020/03/02.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct ProductDetailView: View {

  let product: Product

  var body: some View {
    VStack(spacing: 0) {
        productImage
        orderView
    }
    .edgesIgnoringSafeArea(.top)
  }
}


private extension ProductDetailView {
  // MARK: View
  
  var productImage: some View {
    GeometryReader { _ in
      Image(self.product.imageName)
            .resizable()
            .scaledToFill()
    }
  }
  
  var orderView: some View {
    GeometryReader {
      VStack(alignment: .leading) {
        self.productDescription
        Spacer()
        self.priceInfo
        self.placeOrderButton
      }
      .padding(32)
      .frame(height: $0.size.height + 10)
      .background(Color.white)
      .cornerRadius(16)
      .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: -5)
    }
  }

  var productDescription: some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack {
        Text(product.name)
          .font(.largeTitle).fontWeight(.medium)
          .foregroundColor(.black)
        
        Spacer()
        
        Image(systemName: "heart")
              .imageScale(.large)
              .foregroundColor(Color.peach)
              .frame(width: 32, height: 32)
      }
      
      Text(splitText(product.description))
        .foregroundColor(.secondaryText)
        .fixedSize()
    }
  }
  
  var priceInfo: some View {

    HStack {
      (Text("₩")
       + Text("\(product.price)").font(.title)
        ).fontWeight(.medium)
      Spacer()
    }
    .foregroundColor(.black)
  }
    
  var placeOrderButton: some View {
        Button(action: {
          print("order")
        }) {
          Capsule()
            .fill(Color.peach)
            .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 55)
            .overlay(Text("주문하기")
            .font(.system(size: 20)).fontWeight(.medium)
            .foregroundColor(Color.white))
            .padding(.vertical, 8)
        }
   }
  

  

  
  // MARK: Computed Values
  
  func splitText(_ text: String) -> String {
    guard !text.isEmpty else { return text }
    let centerIdx = text.index(text.startIndex, offsetBy: text.count / 2)
    let centerSpaceIdx = text[..<centerIdx].lastIndex(of: " ")
      ?? text[centerIdx...].firstIndex(of: " ")
      ?? text.index(before: text.endIndex)
    let afterSpaceIdx = text.index(after: centerSpaceIdx)
    let lhsString = text[..<afterSpaceIdx].trimmingCharacters(in: .whitespaces)
    let rhsString = text[afterSpaceIdx...].trimmingCharacters(in: .whitespaces)
    return String(lhsString + "\n" + rhsString)
  }
  

}


// MARK: - Previews

struct ProductDetailView_Previews: PreviewProvider {
  static var previews: some View {
    ProductDetailView(product: productSamples[0])
  }
}
