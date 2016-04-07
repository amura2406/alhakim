//
//  MainMenuCollectionViewCell.swift
//  Al-Hakim
//
//  Created by Angga Muhammad Rahadian on 4/7/16.
//  Copyright © 2016 Al-Hakim. All rights reserved.
//

import UIKit

class MainMenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bgImg: UIImageView!
    @IBOutlet weak var lyrMask: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        super.applyLayoutAttributes(layoutAttributes)
        
        let featuredHeight: CGFloat = Constant.featuredHeight
        let standardHeight: CGFloat = Constant.standardHegiht
        
        let delta = 1 - (featuredHeight - CGRectGetHeight(frame)) / (featuredHeight - standardHeight)
        
        let minAlpha: CGFloat = Constant.minAlpha
        let maxAlpha: CGFloat = Constant.maxAlpha
        
        let alpha = maxAlpha - (delta * (maxAlpha - minAlpha))
        lyrMask.alpha = alpha
        
        let scale = max(delta, 0.5)
        titleLbl.transform = CGAffineTransformMakeScale(scale, scale)
        
        descriptionLbl.alpha = delta
    }
}

extension MainMenuCollectionViewCell {
    struct Constant {
        static let featuredHeight: CGFloat = 280
        static let standardHegiht: CGFloat = 100
        
        static let minAlpha: CGFloat = 0.3
        static let maxAlpha: CGFloat = 0.75
    }
}