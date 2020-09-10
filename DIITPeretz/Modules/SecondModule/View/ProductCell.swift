//
//  ProductCell.swift
//  DIITPeretz
//
//  Created by arsik on 05.09.2020.
//  Copyright © 2020 arsik. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
  
  
  @IBOutlet private weak var productImage: UIImageView!
  @IBOutlet private weak var productName: UILabel!
  @IBOutlet private weak var productDescription: UILabel!
  @IBOutlet private weak var productPrice: UILabel!
  @IBOutlet weak var countOrder: UILabel!
    
    @IBOutlet weak var diminishOrder: UIButton!
    
    @IBOutlet weak var addOrder: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        countOrder.isHidden = true
        diminishOrder.isHidden = true
        addOrder.layer.cornerRadius      = addOrder.frame.height / 2
        addOrder.clipsToBounds           = true
        diminishOrder.layer.cornerRadius = diminishOrder.frame.height / 2
    }
    
    var count = 0
    
    @IBAction func addOrder(_ sender: Any) {
        if count == 0  {
            diminishOrder.isHidden = false
            countOrder.isHidden = false
        }
        count = count + 1
        countOrder.text = String(count)
}
    @IBAction func diminishOrder(_ sender: Any) {
        //guard count == 0 else { return }
        count = count - 1
        countOrder.text = String(count)
        if count < 1   {
            countOrder.isHidden    = true
            diminishOrder.isHidden = true
        }
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        productImage.image = nil
    }
    
    func setup(with model: ProductModel) {
        
        backgroundColor = UIColor(red: 0.14, green: 0.14, blue: 0.14, alpha: 1)
        productName.text = model.name
        productDescription.text = model.description
        productPrice.text = model.price.description
        
        guard let url = URL(string: model.image) else { return }
    
        DispatchQueue.global().async {
            
            do {
                let imageData = try Data(contentsOf: url)
                let image = UIImage(data: imageData)
                
                DispatchQueue.main.async {
                    self.productImage.image = image
                }
            } catch (let error) {
                print("image don't downloaded with: \(error.localizedDescription)")
            }
        }
    }
}
