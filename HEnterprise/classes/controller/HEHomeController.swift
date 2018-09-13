//
//  HEHomeController.swift
//  HEnterprise
//
//  Created by apple on 2018/8/22.
//  Copyright © 2018年 wz. All rights reserved.
//

import UIKit

class HEHomeController: HEBaseController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var view_top: UIView!
    @IBOutlet weak var lab_zb: UILabel!
    @IBOutlet weak var lab_pfl: UILabel!
    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let identifier = "collectionCellId"
    
    override func setupUI() {
        super.setupUI()
        segmented.addTarget(self, action: #selector(segmentDidchange(_:)),
                            for: .valueChanged)
        view_top.backgroundColor = UIColor.init(patternImage: UIImage(named: "home_top_bg")!)
        
        setupCollectionView()
    }
    
    func setupCollectionView(){
        collectionView?.delegate = self
        collectionView?.dataSource = self
        // 注册cell
        collectionView?.register(UINib.init(nibName: "HEHomeYzCell", bundle: nil), forCellWithReuseIdentifier: identifier)
       
    }
    
    override func loadData() {
        super.loadData()
    }
    
    //状态改变之后的执行方法
    @objc func segmentDidchange(_ sender: UISegmentedControl){
        //获得选项的索引
        print(segmented.selectedSegmentIndex)
        //获得选择的文字
        print(segmented.titleForSegment(at: segmented.selectedSegmentIndex) ?? "aa")
    }
    


    @IBAction func onClickMessage(_ sender: Any) {
        print("点击消息按钮")
        self.performSegue(withIdentifier: "homeMyMessageSegue", sender: self)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:HEHomeYzCell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! HEHomeYzCell
        
        cell.lab_wrw_name.text = "SO2"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func armColor()->UIColor{
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
  
}
