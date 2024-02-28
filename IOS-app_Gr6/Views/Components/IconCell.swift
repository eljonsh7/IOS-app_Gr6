import UIKit

class IconCell: UICollectionViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    
    func configure(image: UIImage) {
        iconImageView.image = image
    }
}
