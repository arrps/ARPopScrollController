//
//  ARPopScrollView.m
//  ARPopScrollController
//
//  Created by Puru Shukla on 11/18/14.
//  Copyright (c) 2014 arrps. All rights reserved.
//

#import "ARPopScrollView.h"

@interface  ARPopScrollView ()

/**
 * Private property: the scroll view
 */
@property (nonatomic, strong)UIView* contentView;

/**
 * Private property: the scroll view
 */
@property (nonatomic, strong)UIScrollView* scrollView;

/**
 * Private property: Number of items to be displayed
 * by the scroll view.
 */
@property NSUInteger numberOfItems;

/**
 * Private property: View frame for view in the scroll view
 */
@property CGRect viewFrame;

@end

@implementation ARPopScrollView


-(void)awakeFromNib{
    [self startViewload];
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self startViewload];
    }
    
    return self;
}

#pragma mark - View Life Cycle
-(void)startViewload{
    //Create and configure the scroll view
    [self configureScrollView];
}

-(void)configureScrollView{
    if (self.contentView == nil) {
        CGRect viewFrame = self.bounds;
        
        CGFloat xPadding = 10.0;
        CGFloat yPadding = 20.0;
        CGFloat x = xPadding;
        CGFloat y = yPadding;
        CGFloat w = viewFrame.size.width - (2.0 * xPadding);
        CGFloat h = viewFrame.size.height - (2.0 * yPadding);
        CGRect scrollViewFrame = CGRectMake(x, y, w, h);
        
        self.contentView = [[UIView alloc] initWithFrame:scrollViewFrame];
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, scrollViewFrame.size.width, scrollViewFrame.size.height)];
        self.scrollView.backgroundColor = [UIColor clearColor];
        self.scrollView.pagingEnabled = YES;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.showsVerticalScrollIndicator = NO;
        [self.contentView addSubview:self.scrollView];
        [self addSubview:self.contentView];
        
        NSDictionary* views = NSDictionaryOfVariableBindings(_contentView, _scrollView);
        NSArray* horzConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_scrollView]|"
                                                                           options:0
                                                                           metrics:nil
                                                                             views:views];
        
        NSArray* constraints = [NSArray arrayWithArray:horzConstraints];
        [self.contentView addConstraints:constraints];
        
        //install constraints
        views = NSDictionaryOfVariableBindings(self, _contentView);
        horzConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(==10)-[_contentView]"
                                                                           options:0
                                                                  metrics:nil
                                                                    views:views];
        
        constraints = [NSArray arrayWithArray:horzConstraints];
        [self addConstraints:constraints];
    }
}

-(void)layoutSubviews{
    //query the data source
    [self loadDisplayViews];
}

-(void)loadDisplayViews{
    if([self.datasource respondsToSelector:@selector(numberOfItemsInPopScrollView:)]){
        self.numberOfItems = [self.datasource numberOfItemsInPopScrollView:self];
        
        //if there are some items to be displayed then start loading the items.
        if(self.numberOfItems){
            CGSize contentSize = self.scrollView.frame.size;
            CGSize scrollContentSize = CGSizeMake((self.numberOfItems * contentSize.width), contentSize.height);
            self.scrollView.contentSize = scrollContentSize;
            self.scrollView.contentOffset = CGPointMake(0,0);
            self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
            
            for (NSInteger index = 0; index < self.numberOfItems; index++){
                if([self.datasource respondsToSelector:@selector(popScroll:viewForItemAtIndex:)]){
                    UIView* view = [self.datasource popScroll:self viewForItemAtIndex:index];
                    view.tag = index;
                    view.userInteractionEnabled = YES;
                    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewSelected:)];
                    [view addGestureRecognizer:tapGesture];
                    [self.scrollView addSubview:view];
                }
            }
        }
    }
}

#pragma mark - Delegatation
-(void)viewSelected:(UIGestureRecognizer*)gestureRecognzer{
    if([self.delegate respondsToSelector:@selector(popScrollView:didSelectView:itemAtIndex:)]){
        UIView* selectedView = gestureRecognzer.view;
        [self.delegate popScrollView:self didSelectView:selectedView itemAtIndex:selectedView.tag];
    }
}
@end
