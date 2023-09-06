//
//  AdventView.swift
//  Advent
//
//  Created by Sumukh Prasad on 06/09/23.
//

import SwiftUI

struct AdventView: View {
	@Environment(\.managedObjectContext) private var viewContext
	let item: Item
	var days: Int {Calendar.current.dateComponents([.day], from: Date.now, to: item.enddate!).day ?? 0}
	
	var body: some View {
		VStack {
			VStack {
				Text("\(days)")
					.font(.system(size: 64))
					.foregroundColor(Color.accentColor)
				Text("days left")
					.font(.body)
					.foregroundColor(Color.accentColor)
				Text(item.name!).font(.title).multilineTextAlignment(.leading)
				Text("Advent to \(item.enddate!, formatter: itemFormatter)").font(.caption).multilineTextAlignment(.leading)
			}
			
			Divider()
			
			VStack {
				Button("Delete") {
					deleteAdventById(objectId: item.objectID)
				}
				.foregroundColor(.red)
			}
		}
		.padding(20).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
	}
	
	private func deleteAdventById(objectId: NSManagedObjectID) {
		let adventObject = viewContext.object(with: objectId)
		viewContext.delete(adventObject)
		
		do {
			try viewContext.save()
		} catch {
			let nsError = error as NSError
			fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
		}
	}
}
