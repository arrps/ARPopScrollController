//
//  ARPopScrollViewController.m
//  ARPopScrollController
//
//  Created by Puru Shukla on 11/18/14.
//  Copyright (c) 2014 arrps. All rights reserved.
//

#import "ARPopScrollViewController.h"
#import "ARPopScrollView.h"

@interface ARPopScrollViewController()

/// Default background color
@property (nonatomic, strong)UIColor* defaultBackgroundColor;

///ARPopScrollView managed by this view controller
@property(nonatomic, strong)ARPopScrollView* popScrollView;

///If navigation bar is translucent
@property (nonatomic)BOOL translucentNavigationBar;
@end

@implementation ARPopScrollViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    //Custom code
    [self configureView];
}

/**
 * Private method used to configure the UIViewController view, like the default 
 * background color etc.
 */
-(void)configureView{
    self.defaultBackgroundColor = [UIColor colorWithRed:(31./255.) green:(33./255.) blue:(37./255.) alpha:1.0];
    self.view.backgroundColor = self.defaultBackgroundColor;
    
    //Let's configure the bar button item.
    if(self.closeButtonItem == nil){
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"ARPopScrollController" ofType:@"bundle"];
        NSBundle* libBundle = [NSBundle bundleWithPath:bundlePath];
        
        NSString* imagePath = [libBundle pathForResource:@"closeButton@2x" ofType:@"png"];
        UIImage* closeButtonImage = [UIImage imageWithContentsOfFile:imagePath];
        closeButtonImage = [closeButtonImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        UIButton* buttonView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
        buttonView.tintColor = [UIColor whiteColor];
        [buttonView setImage:closeButtonImage forState:UIControlStateNormal];
        [buttonView addTarget:self action:@selector(closeButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        self.closeButtonItem = [[UIBarButtonItem alloc] initWithCustomView:buttonView];
        [self.closeButtonItem setTarget:self];
        [self.closeButtonItem setAction:@selector(closeButtonTapped:)];
    }
    
    ///Now create the navigation bar if we were not present on a navigation controller
    if(self.navigationController == nil && ![self isRootViewController]){
        if([self isModal]){
            self.translucentNavigationBar = YES;
            CGSize viewSize = self.view.frame.size;
            CGRect navigationFrame = CGRectMake(0., 20.0, viewSize.width, 44.);
            UINavigationBar* navigationBar = [[UINavigationBar alloc] initWithFrame:navigationFrame];
            navigationBar.translucent = YES;
            navigationBar.backgroundColor = [UIColor clearColor];
            navigationBar.shadowImage = [UIImage new];
            [navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
            [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
            
            UINavigationItem* navigationItem = [[UINavigationItem alloc] initWithTitle:@"My Title"];
            navigationItem.leftBarButtonItem = self.closeButtonItem;
            [navigationBar pushNavigationItem:navigationItem animated:NO];
            
            [self.view addSubview:navigationBar];
        }
    }else{
        self.translucentNavigationBar = self.navigationController.navigationBar.translucent;
        self.navigationItem.leftBarButtonItem = self.closeButtonItem;
    }
    
    [self configurePopScrollView];
}

-(BOOL)isRootViewController{
    UIWindow* window = [UIApplication sharedApplication].delegate.window;
    return [window.rootViewController isKindOfClass:[ARPopScrollViewController class]];
}

- (BOOL)isModal {
    return self.presentingViewController.presentedViewController == self
    || self.navigationController.presentingViewController.presentedViewController == self.navigationController
    || [self.tabBarController.presentingViewController isKindOfClass:[UITabBarController class]];
}

-(void)closeButtonTapped:(id)sender{
    if([self isModal]){
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - ARPopScrollView
-(void)configurePopScrollView{
    CGFloat xPadding = 10.0;
    CGFloat yPadding = self.translucentNavigationBar ? 74.0 : 10.0;
    
    CGFloat x = xPadding;
    CGFloat y = yPadding;
    CGFloat w = self.view.bounds.size.width - (2.0 * xPadding);
    CGFloat h = self.view.bounds.size.height - (xPadding + 74.0);
    
    CGRect scrollFrame = CGRectMake(x, y, w, h);
    self.popScrollView = [[ARPopScrollView alloc] initWithFrame:scrollFrame];
    self.popScrollView.backgroundColor = [UIColor clearColor];
    self.popScrollView.datasource = self;
    self.popScrollView.delegate = self;
    [self.view addSubview:self.popScrollView];
    
    //install constraints
    NSDictionary* views = NSDictionaryOfVariableBindings(self.view, _popScrollView);
    NSArray* horzConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(==10)-[_popScrollView]"
                                                                   options:0
                                                                   metrics:nil
                                                                     views:views];
    
    NSString* verticalFormat;
    if(self.translucentNavigationBar)
        verticalFormat = @"V:|-(==74)-[_popScrollView]";
    else
        verticalFormat = @"V:|-(==10)-[_popScrollView]";
    
    NSArray* vertConstraints = [NSLayoutConstraint constraintsWithVisualFormat:verticalFormat
                                                                   options:0
                                                                   metrics:nil
                                                                     views:views];
    
    NSArray* constraints = [NSArray arrayWithArray:vertConstraints];
    constraints = [constraints arrayByAddingObjectsFromArray:horzConstraints];
    
    [self.view addConstraints:constraints];
}

#pragma mark - ARPopScrollDataSource/ARPopScrollDelegate
-(NSUInteger)numberOfItemsInPopScrollView:(ARPopScrollView *)popScrollView{
    return 0;
}

@end
