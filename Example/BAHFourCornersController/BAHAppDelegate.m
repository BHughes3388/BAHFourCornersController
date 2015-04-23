//
//  BAHAppDelegate.m
//  BAHFourCornersController
//
//  Created by CocoaPods on 04/19/2015.
//  Copyright (c) 2014 BHughes3388. All rights reserved.
//

#import "BAHAppDelegate.h"

@implementation BAHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    //Setup some tint colors for the views.
    UIColor *tintColor = [UIColor colorWithRed:30/255.0f green:165/255.0f blue:165/255.0f alpha:1.0f];
    UIColor *topLeftTintColor = [UIColor colorWithRed:255/255.0f green:70/255.0f blue:20/255.0f alpha:1.0f];
    UIColor *topRightTintColor = [UIColor colorWithRed:40/255.0f green:145/255.0f blue:255/255.0f alpha:1.0f];
    UIColor *bottomLeftTintColor = [UIColor colorWithRed:75/255.0f green:158/255.0f blue:63/255.0f alpha:1.0f];
    UIColor *bottomRightTintColor = [UIColor colorWithRed:255/255.0f green:133/255.0f blue:0/255.0f alpha:1.0f];
    
    //Set Four Corners to the root view if using storyboard.
    //Could alloc and init it and then set it as root view just as easy.
    BAHFourCornersViewController *fourCorners = (BAHFourCornersViewController*)self.window.rootViewController;
    [fourCorners setViewTintColor:tintColor];
    
    //Set up the button size, corner radius, and insets
    [fourCorners setButtonImageInsets:CGSizeMake(20.0f, 20.0f)];
    [fourCorners setButtonSize:CGSizeMake(80.0f, 80.0f)];
    [fourCorners setButtonCornerRadius:40.0f];
    [fourCorners setButtonInset:CGSizeMake(20.0f, 20.0f)];
    
    //Set animation duration and velocity/damping for the animate in
    [fourCorners setAnimateInDuration:0.6f];
    [fourCorners setAnimateOutDuration:0.3f];
    [fourCorners setAnimateDamping:0.5f];
    [fourCorners setAnimateVelocity:0.6f];
    
    //Set images for each button
    [fourCorners setMainButtonImage:[UIImage imageNamed:@"home.png"]];
    [fourCorners setTopLeftButtonImage:[UIImage imageNamed:@"gear.png"]];
    [fourCorners setTopRightButtonImage:[UIImage imageNamed:@"book.png"]];
    [fourCorners setBottomLeftButtonImage:[UIImage imageNamed:@"search.png"]];
    [fourCorners setBottomRightButtonImage:[UIImage imageNamed:@"chat.png"]];
    
    //Main View Controller
    BAHDemoMainViewController *mainView = [[BAHDemoMainViewController alloc]init];
    [mainView setViewTintColor:tintColor];
    UINavigationController *navMain = [[UINavigationController alloc]initWithRootViewController:mainView];
    [navMain.navigationBar setTranslucent:NO];
    [navMain.navigationBar setTintColor:tintColor];
    [fourCorners setMainViewController:navMain];
    
    //Top Left View Controller
    BAHDemoTopLeftViewController *topLeft = [[BAHDemoTopLeftViewController alloc]init];
    topLeft.viewTintColor = topLeftTintColor;
    UINavigationController *navTopLeft = [[UINavigationController alloc]initWithRootViewController:topLeft];
    [navTopLeft.navigationBar setTranslucent:NO];
    [navTopLeft.navigationBar setTintColor:tintColor];
    [fourCorners setTopLeftViewController:navTopLeft];
    
    //Top Right View Controller
    BAHDemoTopRightViewController *topRight = [[BAHDemoTopRightViewController alloc]init];
    topRight.viewTintColor = topRightTintColor;
    UINavigationController *navTopRight = [[UINavigationController alloc]initWithRootViewController:topRight];
    [navTopRight.navigationBar setTranslucent:NO];
    [navTopRight.navigationBar setTintColor:tintColor];
    [fourCorners setTopRightViewController:navTopRight];
    
    //Bottom Left View Controller
    BAHDemoBottomLeftViewController *botLeft = [[BAHDemoBottomLeftViewController alloc]init];
    botLeft.viewTintColor = bottomLeftTintColor;
    UINavigationController *navBotLeft = [[UINavigationController alloc]initWithRootViewController:botLeft];
    [navBotLeft.navigationBar setTranslucent:NO];
    [navBotLeft.navigationBar setTintColor:tintColor];
    [fourCorners setBottomLeftViewController:navBotLeft];
    
    //Bottom Right View Controller
    BAHDemoBottomRightViewController *botRight = [[BAHDemoBottomRightViewController alloc]init];
    botRight.viewTintColor = bottomRightTintColor;
    UINavigationController *navBotRight = [[UINavigationController alloc]initWithRootViewController:botRight];
    [navBotRight.navigationBar setTranslucent:NO];
    [navBotRight.navigationBar setTintColor:tintColor];
    [fourCorners setBottomRightViewController:navBotRight];
    
    //Set the view controllers just like any normal TabBarController
    [fourCorners setViewControllers:[NSArray arrayWithObjects: navMain, navTopLeft, navTopRight, navBotLeft, navBotRight, nil] animated:NO];
    //Set the prefered Selected view
    [fourCorners setSelectedViewController:navBotLeft];
    
    /*-----------------------------------------------------------------------------------------------------------------------------------------*/
    /*
     
     This is an optional way to setup the buttons
     You do need to set the buttons size using fourCorners.buttonSize
     Keeping the buttons all the same size makes the animations much smoother
     This does however give you the ability to apply differnt text/font/colors/cornerRadius/borderWidth/borderColor to each button
     
     
     */
    /*----------------------------------------------------------------------------------------------------------------------------------------*/
    
    /*
     [fourCorners setButtonSize:CGSizeMake(80.0f, 80.0f)];
     float cornerRadius = fourCorners.buttonSize.width/2;
     
     fourCorners.mainButton = [[UIButton alloc]init];
     fourCorners.mainButton.layer.cornerRadius = cornerRadius;
     [fourCorners.mainButton setTitle:@"M" forState:UIControlStateNormal];
     fourCorners.mainButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:32.0f];
     [fourCorners.mainButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
     [fourCorners.mainButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
     fourCorners.mainButton.backgroundColor = tintColor;
     
     fourCorners.topLeftButton = [[UIButton alloc]init];
     fourCorners.topLeftButton.layer.cornerRadius = cornerRadius;
     [fourCorners.topLeftButton setTitle:@"1" forState:UIControlStateNormal];
     fourCorners.topLeftButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:32.0f];
     [fourCorners.topLeftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
     [fourCorners.topLeftButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
     fourCorners.topLeftButton.backgroundColor = tintColor;
     
     fourCorners.topRightButton = [[UIButton alloc]init];
     fourCorners.topRightButton.layer.cornerRadius = cornerRadius;
     [fourCorners.topRightButton setTitle:@"2" forState:UIControlStateNormal];
     fourCorners.topRightButton.layer.cornerRadius = cornerRadius;
     fourCorners.topRightButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:32.0f];
     [fourCorners.topRightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
     [fourCorners.topRightButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
     fourCorners.topRightButton.backgroundColor = tintColor;
     
     fourCorners.bottomLeftButton = [[UIButton alloc]init];
     fourCorners.bottomLeftButton.layer.cornerRadius = cornerRadius;
     [fourCorners.bottomLeftButton setTitle:@"3" forState:UIControlStateNormal];
     fourCorners.bottomLeftButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:32.0f];
     [fourCorners.bottomLeftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
     [fourCorners.bottomLeftButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
     fourCorners.bottomLeftButton.backgroundColor = tintColor;
     
     fourCorners.bottomRightButton = [[UIButton alloc]init];
     fourCorners.bottomRightButton.layer.cornerRadius = cornerRadius;
     [fourCorners.bottomRightButton setTitle:@"4" forState:UIControlStateNormal];
     fourCorners.bottomRightButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:32.0f];
     [fourCorners.bottomRightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
     [fourCorners.bottomRightButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
     fourCorners.bottomRightButton.backgroundColor = tintColor;
     */
    
    //Initalize the buttons and add them to the view
    [fourCorners initalizeFourCorners];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
