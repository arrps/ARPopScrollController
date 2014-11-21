//
//  ARPopScrollViewDataSource.h
//  ARPopScrollController
//
//  Created by Puru Shukla on 11/18/14.
//  Copyright (c) 2014 arrps. All rights reserved.
//

//Forward declaration of the ARPopScrollView
@class ARPopScrollView;

@protocol ARPopScrollViewDataSource <NSObject>


/**
 * @descriptoion method is called by the ARPopScrollView to get a the number of
 * items to be displayed in the ARPopScrollView
 *
 * @prarm popScrollView pop scroll view requesting the view to be displayed.
 *
 * @return Number of items to be displayed
 */
-(NSUInteger)numberOfItemsInPopScrollView:(ARPopScrollView*)popScrollView;

@optional
/**
 * @descriptoion method is called by the ARPopScrollView to get a UIVIew 
 * to display at a particular index in the scroll view.
 *
 * @prarm popScrollView pop scroll view requesting the view to be displayed.
 * @param itemIndex index of the item the needs to be displayed
 * 
 * @return The UIView to be displaeyd in the ARPopScrollView at this index
 */
-(UIView*)popScroll:(ARPopScrollView*)popScrollView viewForItemAtIndex:(NSUInteger)itemIndex;

@end
