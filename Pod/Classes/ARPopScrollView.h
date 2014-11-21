//
//  ARPopScrollView.h
//  ARPopScrollController
//
//  Created by Puru Shukla on 11/18/14.
//  Copyright (c) 2014 arrps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARPopScrollViewDataSource.h"
#import "ARPopScrollViewDelegate.h"

@interface ARPopScrollView : UIView

/**
 * Private property: the scroll view
 */
@property (nonatomic, readonly)UIView* contentView;

/**
 * @property Datasource of the ARPopScrollView
 */
@property (nonatomic, weak)id<ARPopScrollViewDataSource> datasource;

/**
 * @property Delegate of the ARPopScrollView
 */
@property (nonatomic, weak)id<ARPopScrollViewDelegate> delegate;

@end
