//
//  ViewController.swift
//  დავალება15
//
//  Created by Tazo Japaridze on 5/4/20.
//  Copyright © 2020 Tbc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var a=1
    let step:Float = 10
    
    var greentoponstraint : NSLayoutConstraint!
    var greenleadingconstraint : NSLayoutConstraint!
    var greenviewheight : NSLayoutConstraint!
    var bluetopconstraint :NSLayoutConstraint!
    var blueleadingconstraing :NSLayoutConstraint!
    var blueviewheight :NSLayoutConstraint!
    var spacing = 50
    var spacing2 = 50
    var secondspacing = 220
    
    
    let greenview = UIView()
    let blueview = UIView()
    let slider = UISlider()
    var textfield1 = UITextField()
    let handleTap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
    
    
    

    var textfield2 = UITextField()
    let button4:UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints=false
        b.setTitle("change", for: .normal)
        b.addTarget(self, action: #selector(Onbutton5), for: .touchUpInside)
        b.backgroundColor = .black
        return b
        
    }()
    
    let button3 :UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle(">", for: .normal)
        b.addTarget(self, action: #selector(Onbutton3), for: .touchUpInside)
        b.backgroundColor = .red
        b.layer.cornerRadius=10
        
        return b
    }()
    let button2 :UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("<", for: .normal)
        b.addTarget(self, action: #selector(Onbutton2), for: .touchUpInside)
        b.backgroundColor = .black
        b.layer.cornerRadius=10
        
        return b
        
    }()
    let button1 :UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("t", for: .normal)
        b.addTarget(self, action: #selector(Onbutton1), for: .touchUpInside)
        b.backgroundColor = .blue
        b.layer.cornerRadius=10
        
        return b
        
    }()
    let button : UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("B", for: .normal)
        b.addTarget(self, action: #selector(Onbutton), for: .touchUpInside)
        b.backgroundColor = .blue
        b.layer.cornerRadius=10
        
        return b
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        greenview.backgroundColor = .green
        greenview.translatesAutoresizingMaskIntoConstraints = false
       // greenview.addGestureRecognizer(handleTap)
        //greenview.isUserInteractionEnabled=true
        //self.view.addSubview(greenview)
        //uzzzzz
        greenview.isUserInteractionEnabled = true
        blueview.isUserInteractionEnabled = true
               
        let viewgsetureleft = UITapGestureRecognizer(target: self, action: #selector(self.firsttap))
        let viewgsetureright = UITapGestureRecognizer(target: self, action: #selector(self.secondtap))
               
        greenview.addGestureRecognizer(viewgsetureleft)
        blueview.addGestureRecognizer(viewgsetureright)
               
        //zzzzzz
        blueview.backgroundColor = .blue
        blueview.translatesAutoresizingMaskIntoConstraints = false
        slider.translatesAutoresizingMaskIntoConstraints  = false
        view.addSubview(greenview)
        view.addSubview(blueview)
        view.addSubview(slider)
        view.addSubview(button)
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        view.addSubview(textfield1)
        view.addSubview(textfield2)
        view.addSubview(button4)
        textfield1.translatesAutoresizingMaskIntoConstraints = false
        textfield1.placeholder=("H")
        textfield2.translatesAutoresizingMaskIntoConstraints=false
        textfield2.placeholder="W"
        greentoponstraint=NSLayoutConstraint(item: greenview, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 50)
        greenleadingconstraint=NSLayoutConstraint(item: greenview, attribute: .leading, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50)
        //greenviewheight=NSLayoutConstraint()
        bluetopconstraint=NSLayoutConstraint(item: blueview, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 50)
        blueleadingconstraing=NSLayoutConstraint(item: blueview, attribute: .leading, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 220)
        
        slider.minimumValue=50
        slider.maximumValue=100
        slider.isContinuous=true
        slider.addTarget(self, action: #selector(self.slidervaluechanged(_:)), for: .valueChanged)
        self.view.addConstraint(greentoponstraint)
        self.view.addConstraint(greenleadingconstraint)
        self.view.addConstraint(bluetopconstraint)
        self.view.addConstraint(blueleadingconstraing)
        NSLayoutConstraint.activate([
            
           // greenview.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 50),
          //  greenview.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 50),
          //  greenview.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -200),
            greenview.widthAnchor.constraint(equalToConstant: 130),
            greenview.heightAnchor.constraint(equalToConstant: 100),
           // blueview.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 50),
          //  blueview.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 220),
           // blueview.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            blueview.heightAnchor.constraint(equalToConstant: 100),
            blueview.widthAnchor.constraint(equalToConstant: 130),
            slider.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -50),
            slider.topAnchor.constraint(equalTo: button.bottomAnchor,constant: 0),
            slider.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 50),
            
            textfield1.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor ,constant: 250),
            
            textfield1.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 50),
            textfield1.heightAnchor.constraint(equalToConstant: 40),
            textfield1.widthAnchor.constraint(equalToConstant: 40),
            textfield2.leadingAnchor.constraint(equalTo: textfield1.leadingAnchor,constant: 50),
            textfield2.topAnchor.constraint(equalTo: textfield1.topAnchor),
            textfield2.heightAnchor.constraint(equalToConstant: 40),
            textfield2.widthAnchor.constraint(equalToConstant: 40),
            button4.topAnchor.constraint(equalTo: textfield2.topAnchor),
            button4.leadingAnchor.constraint(equalTo: textfield2.leadingAnchor,constant: 140),
            button4.heightAnchor.constraint(equalToConstant: 40),
            button4.widthAnchor.constraint(equalToConstant: 100)
          
            
            
        
        
        ])
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 180),
    
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -50),
            button.widthAnchor.constraint(equalToConstant: 30),
            button.heightAnchor.constraint(equalToConstant: 30),
            button1.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -150),
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 180),
            button1.heightAnchor.constraint(equalToConstant: 30),
            button1.widthAnchor.constraint(equalToConstant: 30),
            button2.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -100),
            button2.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 80),
            button2.heightAnchor.constraint(equalToConstant: 30),
            button2.widthAnchor.constraint(equalToConstant: 30),
            button3.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -100),
            button3.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 280),
            button3.heightAnchor.constraint(equalToConstant: 30),
            button3.widthAnchor.constraint(equalToConstant: 30),
            
        
        
        
        
        ])
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    @objc func Onbutton(){
        if a == 1{
        spacing += 10
        greentoponstraint.constant = CGFloat(spacing)
            }
        if a == 2{
            spacing += 10
            bluetopconstraint.constant = CGFloat(spacing)
            
            
        }
       
    }
    @objc func Onbutton1(){
        if a == 1{
            spacing -= 10
            greentoponstraint.constant=CGFloat(spacing)}
            
        if a == 2{
            spacing -= 10
            bluetopconstraint.constant=CGFloat(spacing)
            
            
        }
        
    }
    @objc func Onbutton2(){
        if a==1{
            spacing2 -= 10
            greenleadingconstraint.constant=CGFloat(spacing2)
            }
        if a==2{
            secondspacing -= 10
            blueleadingconstraing.constant=CGFloat(secondspacing)
            
        }
    }
    @objc func Onbutton3(){
        if a == 1 {
             spacing2 += 10
        greenleadingconstraint.constant=CGFloat(spacing2)
           }
        if a == 2{
            secondspacing += 10
            blueleadingconstraing.constant=CGFloat(secondspacing)
            
        }
    }
        
    @objc func Onbutton5(){
        
        if a == 1{
            
            if let ab = Int(textfield1.text!){
                    
                let constraint=greenview.heightAnchor.constraint(equalToConstant: CGFloat(ab))
                    constraint.isActive = true
                    print("zzzz")
                    textfield1.text=""
                    
                
                
            }
           if let abc = Int(textfield2.text!){
                let constraint=greenview.widthAnchor.constraint(equalToConstant: CGFloat(abc))
                  constraint.isActive = true
                    textfield2.text=""
        }
        }
        if a == 2{
            
            if let ab = Int(textfield1.text!){
                let constraint1=blueview.heightAnchor.constraint(equalToConstant: CGFloat(ab))
                constraint1.isActive = true
                    
                
                
            }
            if let abc = Int(textfield2.text!){
                let constraint=blueview.widthAnchor.constraint(equalToConstant: CGFloat(abc))
                constraint.isActive = true
                
                
            }
            
            
        }
        
        
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer){
        print("sgsg")
        
    }
    //chhchch
    
    var tapview = UIView()
    
    @objc func firsttap(){
        tapview = greenview
        a=1
        
        print(a)
    }
    
    @objc func secondtap(){
        a=2
        tapview = blueview
       
        print(a)
    }
    
    @objc func slidervaluechanged(_ sender:UISlider!){
        
        //aq daaxloebit eseti ragac mindoda mara bagavs :/
        //da es bugi xelit ro chawer meore mesamejer mashinacaa
        

        let a = sender.value
        print(sender.value)
        NSLayoutConstraint.activate([
            greenview.widthAnchor.constraint(equalToConstant: CGFloat(a*2)),
            greenview.heightAnchor.constraint(equalToConstant: CGFloat(a*2.2))
            
        
        
        ])
        
       print("zz")
    }
}

