//
//  AdventView.swift
//  Advent
//
//  Created by Sumukh Prasad on 06/09/23.
//

import SwiftUI

struct AdventView: View {
	let item: Item
	var body: some View {
		VStack {
			Text(item.name!).font(.title)
			Divider()
			Text(item.enddate!, formatter: itemFormatter)
			Button("Delete") {
				print(item.id)
			}
			.foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
		}
		.padding(20).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading).multilineTextAlignment(.leading)
	}
}
