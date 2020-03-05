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
        let const = [
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            topAnchor.constraint(equalTo: superView.topAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor),
        ]
        NSLayoutConstraint.activate(const)
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
        // setup individual UIView traits and properties
        customTextLabel.numberOfLines = 0
        secondaryTextLabel.numberOfLines = 0
        customTextLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        secondaryTextLabel.font = UIFont.italicSystemFont(ofSize: 15.0)
        
        super.init(reuseIdentifier: reuseIdentifier)
        
        // build constraints
        customTextLabel.translatesAutoresizingMaskIntoConstraints = false
        secondaryTextLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(customTextLabel)
        contentView.addSubview(secondaryTextLabel)
        
        let const = [
            customTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0),
            customTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0),
            customTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0),
            secondaryTextLabel.topAnchor.constraint(equalTo: customTextLabel.bottomAnchor, constant: 8.0),
            secondaryTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0),
            secondaryTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0),
            contentView.bottomAnchor.constraint(equalTo: secondaryTextLabel.bottomAnchor, constant: 8.0),
        ]
        NSLayoutConstraint.activate(const)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("not implemented")
    }
}
