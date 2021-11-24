//
//  ContentView.swift
//  Fruitmart
//
//  Created by admin on 2021/11/24.
//

import SwiftUI

struct ContentView: View {
    var store: Store
    
    var body: some View {
        NavigationView {
          VStack(spacing: 0) {
              List {
                ForEach(store.products) { product in
                  NavigationLink(destination: ProductDetailView(product: product)) {
                    ProductRow(product: product)
                  }
                }
              }
          }
          .navigationBarTitle("과일마트")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: Store())
    }
}
