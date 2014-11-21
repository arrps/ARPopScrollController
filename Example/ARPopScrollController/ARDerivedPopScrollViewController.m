//
//  ARDerivedPopScrollViewController.m
//  ARPopScrollController
//
//  Created by Puru Shukla on 11/21/14.
//  Copyright (c) 2014 Purushottam Shukla. All rights reserved.
//

#import "ARDerivedPopScrollViewController.h"

@interface ARDerivedPopScrollViewController ()

@end

@implementation ARDerivedPopScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -
-(NSUInteger)numberOfItemsInPopScrollView:(ARPopScrollView *)popScrollView{
    return 10;
}

-(UIView*)popScroll:(ARPopScrollView *)popScrollView viewForItemAtIndex:(NSUInteger)itemIndex{
    UIImage* image = [UIImage imageNamed:@"TestImage"];
    
    
    /****  NOTE:
     Applying filter on image are slower. This is only for demo purpose.
     *****/
    //    CIImage* ciimage = [CIImage imageWithCGImage:image.CGImage];
    //    CIContext *context = [CIContext contextWithOptions:nil];               // 1
    //    CIFilter *filter = [CIFilter filterWithName:@"CIPhotoEffectProcess"];           // 3
    //    [filter setValue:ciimage forKey:kCIInputImageKey];
    //    CIImage *result = [filter valueForKey:kCIOutputImageKey];              // 4
    //    CGRect extent = [result extent];
    //    CGImageRef cgImage = [context createCGImage:result fromRect:extent];   // 5
    //    image = [UIImage imageWithCGImage:cgImage];
    
    
    UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
    UIView* contentView = popScrollView.contentView;
    CGFloat xPadding = 10.0;
    CGFloat yPadding = 5.0;
    
    CGFloat w = contentView.bounds.size.width - (2.0*xPadding);
    CGFloat x = xPadding + itemIndex*(contentView.frame.size.width);
    CGFloat h = contentView.bounds.size.height - (2.0*yPadding);
    imageView.frame = CGRectMake(x, yPadding, w, h);
    
    imageView.layer.cornerRadius = 5.0;
    imageView.layer.masksToBounds = YES;
    
    UIImage* overlayImage = [UIImage imageNamed:@"BottomShade"];
    CGFloat overlayTop = h - 70;
    UIImageView* overlayView = [[UIImageView alloc] initWithFrame:CGRectMake(0, overlayTop, w, 70)];
    overlayView.image = overlayImage;
    
    UILabel* testLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, w, 20)];
    testLabel.text = [NSString stringWithFormat:@"This is a test label%lu", (unsigned long)itemIndex];
    testLabel.textColor = [UIColor whiteColor];
    
    [overlayView addSubview:testLabel];
    [imageView addSubview:overlayView];
    
    
    NSDictionary* views = NSDictionaryOfVariableBindings(imageView, overlayView);
    NSArray* vertConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[overlayView]|"
                                                                   options:0
                                                                   metrics:nil
                                                                     views:views];
    
    NSArray* constraints = [NSArray arrayWithArray:vertConstraints];
    [imageView addConstraints:constraints];
    return imageView;
}

#pragma mark - ARPopScrollViewDelegate
-(void)popScrollView:(ARPopScrollView *)popScrollView didSelectView:(UIView *)view itemAtIndex:(NSUInteger)itemIndex{
    NSLog(@"%lu Item selected (View-%@)", (unsigned long)itemIndex, view);
}

@end
