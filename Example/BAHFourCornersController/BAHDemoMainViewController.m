//
//  BAHDemoMainViewController.m
//  BAHFourCornersController
//
//  Created by BHughes on 4/20/15.
//  Copyright (c) 2015 BHughes3388. All rights reserved.
//

#import "BAHDemoMainViewController.h"

@interface BAHDemoMainViewController ()

@end

@implementation BAHDemoMainViewController{
    UILabel *title;
    UIView *line;
    UILabel *subtitle;
}

@synthesize viewTintColor = _viewTintColor;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
}

- (void)viewDidAppear:(BOOL)animated{
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    if (self.view.subviews.count < 1) {
        
        UILabel *titleLabel = [[UILabel alloc]init];
        [titleLabel setText:@"Main View"];
        [titleLabel setTextColor:self.viewTintColor];
        [titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:26.0f]];
        [titleLabel sizeToFit];
        [self.navigationItem setTitleView:titleLabel];
        
        
        title = [[UILabel alloc]init];
        [title setText:@"Four Corner Controller"];
        [title setTextColor:self.viewTintColor];
        [title setFont:[UIFont fontWithName:@"HelveticaNeue" size:30.0f]];
        [title sizeToFit];
        [title setFrame:CGRectMake((self.view.frame.size.width/2)-(title.frame.size.width/2), 80.0f, title.frame.size.width, title.frame.size.height)];
        title.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        [self.view addSubview:title];
        
        line = [[UIView alloc]initWithFrame:CGRectMake(title.frame.origin.x, title.frame.origin.y + title.frame.size.height + 5.0f, title.frame.size.width, 2.0f)];
        [line setBackgroundColor:self.viewTintColor];
        line.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        [self.view addSubview:line];
        
        subtitle = [[UILabel alloc]init];
        [subtitle setText:@"Pinch To Activate"];
        [subtitle setTextColor:self.viewTintColor];
        [subtitle setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:24.0f]];
        [subtitle sizeToFit];
        [subtitle setCenter:CGPointMake(self.view.center.x, line.center.y + (subtitle.frame.size.height/2) + 5.0f)];
        subtitle.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        [self.view addSubview:subtitle];
    }
    
    BAHFourCornersViewController *fourCorners = (BAHFourCornersViewController*)self.tabBarController;
    
    /*
    [fourCorners.mainButton setTitle:@"M" forState:UIControlStateNormal];
    fourCorners.mainButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:32.0f];
    [fourCorners.mainButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [fourCorners.mainButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    
    [fourCorners.topLeftButton setTitle:@"1" forState:UIControlStateNormal];
    fourCorners.topLeftButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:32.0f];
    [fourCorners.topLeftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [fourCorners.topLeftButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    
    [fourCorners.topRightButton setTitle:@"2" forState:UIControlStateNormal];
    fourCorners.topRightButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:32.0f];
    [fourCorners.topRightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [fourCorners.topRightButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    
    [fourCorners.bottomLeftButton setTitle:@"3" forState:UIControlStateNormal];
    fourCorners.bottomLeftButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:32.0f];
    [fourCorners.bottomLeftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [fourCorners.bottomLeftButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    
    [fourCorners.bottomRightButton setTitle:@"4" forState:UIControlStateNormal];
    fourCorners.bottomRightButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:32.0f];
    [fourCorners.bottomRightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [fourCorners.bottomRightButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    */
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

@end
