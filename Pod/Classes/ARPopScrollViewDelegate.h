//
//  ARPopScrollViewDelegate.h
//  ARPopScrollController
//
//  Created by Puru Shukla on 11/18/14.
//  Copyright (c) 2014 arrps. All rights reserved.
//

@protocol ARPopScrollViewDelegate <NSObject>

@optional
/**
 * @descriptoion method is called by the ARPopScrollView to get a the number of
 * items to be displayed in the ARPopScrollView
 *
 * @prarm popScrollView pop scroll which contains the view which was selected.
 * @param view The UIView that was selected
 * @param itemIndex The index of the items that was selected.
 *
 * @return None
 */
-(void)popScrollView:(ARPopScrollView*)popScrollView didSelectView:(UIView*)view itemAtIndex:(NSUInteger)itemIndex;

@end