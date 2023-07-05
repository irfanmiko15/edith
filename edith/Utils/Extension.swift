//
//  Extension.swift
//  edith
//
//  Created by Irfan Dary Sujatmiko on 04/07/23.
//

import Foundation
import SwiftUI

extension String {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

