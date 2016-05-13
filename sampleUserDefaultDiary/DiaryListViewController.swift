//
//  DiaryListViewController.swift
//  sampleUserDefaultDiary
//
//  Created by Eriko Ichinohe on 2016/05/13.
//  Copyright © 2016年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class DiaryListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var diaryList: UITableView!
    
    var diaryListTmp = [["title":"title1","date":"2016-05-13","category":"cebu","diary":"日記1"],["title":"title2","date":"2016-05-14","category":"cebu","diary":"日記2"],["title":"title3","date":"2016-05-15","category":"cebu","diary":"日記3"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //UserDefaultから保存した配列を取り出す
        var myDefault = NSUserDefaults.standardUserDefaults()
        
        //        //UserDefaultを全削除する
        //        var appDomain:String = NSBundle.mainBundle().bundleIdentifier!
        //        myDefault.removePersistentDomainForName(appDomain)
        
        if (myDefault.objectForKey("diaryList") != nil){
            //データを呼び出して
            diaryListTmp = myDefault.objectForKey("diaryList") as! [Dictionary]
        }
        
        print(diaryListTmp)
    
    
    }
    
    // 行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diaryListTmp.count
    }
    
    // 表示するセルの中身
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: .Default, reuseIdentifier: "myCell")
        
        var title:String = diaryListTmp[indexPath.row]["title"]!
        
        //TODO:日付＋タイトルの書式で表示しましょう
        cell.textLabel!.text = "\(title)"
        
        return cell
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
