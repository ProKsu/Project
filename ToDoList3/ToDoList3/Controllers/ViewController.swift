//
//  ViewController.swift
//  ToDoList3
//
//  Created by Ksush Shishk on 10.07.2019.
//  Copyright © 2019 A. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet weak var textField: UITextField!
    var bottomCustomButton = CustomButton()
    var middleCustomButton = CustomButton()
    var topCustomButton = CustomButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupBottonConstrains()
        addActionToButton()
        bottomCustomButton.setTitle("Convert", for: .normal)
        middleCustomButton.setTitle("Notes", for: .normal)
        topCustomButton.setTitle("Google Maps", for: .normal)
    
    }
    
    func setupBottonConstrains(){
        view.addSubview(bottomCustomButton)
        bottomCustomButton.translatesAutoresizingMaskIntoConstraints = false
        bottomCustomButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
        bottomCustomButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        bottomCustomButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomCustomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        
        view.addSubview(middleCustomButton)
        middleCustomButton.translatesAutoresizingMaskIntoConstraints = false
        middleCustomButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
        middleCustomButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        middleCustomButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        middleCustomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -250).isActive = true
        
        
        view.addSubview(topCustomButton)
        topCustomButton.translatesAutoresizingMaskIntoConstraints = false
        topCustomButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
        topCustomButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        topCustomButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topCustomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -450).isActive = true
        
    }
    
    func addActionToButton(){
        bottomCustomButton.addTarget(self, action: #selector(buttonTappedForButtomButton), for: .touchUpInside)
        middleCustomButton.addTarget(self, action: #selector(buttonTappedForMiddleButton),     for: .touchUpInside)
        topCustomButton.addTarget(self, action: #selector(buttonTappedForUpButton), for: .touchUpInside)
        
    }
    
    
    @objc func buttonTappedForButtomButton(){
        bottomCustomButton.shake()
        
    }
    
    
    @objc func buttonTappedForMiddleButton(){
        
        middleCustomButton.shake()
        present(middleCustomButton)
        
    }
 
    
    @objc func buttonTappedForUpButton(){
        topCustomButton.shake()
        mapsButton(bottomCustomButton)
    }
    
    func mapsButton(_ sender: UIButton)  {
        
        let path = "http://maps.apple.com/?q="
        let searchQuery = textField.text!.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        let url = URL(string: path+searchQuery)!
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func present(_ sender: UIButton){
        
        //let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
//        let vc = storyboard?.instantiateViewController(withIdentifier: "DataViewController")
//            as? TableViewController
        
        let nav = storyboard?.instantiateViewController(withIdentifier: "Navigator") as? UINavigationController
        
       //  navigationController?.pushViewController(vc!, animated: true)
        
        self.present(nav!, animated: true, completion: nil)

        
//          navigationController?.pushViewController(vc!, animated: true)
        
         //navigationController?.pushViewController(vc!, animated: true)
        
//        self.navigationController?.pushViewController(vc!, animated: true)
        
        
    }
    
}

