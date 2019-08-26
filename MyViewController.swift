import UIKit

final class MyViewController: UIViewController {

    // MARK: - Programmatic UI
    
    lazy var tableView: UITableView! = {
        let t = UITableView(frame: view.frame, style: .plain)
        t.dataSource = self
        t.delegate = self
        // register reusable headers, just like you would register reusable cells
        t.register(CustomSectionHeaderView.self,
                   forHeaderFooterViewReuseIdentifier: CustomSectionHeaderView.reuseIdentifier)
        t.register(CustomDoubleSectionHeaderView.self,
                   forHeaderFooterViewReuseIdentifier: CustomDoubleSectionHeaderView.reuseIdentifier)
        return t
    }()
    
    // MARK: - Data Source
    
    var sectionTitles: [String] = ["Hello there",
                                   "Lorem Ipsum",
                                   "According to all known laws of aviation, there is no way a bee should be able to fly. Its wings are too small to get its fat little body off the ground. The bee, of course, flies anyway because bees don't care what humans think is impossible."]
    
    var doubleSectionTitles: [String] = ["Goodbye Forever and ever and ever",
                                         "Pasteus Holdicus",
                                         "- Jerry Seinfeld, 2007"]
    
    var sectionTitleColors: [UIColor] = [.red, .yellow, .orange]
    
    // MARK: - Lifecycle Methods
    
    override func loadView() {
        super.loadView()
        tableView.setupToFill(superView: view)
    }
}

extension MyViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension MyViewController: UITableViewDelegate {
    
    // dequeue and use reusable headers, just like you would reusable cells
    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        // return customHeader(tableView, viewForHeaderInSection: section)
        
        return customDoubleHeader(tableView, viewForHeaderInSection: section)
    }
    
    /* Helper methods for making cells in each subclass */
    private func customHeader(_ tableView: UITableView,
                              viewForHeaderInSection section: Int) -> CustomSectionHeaderView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomSectionHeaderView.reuseIdentifier) as? CustomSectionHeaderView else { return nil }
        header.customTextLabel.text = sectionTitles[section]
        header.customTextLabel.backgroundColor = sectionTitleColors[section]
        return header
    }
    
    private func customDoubleHeader(_ tableView: UITableView,
                              viewForHeaderInSection section: Int) -> CustomDoubleSectionHeaderView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomDoubleSectionHeaderView.reuseIdentifier) as? CustomDoubleSectionHeaderView else { return nil }
        header.customTextLabel.text = sectionTitles[section]
        header.secondaryTextLabel.text = doubleSectionTitles[section]
        header.customTextLabel.backgroundColor = sectionTitleColors[section]
        header.secondaryTextLabel.backgroundColor = sectionTitleColors[section]
        return header
    }
}
