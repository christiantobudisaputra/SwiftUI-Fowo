//
//  ContentView.swift
//  Fowo
//
//  Created by Christianto Budisaputra on 04/10/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: PostView.ViewModel

    init() {
        let viewModel: PostView.ViewModel = .init(post: .mock)
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            NavigationLink(isActive: $viewModel.shouldNavigateToCommentPage) {
                PostDetailView(viewModel: viewModel)
            } label: {
                PostView(viewModel: viewModel, truncated: true)
                    .foregroundColor(.primary)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
