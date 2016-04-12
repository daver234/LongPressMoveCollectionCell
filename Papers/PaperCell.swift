//
//  PaperCell.swift
//  Papers
//
//  Created by Mic Pringle on 09/01/2015.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import UIKit

class PaperCell: UICollectionViewCell {
  
  @IBOutlet private weak var paperImageView: UIImageView!
  @IBOutlet private weak var gradientView: GradientView!
  @IBOutlet private weak var captionLabel: UILabel!
  @IBOutlet private weak var checkImageView: UIImageView!
  
  var editing: Bool = false {
    didSet {
      captionLabel.hidden = editing
      checkImageView.hidden = !editing
    }
  }
  
  var moving: Bool = false {
    didSet {
      let alpha: CGFloat = moving ? 0.0 : 1.0
      paperImageView.alpha = alpha
      gradientView.alpha = alpha
      captionLabel.alpha = alpha
    }
  }
  
  override var selected: Bool {
    didSet {
      if editing {
        checkImageView.image = UIImage(named: selected ? "Checked" : "Unchecked")
      }
    }
  }
  
  var paper: Paper? {
    didSet {
      if let paper = paper {
        paperImageView.image = UIImage(named: paper.imageName)
        captionLabel.text = paper.caption
      }
    }
  }
  
  var snapshot: UIView {
    get {
      let snapshot = snapshotViewAfterScreenUpdates(true)
      let layer = snapshot.layer
      layer.masksToBounds = false
      layer.shadowOffset = CGSize(width: -5.0, height: 0.0)
      layer.shadowRadius = 5.0
      layer.shadowOpacity = 0.4
      return snapshot
    }
  }
  
}
