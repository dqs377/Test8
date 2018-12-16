//
//  UpdateViewController.swift
//  Test8
//
//  Created by 1on 2018/12/16.
//  Copyright © 2018 1. All rights reserved.
//

import UIKit

class UpdateViewController: UIViewController {

   
    var tea:Teacher?
    var stu:Student?
    var stus:[Student]?
    var teas:[Teacher]?
    let textField:UITextField = UITextField.init();
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red;
        
        textField.frame = CGRect.init(x: 100, y: 100, width: 100, height: 30);
        textField.borderStyle = .roundedRect;
        textField.placeholder = "请输入文字"
        self.view.addSubview(textField);
        
        
        let btn:UIButton = UIButton.init(frame: CGRect.init(x: 100, y: 150, width: 100, height: 20));
        btn.addTarget(self, action: #selector(tap), for: .touchUpInside);
        self.view.addSubview(btn);
     
        
        if self.tea != nil {
            textField.text = tea?.course;
            btn.setTitle("修改", for: .normal)
            
        }else if self.stu != nil{
            textField.text = stu?.name;
            btn.setTitle("修改", for: .normal)
        }else
        {
            btn.setTitle("增加", for: .normal)
        }
        
        
        
        
    }
    @objc func tap()  {
        if self.tea != nil {
           tea?.course = textField.text ;
           
            
        }else if self.stu != nil{
           stu?.name = textField.text;

        }else
        {
            if self.stus != nil {
            let stu:Student = Student.init(textField.text!);
                self.stus?.append(stu);
                
            }else{
               self.teas?.append(Teacher.init(textField.text!));
            }
           
        }
        
        self.dismiss(animated: true, completion: nil);
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
