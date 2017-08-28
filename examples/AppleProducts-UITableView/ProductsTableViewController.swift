//
//  ProductsTableViewController.swift
//  AppleProducts


// * Custom Table View Cell

// 1 - Deisgin the new cell in SToryboard -- DONE
// 2 - Create a subclass of UITableViewCell for the new cell
// 3 - Update cell with UITableViewDataSource


// * Delete Rows
// 1. Edit button on the right
// 2. Delete a row
// 3. Nicely anmation - move the tbale view rows up


// * Move Rows
// 1. Tell the table view that you want to be able to move rows around
// 2. Update the data model && the table view UI
// 3.

import UIKit

class ProductsTableViewController: UITableViewController {

    // MARK: - Data model
    
    var productLines: [ProductLine] = ProductLine.getProductLines()
    
    private let TABLE_VIEW_TITLE = "Apple Store"
    private let TABLE_VIEW_CELL_ID = "ProductCell"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = TABLE_VIEW_TITLE
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        navigationItem.rightBarButtonItem = editButtonItem

    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return productLines.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productLines[section].products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TABLE_VIEW_CELL_ID, for: indexPath) as! ProductTableViewCell
        let product = productLines[indexPath.section].products[indexPath.row]
        cell.product = product
        return cell
    }
    
    // Mulitple Sections
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let productLine = productLines[section]
        return productLine.name
    }
    
    // Delete Rows
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // 1 - delete the product from productLine's products array
        let productLine = productLines[indexPath.section]
        productLine.products.remove(at: indexPath.row)
        
        // 2 - update the table view with new data
        // tableView.reloadData() // bad way, refresh page ? wait for a long time to reload ??
        
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }

    // Moving Cells
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let productToMove = productLines[sourceIndexPath.section].products[sourceIndexPath.row]
        
        // move proudctToMove to destination products
        productLines[destinationIndexPath.section].products.insert(productToMove, at: destinationIndexPath.row)
        
        // delete the productToMove from source products
        productLines[sourceIndexPath.section].products.remove(at: sourceIndexPath.row)
        
    }
    
    // MARK - UITableViewDelegate
    
    var selectedProduct: Product?
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productLine = productLines[indexPath.section]
        let product = productLine.products[indexPath.row]
        
        selectedProduct = product
        
        performSegue(withIdentifier: "ShowProductDetail", sender: nil)
        
    
    }
    
    // MARK - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowProductDetail" {
            let productDetailTVC = segue.destination as! ProductDetailTableViewController
            productDetailTVC.product = selectedProduct
        }
    }
    
    
    
    
    

    
}
