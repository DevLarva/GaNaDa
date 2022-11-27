//
//  WordRow.swift
//  GaNaDa
//
//  Created by 백대홍 on 2022/11/27.
//

import SwiftUI

struct WordRow: View {
  let word: Word
  static let releaseFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
  }()

  var body: some View {
    VStack(alignment: .leading) {
      word.word.map(Text.init)
        .font(.title)
      HStack {
        word.mean.map(Text.init)
          .font(.caption)
        Spacer()
        word..map { Text(Self.releaseFormatter.string(from: $0)) }
          .font(.caption)
      }
    }
  }
}
