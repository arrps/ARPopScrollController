//
//  ARPopScrollViewController.h
//  ARPopScrollController
//
//  Created by Puru Shukla on 11/18/14.
//  Copyright (c) 2014 arrps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARPopScrollView.h"

@interface ARPopScrollViewController : UIViewController<ARPopScrollViewDataSource, ARPopScrollViewDelegate>


/**
 * @property The ARPopScrollView managed by this view controller.
 */
@property(nonatomic, readonly)ARPopScrollView* popScrollView;

/**
 * @property closeBarButtonItem
 *
 * @description A UIBarButtonitem to be used for closing this 
 * view controller.
 */
@property (nonatomic, strong)UIBarButtonItem* closeButtonItem;

@end
