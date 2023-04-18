//
//  DateFormatter+Extras.swift
//  PetPal
//
//  Created by Taylor Terry on 4/11/23.
//

import Foundation

extension DateFormatter {
    static let eventTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()
}
