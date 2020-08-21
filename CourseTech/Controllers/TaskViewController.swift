//
//  TaskViewController.swift
//  CourseTech
//
//  Created by Tyler Higgs on 8/8/20.
//  Copyright © 2020 Tyler Higgs. All rights reserved.
//

import UIKit

class TaskViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let rightBarButton: UIBarButtonItem = {
        let b = UIBarButtonItem(title: "+", style: .plain, target: nil, action: #selector(addTask(_:)))
        b.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)], for: .normal)
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = #colorLiteral(red: 0.5176470588, green: 0.662745098, blue: 0.6745098039, alpha: 1)
        
        collectionView?.register(TaskCell.self, forCellWithReuseIdentifier: "bruh")
        collectionView?.alwaysBounceVertical = true
        
        navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.title = "Tasks"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Futura", size: 25)!, NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationItem.rightBarButtonItem = rightBarButton
    }

    
    
    @objc private func addTask(_ sender: UIBarButtonItem) {
        print("pressed")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "bruh", for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Int(view.frame.width)
        return CGSize(width: width, height: K.taskViewHeight)
    }
}

class TaskCell: BaseCell {
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.text = "Job Type"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "description"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        return label
    }()
    
    let addButton: UIButton = {
        let b = UIButton()
        b.setTitle("+", for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        b.setTitleColor(#colorLiteral(red: 0.0139832478, green: 0.4739948511, blue: 0.9903718829, alpha: 1), for: .normal)
        return b
    }()
    
    let checkButton: UIButton = {
        let b = UIButton()
        b.setBackgroundImage(.checkmark, for: .normal)
        return b
    }()

    override func setupViews() {
        //backgroundColor = UIColor.blue
        
        let containerView = UIView()
        containerView.backgroundColor = #colorLiteral(red: 0.8941176471, green: 0.8901960784, blue: 0.8901960784, alpha: 1)
        containerView.layer.cornerRadius = 20
        containerView.layer.masksToBounds = true
        
        addSubview(containerView)
        addConstraintsWithFormat(format: "H:[v0(\(Int(contentView.frame.width) - K.padding * 2))]", views: containerView)
        addConstraintsWithFormat(format: "V:[v0(\(Int(contentView.frame.height) - K.padding * 2))]", views: containerView)
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        setupTextView(containerView)
        
        containerView.addSubview(addButton)
        containerView.addConstraintsWithFormat(format: "H:[v0(20)]-12-|", views: addButton)
        containerView.addConstraintsWithFormat(format: "V:|-12-[v0(20)]", views: addButton)
        
        containerView.addSubview(checkButton)
        containerView.addConstraintsWithFormat(format: "V:[v0(20)]-12-|", views: checkButton)
        containerView.addConstraintsWithFormat(format: "H:[v0(20)]-12-|", views: checkButton)
    }
    
    func setupTextView(_ containerView: UIView) {
        let textView = UIView()
        containerView.addSubview(textView)
        containerView.addConstraintsWithFormat(format: "H:|-15-[v0]-40-|", views: textView)
        containerView.addConstraintsWithFormat(format: "V:|-15-[v0]|", views: textView)
        
        textView.addSubview(typeLabel)
        textView.addSubview(descriptionLabel)
        textView.addConstraintsWithFormat(format: "V:|[v0(40)]-10-[v1(20)]", views: typeLabel, descriptionLabel)
        textView.addConstraintsWithFormat(format: "H:|[v0]|", views: typeLabel)
        textView.addConstraintsWithFormat(format: "H:|[v0]|", views: descriptionLabel)
    }
}

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
        
        
    }
}

class BaseCell: UICollectionViewCell {
    
    func setupViews() {
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
