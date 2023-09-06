//
//  ContentView.swift
//  Advent
//
//  Created by Sumukh Prasad on 06/09/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
	@Environment(\.managedObjectContext) private var viewContext
	
	@FetchRequest(
		sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
		animation: .default)
	private var items: FetchedResults<Item>
	@State private var selection: Item? = nil
	@State var presentingAddNewAdventSheet = false
	
	var body: some View {
		NavigationView {
			List {
				ForEach(items, id:\.self) { item in
					NavigationLink(destination: AdventView(item: item),tag: item,
								selection: $selection) {
						Text(item.name!)
					}
				}
			}
			.onDeleteCommand {
				if
					let sel = self.selection,
					let idx = self.items.firstIndex(of: sel) {
					deleteItems(offsets: [idx])
				}
			}
			.toolbar {
				ToolbarItem {
					Button(action: showSheet) {
						Label("Add a new advent", systemImage: "plus")
					}
				}
			}
			Text("Select an advent to view.")
		}.background(Color.white)
		
			.sheet(isPresented: $presentingAddNewAdventSheet, content: {
				AddAdventView()
			})
	}
	
	private func showSheet() {
		presentingAddNewAdventSheet.toggle()
	}
	
	private func deleteItems(offsets: IndexSet) {
		withAnimation {
			offsets.map { items[$0] }.forEach(viewContext.delete)
			
			do {
				try viewContext.save()
			} catch {
				// Replace this implementation with code to handle the error appropriately.
				// fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
				let nsError = error as NSError
				fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
	}
}
