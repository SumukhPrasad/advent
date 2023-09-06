//
//  +ItemFormatter.swift
//  Advent
//
//  Created by Sumukh Prasad on 06/09/23.
//

import Foundation

let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()
