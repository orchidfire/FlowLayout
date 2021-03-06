import UIKit
import ReusableCell
/**
 * CollectionView related
 */
extension HorView {
    /**
     * Num of items in table
     */
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       items.count
    }
    /**
     * Respawns cells
     */
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell: HorCell = {
         switch indexPath.row {
         case HorView.CellType.primary.idx:
            let cell: PrimaryHorCell = collectionView.dequeueReusableCell(indexPath: indexPath)
            let imageURLStr: String = "https://rawgit.com/stylekit/img/master/" + "pic_1_thumb.png"
            _ = imageURLStr
            let urls: [String] = .init(repeating: "🎉", count: 11) // ["a","b","c","d","a","b","c","d","a","b","c"]
            cell.data = PrimaryCellData(thumbURLS: urls) // When you set this, the data is applied to the UI
            return cell
         case HorView.CellType.secondary.idx:
            guard let cell: SecondaryHorCell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondaryHorCell.id, for: indexPath as IndexPath) as? SecondaryHorCell else { fatalError("err") }
            return cell
         case HorView.CellType.tertiary.idx:
            guard let cell: TertiaryHorCell = collectionView.dequeueReusableCell(withReuseIdentifier: TertiaryHorCell.id, for: indexPath as IndexPath) as? TertiaryHorCell else { fatalError("err") }
            return cell
         default:
            fatalError("err: \(indexPath.row)")
         }
      }()
      // we add onScroll to every cell
      cell.onScroll = onVerticalScroll // Attach scoll-call-back-closure
//      cell.onItemSelect = {indexPath in Swift.print("HorView.cell.onItemSelect: \(indexPath) in cellIdx:\(self.currentPageIndex)")}//callback for cell click
      return cell
    }
}
/**
 * This method is interesting, might be able to have different sized cells in the same collectionview
 */
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: self.frame.width, height: self.frame.height - 50)
//    }
