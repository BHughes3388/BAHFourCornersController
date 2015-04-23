//
//  BAHDemoBottomRightViewController.m
//  BAHFourCornersController
//
//  Created by BHughes on 4/19/15.
//  Copyright (c) 2015 BHughes3388. All rights reserved.
//

#import "BAHDemoBottomRightViewController.h"

@interface BAHDemoBottomRightViewController ()

@end

@implementation BAHDemoBottomRightViewController
@synthesize viewTintColor = _viewTintColor;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];

}

- (void)viewDidAppear:(BOOL)animated{
    
    if (self.view.subviews.count < 1) {
        
        [self.view setBackgroundColor:[UIColor whiteColor]];
        
        UILabel *titleLabel = [[UILabel alloc]init];
        [titleLabel setText:@"Bottom Right"];
        [titleLabel setTextColor:self.viewTintColor];
        [titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:26.0f]];
        [titleLabel sizeToFit];
        [self.navigationItem setTitleView:titleLabel];
        
        
        UILabel *title = [[UILabel alloc]init];
        [title setText:@"Four Corner Controller"];
        [title setTextColor:self.viewTintColor];
        [title setFont:[UIFont fontWithName:@"HelveticaNeue" size:30.0f]];
        [title sizeToFit];
        [title setFrame:CGRectMake((self.view.frame.size.width/2)-(title.frame.size.width/2), 80.0f, title.frame.size.width, title.frame.size.height)];
        title.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        [self.view addSubview:title];
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(title.frame.origin.x, title.frame.origin.y + title.frame.size.height + 3.0f, title.frame.size.width, 2.0f)];
        [line setBackgroundColor:self.viewTintColor];
        line.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        [self.view addSubview:line];
        
        UILabel *subtitle = [[UILabel alloc]init];
        [subtitle setText:@"Bottom Right ViewController"];
        [subtitle setTextColor:self.viewTintColor];
        [subtitle setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:24.0f]];
        [subtitle sizeToFit];
        [subtitle setCenter:CGPointMake(self.view.center.x, line.center.y + (subtitle.frame.size.height/2) + 3.0f)];
        subtitle.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        [self.view addSubview:subtitle];
    }
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
