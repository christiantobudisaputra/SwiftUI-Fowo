//
//  PostView.swift
//  Fowo
//
//  Created by Christianto Budisaputra on 04/10/22.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HeaderSection()
            ContentSection()
            Divider()
            FooterSection()
        }
    }

    private func HeaderSection() -> some View {
        HStack {
            Image("tvlk")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 38)
                .cornerRadius(4)
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("TRAVELOKA")
                    Text("kris")
                        .foregroundColor(.secondary)
                }

                HStack {
                    Text("sehari yang lalu")
                        .foregroundColor(.secondary)
                    Text("f/Publik")
                        .font(.footnote.bold())
                        .padding(2)
                        .padding(.horizontal, 4)
                        .background(Color.blue)
                        .cornerRadius(4)
                }
            }

            Spacer()

            Button {

            } label: {
                Image(systemName: "circle.grid.3x3.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 16, height: 6)
                    .clipped()
            }
            .foregroundColor(.secondary)
            .font(.caption2)
        }
    }

    private func ContentSection() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Lorem Ipsum")
                .font(.title2.bold())
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec elementum lorem vitae dolor vehicula pulvinar. Quisque consectetur nunc id neque malesuada, quis ullamcorper sapien tristique. Praesent venenatis dui eget erat varius, id vehicula ipsum suscipit. Curabitur scelerisque fermentum lacus, ut elementum felis tincidunt in. Aenean a molestie dolor, vitae tincidunt magna. Vestibulum feugiat leo ac dapibus pharetra. Etiam sit amet risus non mauris dignissim ornare. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Donec accumsan metus eros, ut varius mauris dignissim sit amet. Etiam et pharetra purus, nec fermentum risus. Phasellus bibendum mauris sit amet maximus placerat. Vivamus imperdiet gravida risus, ut fringilla dui aliquam quis. Vivamus nisl purus, fermentum at massa aliquam, dapibus blandit nulla.")
                .frame(maxHeight: 240)
            HStack {
                Spacer()
                Text("15 menyukai")
                Text("20 komentar")
            }
            .foregroundColor(.secondary)
        }
    }

    private func FooterSection() -> some View {
        HStack {
            Spacer()

            Button {
                
            } label: {
                HStack {
                    Image(systemName: "hand.thumbsup")
                    Text("Like")
                }
            }

            Spacer()

            Button {

            } label: {
                HStack {
                    Image(systemName: "bubble.left")
                    Text("Komentar")
                }
            }

            Spacer()

            Button {
                
            } label: {
                HStack {
                    Image(systemName: "bookmark")
                    Text("Bookmark")
                }
            }

            Spacer()
        }
        .foregroundColor(.primary)
        .padding(6)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
            .padding()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
