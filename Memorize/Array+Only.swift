//
//  Array+Only.swift
//  Memorize
//
//  Created by Augusto Spinelli on 01/08/20.
//  Copyright © 2020 Augusto Spinelli. All rights reserved.
//

import Foundation

extension Array {
    var only : Element? {
        count == 1 ? first : nil
    }
}
