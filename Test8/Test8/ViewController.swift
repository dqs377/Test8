//
//  ViewController.swift
//  Test8
//
//  Created by 1on 2018/12/16.
//  Copyright © 2018 1. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    
    var students:[Student] = [Student].init();
    var teachers:[Teacher] = [Teacher].init();
    var table:UITableView = UITableView.init();
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self;
        table.dataSource = self;
        table.frame = CGRect.init(x: 0, y: 64, width: self.view.bounds.width, height: self.view.bounds.height - 200);
        self.view.addSubview(table);
        
        let courses:[String] = ["语文","数学","英语"];
        for i in 0...2 {
            let teacher:Teacher = Teacher(courses[i]);
            self.teachers.append(teacher);
        }
        
        let names:[String] = ["小明","小花","小李","小季","小雪"];
        for j in 0...4 {
            let student:Student = Student(names[j]);
            self.students.append(student);
        }
        
       
        let btn1:UIButton = UIButton.init(frame: CGRect.init(x: 100, y: self.table.frame.height + self.table.frame.origin.y + 20, width: 100, height: 20));
        btn1.addTarget(self, action: #selector(addStu), for: .touchUpInside);
        self.view.addSubview(btn1);
        
        
        let btn2:UIButton = UIButton.init(frame: CGRect.init(x: 250, y: self.table.frame.height + self.table.frame.origin.y + 20, width: 80, height: 20));
        btn2.addTarget(self, action: #selector(addTea), for: .touchUpInside);
        self.view.addSubview(btn2);
        
        
        
    }
    @objc func addTea() {
         let vc:UpdateViewController = UpdateViewController();
        vc.teas = self.teachers;
          self.present(vc, animated: true, completion: nil);
    }
    @objc func addStu() {
          let vc:UpdateViewController = UpdateViewController();
        vc.stus = self.students;
          self.present(vc, animated: true, completion: nil);
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        table.reloadData()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.teachers.count;
        }
        return self.students.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell");
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell");
        }
        
        if indexPath.section == 0 {
            let tea:Teacher = self.teachers[indexPath.row];
            cell?.textLabel?.text = tea.course;
        }else
        {
            let stu:Student = self.students[indexPath.row];
            cell?.textLabel?.text = stu.name;
        }
        
        return cell!;
        
    }
 
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "老师"
        }
        return "学生";
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
       //设置修改按钮
        let updateAction:UITableViewRowAction = UITableViewRowAction.init(style: .default, title: "修改") { (action, indexPath) in
            let vc:UpdateViewController = UpdateViewController();
            
            if indexPath.section == 0{
                let tea:Teacher = self.teachers[indexPath.row];
                vc.tea = tea;
                
            }else{
                 let stu:Student = self.students[indexPath.row];
                vc.stu = stu;
                
            }
            
            self.present(vc, animated: true, completion: nil);
            
        };
        updateAction.backgroundColor = UIColor.green;
        //设置删除按钮
        let deleteAction:UITableViewRowAction = UITableViewRowAction.init(style:.default, title: "删除") { (action, indexPath) in
            if indexPath.section == 0{
                let tea:Teacher = self.teachers[indexPath.row];
                self.teachers.remove(at: self.teachers.firstIndex(of: tea)!);
                
            }else{
                let stu:Student = self.students[indexPath.row];
                self.students.remove(at: self.students.firstIndex(of: stu)!);
                
            }
            self.table.reloadData()
        };
        deleteAction.backgroundColor = UIColor.red;
        return [updateAction,deleteAction];
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }

}

