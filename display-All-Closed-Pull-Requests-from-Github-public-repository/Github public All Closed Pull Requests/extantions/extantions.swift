//
//  extantions.swift
//  Github public All Closed Pull Requests
//
//  Created by Admin on 03/08/22.
//

import Foundation
import UIKit
    
extension UIImage {
  convenience init?(url: URL?) {
    guard let url = url else { return nil }
            
    do {
      self.init(data: try Data(contentsOf: url))
    } catch {
      print("Cannot load image from url: \(url) with error: \(error)")
      return nil
    }
  }
}
