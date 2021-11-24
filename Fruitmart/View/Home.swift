//
//  Home.swift
//  FruitMart
//
//  Created by Giftbot on 2020/03/02.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Home: View {
  @EnvironmentObject private var store: Store
  
  // MARK: Body
  
  var body: some View {
    NavigationView {
      VStack(spacing: 0) {
        productList
      }
      .navigationBarTitle("과일마트")
    }
  }
}


private extension Home {
  
   var productList: some View {
    List {
      ForEach(store.products) { product in
        // iOS 13에서 디스클로저 인디케이터를 제거하기 위한 임시 방편이
        // iOS 14에서 동작하지 않으므로 관련 코드 제거
        NavigationLink(destination: ProductDetailView(product: product)) {
          ProductRow(product: product)
        }
      }
    }

  }


}

