//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Hüseyin BAKAR on 18.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblCad: UILabel!
    @IBOutlet var lblChf: UILabel!
    @IBOutlet var lblGbp: UILabel!
    @IBOutlet var lblJPY: UILabel!
    @IBOutlet var lblUsd: UILabel!
    @IBOutlet var lblTry: UILabel!
    @IBOutlet var btnGetRates: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }

    @IBAction func btnGetRatesClicked(_ sender: Any)
    {
        
        let URL = URL(string: "http://data.fixer.io/api/latest?access_key=4a990ae1cc0ef5a920e4c7e9eeb1123c")!
        
        URLSession.shared.dataTask(with: URL)
            {
            (data, response, error) in
            
           if error != nil
           {
            let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
           }
            else
           {
            
         if data != nil
         {
            do
            {
                let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String,Any>
               
                DispatchQueue.main.async {
                    
                    if let rates = jsonResponse["rates"] as? [String : Any]
                    {
                        if let cad = rates["CAD"] as? Double
                        {
                            self.lblCad.text = String(cad)
                        }
                        
                        if let chf = rates["CHF"] as? Double
                        {
                            self.lblChf.text = String(chf)
                        }
                        
                        if let gbp = rates["GBP"] as? Double
                        {
                            self.lblGbp.text = String(gbp)
                        }
                        
                        if let jpy = rates["JPY"] as? Double
                        {
                            self.lblJPY.text = String(jpy)
                        }
                        
                        if let usd = rates["USD"] as? Double
                        {
                            self.lblUsd.text = String(usd)
                        }
                        
                        if let ytl = rates["TRY"] as? Double
                        {
                            self.lblTry.text = String(ytl)
                        }
                    }
                }
                
            }
            catch
            {
                print("error")
            }
         
          }
            
            /*
            if data != nil
            {
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String,Any>
                    
                    // ASYNC
                    
                    DispatchQueue.main.async {
                        if let rates = jsonResponse["rates"] as? [String : Any]
                        {
                            //print(rates)
                            if let cad = rates["CAD"] as? Double
                            {
                                self.lblCad.text = String(cad)
                            }
                        }
                    }
                }
                catch
                {
                    print("error")
                }
 
            }
             */
            
           }
        
            
            
        }.resume()
    }
    
    
    
}

