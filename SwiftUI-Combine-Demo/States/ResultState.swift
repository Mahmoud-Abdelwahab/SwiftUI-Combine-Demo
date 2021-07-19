//
//  ResultState.swift
//  SwiftUI-Combine-Demo
//
//  Created by Mahmoud Abdul-Wahab on 19/07/2021.
//

import Foundation

enum ResultState{
    case loading
    case Success([Article])
    case Failed(error: Error)
}
