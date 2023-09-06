//
//  AddAdventView.swift
//  Advent
//
//  Created by Sumukh Prasad on 06/09/23.
//

import SwiftUI

struct AddAdventView: View {
	@Environment(\.dismiss) private var dismiss
	@Environment(\.managedObjectContext) private var viewContext
	
	@State var name: String = ""
	@State var date: Date = Date.now
	@State private var showAlert = false
	
	var body: some View {
		VStack(spacing: 10) {
			Text("Add a new advent")
				.font(.title)
			Divider()
			
			TextField("Advent", text: $name, prompt: Text("Name your advent!")).textFieldStyle(RoundedBorderTextFieldStyle()).font(.title2)
			
			DatePicker("End date", selection: $date)
						 .datePickerStyle(GraphicalDatePickerStyle())
			
			HStack {
				Spacer()
				Button("Cancel") {
					// Cancel saving and dismiss.
					dismiss()
				}
				.foregroundColor(.red)
				Button("Add advent") {
					let newItem = Item(context: viewContext)
					newItem.timestamp = Date.now
					newItem.name = name
					newItem.enddate = date
					do {
						try viewContext.save()
					} catch {
						showAlert = true
						let nsError = error as NSError
						fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
					}
					dismiss()
				}
				.disabled(name.isEmpty)
			}
			.alert(isPresented: $showAlert) {
			   Alert(
				  title: Text("An error occurred."),
				  message: Text("Advent could not save your entry.")
			   )
			}
		}.padding(20)
	}
	
}

struct AddAdventView_Previews: PreviewProvider {
	static var previews: some View {
		AddAdventView()
	}
}
