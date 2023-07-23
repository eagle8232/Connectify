//
//  MessageCell.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 22.07.23.
//

import Foundation

struct MessageCell: Identifiable, Equatable {
    let id = UUID()
    let date = Date()
    let text: String
    let isSent: MessageStatus
    let isYou: Bool
}
