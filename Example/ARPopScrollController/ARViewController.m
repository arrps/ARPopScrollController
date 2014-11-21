//
//  ARViewController.m
//  ARPopScrollController
//
//  Created by Puru Shukla on 11/18/2014.
//  Copyright (c) 2014 Puru Shukla. All rights reserved.
//

#import "ARViewController.h"
#import "ARDerivedPopScrollViewController.h"

@interface ARViewController ()

@end

@implementation ARViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)presentController:(id)sender {
    self.navigationController.navigationBar.translucent = NO;
    ARDerivedPopScrollViewController* popscroll = [[ARDerivedPopScrollViewController alloc] init];
    popscroll.title = @"My Custom Title";
    
    //Present Modally
    [self presentViewController:popscroll animated:YES completion:nil];
    
    
    //Pushing on Mavigation View Controller
//    self.navigationController.navigationBar.translucent = YES;
//    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
//    self.navigationController.navigationBar.shadowImage = [UIImage new];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    [self.navigationController pushViewController:popscroll animated:YES];
}
@end
