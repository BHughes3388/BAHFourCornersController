// Copyright 2012 Todd Reed
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "QAppDelegate.h"

#if !(AppStoreRelease)
#import "QTouchposeApplication.h"
#endif

@implementation QAppDelegate

#pragma mark UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
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
    
#if !(AppStoreRelease)
    // For demo purposes, show the touches even when not mirroring to an external display.
    QTouchposeApplication *touchposeApplication = (QTouchposeApplication *)application;
    touchposeApplication.alwaysShowTouches = YES; // Generally we want NO, but verify it works first
#endif
    
    return YES;
}

@end
