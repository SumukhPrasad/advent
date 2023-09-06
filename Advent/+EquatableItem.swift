//
//  +EquatableItem.swift
//  Advent
//
//  Created by Sumukh Prasad on 06/09/23.
//

import Foundation

func == (lhs: Item, rhs: Item) -> Bool {
    lhs.id == rhs.id
}
