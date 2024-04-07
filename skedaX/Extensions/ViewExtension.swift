//
//  ViewExtension.swift
//  skedaX
//
//  Created by Sanjai Balajee on 18/02/24.
//
import SwiftUI
extension View {

  func hapticFeedbackOnTap(style: UIImpactFeedbackGenerator.FeedbackStyle = .light) -> some View {
    self.onTapGesture {
      let impact = UIImpactFeedbackGenerator(style: style)
      impact.impactOccurred()
    }
  }

}
