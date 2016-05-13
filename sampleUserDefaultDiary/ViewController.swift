//
//  ViewController.swift
//  sampleUserDefaultDiary
//
//  Created by Eriko Ichinohe on 2016/05/13.
//  Copyright © 2016年 Eriko Ichinohe. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var txtTitle: UITextField!
    
    @IBOutlet weak var txtDate: UITextField!
    
    @IBOutlet weak var txtCategory: UITextField!
    
    @IBOutlet weak var txtDiary: UITextView!
    
    @IBOutlet weak var btnSave: UIButton!
    
    var diaryList = [["title":"title1","date":"2016-05-13","category":"cebu","diary":"日記1"],["title":"title2","date":"2016-05-14","category":"cebu","diary":"日記2"],["title":"title3","date":"2016-05-15","category":"cebu","diary":"日記3"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        //UserDefaultから保存した配列を取り出す
        var myDefault = NSUserDefaults.standardUserDefaults()
        
//        //UserDefaultを全削除する
//        var appDomain:String = NSBundle.mainBundle().bundleIdentifier!
//        myDefault.removePersistentDomainForName(appDomain)
//        
       
        if (myDefault.objectForKey("diaryList") != nil){
            //データを呼び出して
            diaryList = myDefault.objectForKey("diaryList") as! [Dictionary]
        }
        
        print(diaryList)

    }

    @IBAction func tapBtnSave(sender: UIButton) {
        
        //タイトル,日付,カテゴリー、日記を追加
        diaryList.append(["title":txtTitle.text!,"date":txtDate.text!,"category":txtCategory.text!,"diary":txtDiary.text!])
        
        print(diaryList)
        
        
        //UserDefaultに保存
        //ユーザーデフォルトを用意する
        var myDefault = NSUserDefaults.standardUserDefaults()
        
        //データを書き込んで
        myDefault.setObject(diaryList, forKey: "diaryList")
        
        //即反映させる
        myDefault.synchronize()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

