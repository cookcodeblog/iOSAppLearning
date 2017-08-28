//
//  ProductDetailTableViewController.swift
//  AppleProducts


import UIKit

class ProductDetailTableViewController: UITableViewController {

    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleTextField: UITextField!
    @IBOutlet weak var productDescriptionTextView: UITextView!
    
    
    var product: Product? // ProductLine.getProductLines()[0].products[0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Edit Product"
        
        // Set all properties
        
        productImageView.image = product?.image
        productTitleTextField.text = product?.title
        productTitleTextField.delegate = self
        productDescriptionTextView.text = product?.description
        
    }
    
    // MARK - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.section == 0 && indexPath.row == 0 {
            return indexPath
        } else {
            return nil
        }
    }
}

extension ProductDetailTableViewController: UITextFieldDelegate {
    
    // dismiss keyboard when press return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension ProductDetailTableViewController {
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        productDescriptionTextView.resignFirstResponder()
        productTitleTextField.resignFirstResponder()
    }
}
