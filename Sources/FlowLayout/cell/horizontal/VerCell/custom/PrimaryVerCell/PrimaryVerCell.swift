import UIKit
import With
/**
 * Primary vertical cell
 */
class PrimaryVerCell: VerCell {
   override class var id: String { "\(PrimaryHorCell.self)" } // Stores the deque cell id
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.backgroundColor = .clear
   }
}
