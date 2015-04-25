//
//  BAHFourCornersViewController.m
//  Pods
//
//  Created by BHughes on 4/19/15.
//
//

#import "BAHFourCornersViewController.h"

@interface BAHFourCornersViewController ()

@property (nonatomic, strong)UIPinchGestureRecognizer *pinchGesture;
@property (nonatomic, strong)UIViewController *rootViewController;
@property (nonatomic, strong)UIView *blurView;
@property (nonatomic)CGRect previousRect;

typedef enum PinchDirection {
    pinchInward,
    pinchOutward
} PinchDirection;

@end

@implementation BAHFourCornersViewController{
    
    UIButton *topLeft;
    UIButton *topRight;
    UIButton *bottomLeft;
    UIButton *bottomRight;
    
    CGRect leftTopRect;
    CGRect rightTopRect;
    CGRect leftBottomRect;
    CGRect rightBottomRect;
    
    CGRect leftTopRectOut;
    CGRect rightTopRectOut;
    CGRect leftBottomRectOut;
    CGRect rightBottomRectOut;
    
    CGRect blurRect;
    
    float lastScaleValue;
    
    BOOL cornersWereActive;
    BOOL supportedOrientation;
    int orientationTag;
    
}

@synthesize viewTintColor = _viewTintColor;
@synthesize buttonSize = _buttonSize;
@synthesize buttonCornerRadius = _buttonCornerRadius;
@synthesize buttonImageInsets = _buttonImageInsets;
@synthesize buttonInset = _buttonInset;

@synthesize animateInDuration = _animateInDuration;
@synthesize animateOutDuration = _animateOutDuration;
@synthesize animateDamping = _animateDamping;
@synthesize animateVelocity = _animateVelocity;

@synthesize mainViewController = _mainViewController;
@synthesize topLeftViewController = _topLeftViewController;
@synthesize topRightViewController = _topRightViewController;
@synthesize bottomLeftViewController = _bottomLeftViewController;
@synthesize bottomRightViewController = _bottomRightViewController;

@synthesize mainButton = _mainButton;
@synthesize topLeftButton = _topLeftButton;
@synthesize topRightButton = _topRightButton;
@synthesize bottomLeftButton = _bottomLeftButton;
@synthesize bottomRightButton = _bottomRightButton;

@synthesize mainButtonImage = _mainButtonImage;
@synthesize topLeftButtonImage = _topLeftButtonImage;
@synthesize topRightButtonImage = _topRightButtonImage;
@synthesize bottomLeftButtonImage = _bottomLeftButtonImage;
@synthesize bottomRightButtonImage = _bottomRightButtonImage;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    [self.tabBar setHidden:YES];
    
    //setup rootviewcontroller for later use
    self.rootViewController = self.childViewControllers.firstObject;

    self.blurView = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 64.0f, self.rootViewController.view.frame.size.width, self.rootViewController.view.frame.size.height)];
    [self.blurView setBackgroundColor:[UIColor blackColor]];
    [self.blurView setAlpha:0.0f];
    [self.view addSubview:self.blurView];
    
    //Setup pinch Gesture and ad to the main view
    self.pinchGesture = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(handlePinch:)];
    self.view.gestureRecognizers = [NSArray arrayWithObject:self.pinchGesture];
    
    //Buttin insets
    if (!self.buttonInset.width && !self.buttonInset.height) {
        self.buttonInset = CGSizeMake(5.0f, 5.0f);
    }
    
    //Add observer for device orientation notification
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(orientationChanged:)
     name:UIDeviceOrientationDidChangeNotification
     object:[UIDevice currentDevice]];
    
}

- (void)setupRectsForPortrait{
    
    //Shown Location
    leftTopRect = CGRectMake(self.buttonInset.width, self.buttonInset.height + 64.0f, self.buttonSize.width, self.buttonSize.height);
    rightTopRect = CGRectMake(self.view.frame.size.width - self.buttonSize.width - self.buttonInset.width, self.buttonInset.height + 64.0f, self.buttonSize.width, self.buttonSize.width);
    rightBottomRect = CGRectMake(self.view.frame.size.width - self.buttonSize.width - self.buttonInset.width, self.view.frame.size.height - self.buttonSize.width - self.buttonInset.height, self.buttonSize.width, self.buttonSize.width);
    leftBottomRect = CGRectMake(self.buttonInset.width, self.view.frame.size.height - self.buttonSize.height - self.buttonInset.height, self.buttonSize.width, self.buttonSize.width);
    
    //Hidden Locations
    leftTopRectOut = CGRectMake(-self.buttonSize.width - 5.0f, -self.buttonSize.height - 5.0f + 64.0f, self.buttonSize.width, self.buttonSize.height);
    rightTopRectOut = CGRectMake(self.view.frame.size.width + 5.0f, -self.buttonSize.height - 5.0f + 64.0f, self.buttonSize.width, self.buttonSize.width);
    rightBottomRectOut = CGRectMake(self.view.frame.size.width + 5.0f, self.view.frame.size.height + self.buttonSize.height + 5.0f, self.buttonSize.width, self.buttonSize.width);
    leftBottomRectOut = CGRectMake(-self.buttonSize.width - 5.0f, self.view.frame.size.height + self.buttonSize.height+ 5.0f, self.buttonSize.width, self.buttonSize.width);
    
    blurRect = CGRectMake(0.0f, 64.0f, self.selectedViewController.view.frame.size.width, self.selectedViewController.view.frame.size.height);

}

- (void)setupRectsForLandScape{
    
    //Shown Location
    leftTopRect = CGRectMake(5.0f, 5.0f + 32.0f, self.buttonSize.width, self.buttonSize.height);
    rightTopRect = CGRectMake(self.view.frame.size.width - self.buttonSize.width - 5.0f, 5.0f + 32.0f, self.buttonSize.width, self.buttonSize.height);
    rightBottomRect = CGRectMake(self.view.frame.size.width - self.buttonSize.width - 5.0f, self.view.frame.size.height - self.buttonSize.width - 5.0f, self.buttonSize.width, self.buttonSize.height);
    leftBottomRect = CGRectMake(5.0f, self.view.frame.size.height - self.buttonSize.height - 5.0f, self.buttonSize.width, self.buttonSize.height);
    
    //Hidden Locations
    leftTopRectOut = CGRectMake(-self.buttonSize.width - 5.0f, -self.buttonSize.height - 5.0f + 32.0f, self.buttonSize.width, self.buttonSize.height);
    rightTopRectOut = CGRectMake(self.view.frame.size.width + 5.0f, -self.buttonSize.height - 5.0f + 32.0f, self.buttonSize.width, self.buttonSize.height);
    rightBottomRectOut = CGRectMake( self.view.frame.size.width + 5.0f, self.view.frame.size.height + self.buttonSize.height + 5.0f, self.buttonSize.width, self.buttonSize.height);
    leftBottomRectOut = CGRectMake(-self.buttonSize.width - 5.0f, self.view.frame.size.height + self.buttonSize.height+ 5.0f, self.buttonSize.width, self.buttonSize.height);
    
    blurRect = CGRectMake(0.0f, 32.0f, self.selectedViewController.view.frame.size.width, self.selectedViewController.view.frame.size.height);

    
}

- (void)initalizeFourCorners{
    
    if (!self.mainButton && self.mainViewController) {
        
        self.mainButton = [self genericCornerButton];
        self.mainButton.frame = leftTopRectOut;
        self.mainButton.layer.cornerRadius = self.buttonCornerRadius;
        UIImageView *mainImg = [[UIImageView alloc]initWithFrame:[self rectForButtonImg]];
        [mainImg setImage:[self.mainButtonImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        [mainImg setTintColor:[UIColor whiteColor]];
        [self.mainButton addSubview:mainImg];
    }
    
    if (!self.topLeftButton && self.topLeftViewController) {

        self.topLeftButton = [self genericCornerButton];
        self.topLeftButton.frame = leftTopRectOut;
        UIImageView *topLeftImg = [[UIImageView alloc]initWithFrame:[self rectForButtonImg]];
        [topLeftImg setImage:[self.topLeftButtonImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        [topLeftImg  setTintColor:[UIColor whiteColor]];
        [self.topLeftButton addSubview:topLeftImg];
    }
    
    if (!self.topRightButton && self.topRightViewController) {
        
        self.topRightButton = [self genericCornerButton];
        self.topRightButton.frame = rightTopRectOut;
        UIImageView *topRightImg = [[UIImageView alloc]initWithFrame:[self rectForButtonImg]];
        [topRightImg setImage:[self.topRightButtonImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        [topRightImg setTintColor:[UIColor whiteColor]];
        [self.topRightButton addSubview:topRightImg];
    }
    
    if (!self.bottomLeftButton && self.bottomLeftViewController) {
        
        self.bottomLeftButton = [self genericCornerButton];
        self.bottomLeftButton.frame = leftBottomRectOut;
        UIImageView *bottomLeftImg = [[UIImageView alloc]initWithFrame:[self rectForButtonImg]];
        [bottomLeftImg setImage:[self.bottomLeftButtonImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        [bottomLeftImg setTintColor:[UIColor whiteColor]];
        [self.bottomLeftButton addSubview:bottomLeftImg];
    }
    
    if (!self.bottomRightButton && self.bottomRightViewController) {
        
        self.bottomRightButton = [self genericCornerButton];
        self.bottomRightButton.frame = rightBottomRectOut;
        UIImageView *bottomRightImg = [[UIImageView alloc]initWithFrame:[self rectForButtonImg]];
        [bottomRightImg setImage:[self.bottomRightButtonImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        [bottomRightImg setTintColor:[UIColor whiteColor]];
        [self.bottomRightButton addSubview:bottomRightImg];
    }
    
    [self.mainButton addTarget:self action:@selector(handleMainButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.topLeftButton addTarget:self action:@selector(handleTopLeftButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.topRightButton addTarget:self action:@selector(handleTopRightButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomLeftButton addTarget:self action:@selector(handleBottomLeftButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomRightButton addTarget:self action:@selector(handleBottomRightButton:) forControlEvents:UIControlEventTouchUpInside];

    
    [self.view addSubview:self.mainButton];
    [self.view addSubview:self.topLeftButton];
    [self.view addSubview:self.topRightButton];
    [self.view addSubview:self.bottomLeftButton];
    [self.view addSubview:self.bottomRightButton];
    
    //Setup start and end points for corner animations
    [self setupRectsForPortrait];
   
    //Helper method to set MainButton location to that of the selected controllers button.
    [self setButtons];
    
}

- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
    [self performSelector:@selector(setBackButtonForViewController:) withObject:toVC afterDelay:0.3f];

    //This Will be Used Later When Building Animation Transistions
    if (toVC == self.topLeftViewController) {
        self.topLeftViewController.view.tag = 1001;

    }else if (toVC == self.topRightViewController){
        self.topRightViewController.view.tag = 1002;

    }else if (toVC == self.bottomLeftViewController){
        self.bottomLeftViewController.view.tag = 1003;

    }else if (toVC == self.bottomRightViewController){
        self.bottomRightViewController.view.tag = 1004;

    }
    
    return nil;
}
    
- (void)setBackButtonForViewController:(UIViewController*)viewController{
        
        if (viewController == self.topLeftViewController) {
            [self changeButtonToBackButton:self.topLeftButton];
            
        }else if (viewController == self.topRightViewController){
            [self changeButtonToBackButton:self.topRightButton];
            
        }else if (viewController == self.bottomLeftViewController){
            [self changeButtonToBackButton:self.bottomLeftButton];
            
        }else if (viewController == self.bottomRightViewController){
            [self changeButtonToBackButton:self.bottomRightButton];
            
        }
        
}

- (UIButton*)genericCornerButton{
    
    UIButton *cornerButton = [[UIButton alloc]init];
    [cornerButton setBackgroundColor:self.viewTintColor];
    [cornerButton setAlpha:0.85f];
    [cornerButton.layer setCornerRadius:self.buttonCornerRadius];
    [cornerButton.layer setBorderColor:self.viewTintColor.CGColor];
    [cornerButton.layer setBorderWidth:3.0f];

    return cornerButton;
}

- (CGRect)rectForButtonImg{
    CGRect rect = CGRectMake(self.buttonImageInsets.width, self.buttonImageInsets.height, self.buttonSize.width - (self.buttonImageInsets.width*2), self.buttonSize.height - (self.buttonImageInsets.height*2));
   
    return rect;
}

- (void)setButtons{
    
    if (self.selectedViewController == self.mainViewController && self.previousRect.origin.x == 0.0f) {
        self.mainButton.frame = leftTopRectOut;
    }else if (self.selectedIndex == 0 && self.previousRect.origin.x != 0.0f){
        self.mainButton.frame = self.previousRect;
    }
    
    if (self.selectedViewController == self.topLeftViewController && self.topLeftButton) {
        topLeft = self.mainButton;
    }else if(self.topLeftButton){
        topLeft = self.topLeftButton;
    }
    
    if (self.selectedViewController == self.topRightViewController && self.topRightButton) {
        topRight = self.mainButton;
    }else if(self.topRightButton){
        topRight = self.topRightButton;
    }
    
    if (self.selectedViewController == self.bottomLeftViewController && self.bottomLeftButton) {
        bottomLeft = self.mainButton;
    }else if(self.bottomLeftButton){
        bottomLeft = self.bottomLeftButton;
    }
    
    if (self.selectedViewController == self.bottomRightViewController && self.bottomRightButton) {
        bottomRight = self.mainButton;
    }else if(self.bottomRightButton){
        bottomRight = self.bottomRightButton;
    }
    
}

- (void)changeButtonToBackButton:(UIButton*)button{
    
    self.mainButton.frame = button.frame;
    [self.mainButton addTarget:self action:@selector(handleMainButton:) forControlEvents:UIControlEventTouchUpInside];
}


- (void) orientationChanged:(NSNotification *)note{
    
    //Set Buttons
    [self setButtons];
    
    UIDevice * device = note.object;
    
    //If face up or face down return without effecting corners
    if (device.orientation == UIDeviceOrientationFaceUp | device.orientation == UIDeviceOrientationFaceDown) {
        return;
    }
    
    //Check if corner were active before rotation to animate them as well to new locations
    if ([self cornersAreActive]) {
        cornersWereActive =YES;
    }else{
        cornersWereActive = NO;
    }
    
    //Deactivate corners before adjusting view
    [self deactivateFourCorners];
    
    //check if running IIOS 7.1 or lower
    if (NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) {
        
        UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
        if (orientation == UIInterfaceOrientationLandscapeRight | orientation == UIInterfaceOrientationLandscapeLeft) {
            NSLog(@"inside portrait");
            //Shown Location
            leftTopRect = CGRectMake(self.buttonInset.width, self.buttonInset.height + 64.0f, self.buttonSize.width, self.buttonSize.height);
            rightTopRect = CGRectMake(self.view.frame.size.width - self.buttonSize.width - self.buttonInset.width, self.buttonInset.height + 64.0f, self.buttonSize.width, self.buttonSize.height);
            rightBottomRect = CGRectMake(self.view.frame.size.width - self.buttonSize.width - self.buttonInset.width, self.view.frame.size.height - self.buttonSize.width - self.buttonInset.height, self.buttonSize.width, self.buttonSize.height);
            leftBottomRect = CGRectMake(self.buttonInset.width, self.view.frame.size.height - self.buttonSize.height - self.buttonInset.height, self.buttonSize.width, self.buttonSize.height);
            
            //Hidden Locations
            leftTopRectOut = CGRectMake(-self.buttonSize.width - 5.0f, -self.buttonSize.height - 5.0f + 64.0f, self.buttonSize.width, self.buttonSize.height);
            rightTopRectOut = CGRectMake(self.view.frame.size.width + 5.0f, -self.buttonSize.height - 5.0f + 64.0f, self.buttonSize.width, self.buttonSize.height);
            rightBottomRectOut = CGRectMake( self.view.frame.size.width + 5.0f, self.view.frame.size.height + self.buttonSize.height + 5.0f, self.buttonSize.width, self.buttonSize.height);
            leftBottomRectOut = CGRectMake(-self.buttonSize.width - 5.0f, self.view.frame.size.height + self.buttonSize.height+ 5.0f, self.buttonSize.width, self.buttonSize.height);
            
            blurRect = CGRectMake(0.0f, 70.0f, self.selectedViewController.view.bounds.size.width, self.selectedViewController.view.bounds.size.height);
            
        }else if (orientation == UIInterfaceOrientationPortrait){
            NSLog(@"inside landscape");
            
            //Shown Location
            leftTopRect = CGRectMake(5.0f, 5.0f + 32.0f, self.buttonSize.width, self.buttonSize.height);
            rightTopRect = CGRectMake(self.view.frame.size.height - self.buttonSize.width - 5.0f, 5.0f + 32.0f, self.buttonSize.width, self.buttonSize.height);
            rightBottomRect = CGRectMake(self.view.frame.size.height - self.buttonSize.width - 5.0f, self.view.frame.size.width - self.buttonSize.width - 5.0f, self.buttonSize.width, self.buttonSize.height);
            leftBottomRect = CGRectMake(5.0f, self.view.frame.size.width - self.buttonSize.height - 5.0f, self.buttonSize.width, self.buttonSize.height);
            
            //Hidden Locations
            leftTopRectOut = CGRectMake(-self.buttonSize.width - 5.0f, -self.buttonSize.height - 5.0f + 32.0f, self.buttonSize.width, self.buttonSize.height);
            rightTopRectOut = CGRectMake(self.view.frame.size.height + 5.0f, -self.buttonSize.height - 5.0f + 32.0f, self.buttonSize.width, self.buttonSize.height);
            rightBottomRectOut = CGRectMake( self.view.frame.size.width + 5.0f, self.view.frame.size.width + self.buttonSize.height + 5.0f, self.buttonSize.width, self.buttonSize.height);
            leftBottomRectOut = CGRectMake(-self.buttonSize.width - 5.0f, self.view.frame.size.width + self.buttonSize.height+ 5.0f, self.buttonSize.width, self.buttonSize.height);
            
            blurRect = CGRectMake(0.0f, 52.0f, self.selectedViewController.view.frame.size.height, self.selectedViewController.view.frame.size.width);
            
        }
    }else{
        
        //IOS 8.0 and up
        if (device.orientation == UIDeviceOrientationPortrait) {
            
            [self setupRectsForPortrait];
            
        }else if(device.orientation == UIDeviceOrientationLandscapeLeft | device.orientation == UIDeviceOrientationLandscapeRight){
            
            [self setupRectsForLandScape];
        }
    }
    
    //Rest corner hidden locations
    [topLeft setFrame:leftTopRectOut];
    [topRight setFrame:rightTopRectOut];
    [bottomLeft setFrame:leftBottomRectOut];
    [bottomRight setFrame:rightBottomRectOut];
    [self.blurView setFrame:blurRect];
    [self buttonForSelectedView];
    
    [self setButtons];
    
    //Corners were active, re animate them back to position.
    if (cornersWereActive) {
        
        [self activateFourCorners];
    }
    
}

- (void)buttonForSelectedView{
    CGRect button;
    
    switch (self.selectedIndex) {
        case 0:self.mainButton.frame = self.previousRect;
            break;
        case 1: button = leftTopRectOut;
            self.topLeftButton.frame = button;
            self.mainButton.frame = button;
            self.previousRect = button;
            break;
        case 2: button = rightTopRectOut;
            self.topRightButton.frame = button;
            self.mainButton.frame = button;
            self.previousRect = button;
            break;
        case 3: button = leftBottomRectOut;
            self.bottomLeftButton.frame = button;
            self.mainButton.frame = button;
            self.previousRect = button;
            break;
        case 4: button = rightTopRectOut;
            self.bottomRightButton.frame = button;
            self.mainButton.frame = button;
            self.previousRect = button;
            break;

    }
    
}

- (UIBarButtonItem*)fakeBackButton{
    
    UIBarButtonItem *fakeButton = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    return fakeButton;
}

- (void)handlePinch:(UIPinchGestureRecognizer*)pinch{
    
    //Setup enum for pinch direction
    PinchDirection pinchDirection;
    if (lastScaleValue > pinch.scale) {
        pinchDirection = pinchInward;
    }
    if (lastScaleValue < pinch.scale){
        pinchDirection = pinchOutward;
    }
    lastScaleValue = pinch.scale;
    
    //Pinch in inward - activate corners
    if (pinchDirection == pinchInward && pinch.velocity < -5.0f) {
        [self activateFourCorners];
    }
    
    //Pinch in outward - deactivate corners
    if (pinchDirection == pinchOutward && pinch.velocity > 5.0f) {
        [self deactivateFourCorners];
    }
    
}

- (void)activateFourCorners{
    
    //set buttons
    [self setButtons];

    
    //Animate corners to shown location
    
    if (!self.animateInDuration) {
        self.animateInDuration = 0.4f;
    }
    
    if (!self.animateDamping) {
        self.animateDamping = 0.5f;
    }
    
    if (!self.animateVelocity) {
        self.animateVelocity = 0.5f;
    }
    

    
    [UIView animateWithDuration:self.animateInDuration/2 animations:^{
        [self.blurView setAlpha:0.8];
        [self.blurView setFrame:blurRect];

    }];

    [UIView animateWithDuration:self.animateInDuration
                          delay:0.0f
         usingSpringWithDamping:self.animateDamping
          initialSpringVelocity:self.animateVelocity
                        options:UIViewAnimationOptionCurveEaseInOut animations:^{
                            
                            [topLeft setFrame:leftTopRect];
                            [topRight setFrame:rightTopRect];
                            [bottomLeft setFrame:leftBottomRect];
                            [bottomRight setFrame:rightBottomRect];
                            
                        }
                     completion:^(BOOL finished) {
                         
                         if (finished) {

                         }
                         
                     }];
    
}

- (BOOL)cornersAreActive{
    
    if (self.topRightButton.frame.origin.x == rightTopRect.origin.x | self.mainButton.frame.origin.x == rightTopRect.origin.x) {
        return YES;
    }else{
        return NO;
    }
    
}
- (void)deactivateFourCorners{
    
    if (!self.animateOutDuration) {
        self.animateOutDuration = 0.3;
    }
    
    //Animate corners to hidden location
    [UIView animateWithDuration:self.animateOutDuration
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                         [self.blurView setAlpha:0.0f];
                         [topLeft setFrame:leftTopRectOut];
                         [topRight setFrame:rightTopRectOut];
                         [bottomLeft setFrame:leftBottomRectOut];
                         [bottomRight setFrame:rightBottomRectOut];
                         
                     } completion:^(BOOL finished) {
                         if (finished) {
                    

                         }
                         
                     }];

}

- (void)handleMainButton:(UIButton*)button{
    [self launchViewContoller:self.mainViewController fromButton:button];
}

- (void)handleTopLeftButton:(UIButton*)button{
    [self launchViewContoller:self.topLeftViewController fromButton:button];
}

- (void)handleTopRightButton:(UIButton*)button{
    [self launchViewContoller:self.topRightViewController fromButton:button];
}

- (void)handleBottomLeftButton:(UIButton*)button{
    [self launchViewContoller:self.bottomLeftViewController fromButton:button];
}

- (void)handleBottomRightButton:(UIButton*)button{
    [self launchViewContoller:self.bottomRightViewController fromButton:button];
}

- (void)launchViewContoller:(UIViewController*)viewController fromButton:(UIButton*)button{
 
    [self deactivateFourCorners];
    [self setSelectedViewController:viewController];
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
