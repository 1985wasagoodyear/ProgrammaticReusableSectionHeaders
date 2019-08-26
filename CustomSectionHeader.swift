/*
 CustomSectionHeaderView demonstrates a filling single UIView
 CustomDoubleSectionHeaderView demonstrates a more complex UIView with multiple subviews
*/


import UIKit

/* helper method for constraints,
 makes any view fill up the entirety of its superview */
extension UIView {
    func setupToFill(superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        superView.addSubview(self)
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}

/* basic reusable UITableViewHeaderFooterView for headers */
final class CustomSectionHeaderView: UITableViewHeaderFooterView {
    
    static let reuseIdentifier: String = String(describing: self)
    
    var customTextLabel: UILabel
    
    override init(reuseIdentifier: String?) {
        customTextLabel = UILabel()
        super.init(reuseIdentifier: reuseIdentifier)
        customTextLabel.setupToFill(superView: contentView)
        customTextLabel.numberOfLines = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("not implemented")
    }
}

/* more complex, reusable UITableViewHeaderFooterView for headers */
final class CustomDoubleSectionHeaderView: UITableViewHeaderFooterView {
    
    static let reuseIdentifier: String = String(describing: self)
    
    var customTextLabel: UILabel
    var secondaryTextLabel: UILabel
    
    override init(reuseIdentifier: String?) {
        customTextLabel = UILabel()
        secondaryTextLabel = UILabel()
        super.init(reuseIdentifier: reuseIdentifier)
        
        // build constraints
        customTextLabel.translatesAutoresizingMaskIntoConstraints = false
        secondaryTextLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(customTextLabel)
        contentView.addSubview(secondaryTextLabel)
        customTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        customTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        customTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        customTextLabel.bottomAnchor.constraint(equalTo: secondaryTextLabel.topAnchor).isActive = true
        secondaryTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        secondaryTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        secondaryTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        // setup individual UIView traits and properties
        customTextLabel.numberOfLines = 0
        secondaryTextLabel.numberOfLines = 0
        customTextLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        secondaryTextLabel.font = UIFont.italicSystemFont(ofSize: 15.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("not implemented")
    }
}
