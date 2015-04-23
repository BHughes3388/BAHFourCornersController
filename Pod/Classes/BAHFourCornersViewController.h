//
//  BAHFourCornersViewController.h
//  Pods
//
//  Created by BHughes on 4/19/15.
//
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface BAHFourCornersViewController : UITabBarController <UITabBarControllerDelegate,UIGestureRecognizerDelegate>

@property(nonatomic, strong)UIButton *topLeftButton;

@property(nonatomic, strong)UIImage *topLeftButtonImage;

@property(nonatomic, strong)UIViewController *topLeftViewController;

@property(nonatomic, strong)UIButton *topRightButton;

@property(nonatomic, strong)UIImage *topRightButtonImage;

@property(nonatomic, strong)UIViewController *topRightViewController;

@property(nonatomic, strong)UIButton *bottomLeftButton;

@property(nonatomic, strong)UIImage *bottomLeftButtonImage;

@property(nonatomic, strong)UIViewController *bottomLeftViewController;

@property(nonatomic, strong)UIButton *bottomRightButton;

@property(nonatomic, strong)UIImage *bottomRightButtonImage;

@property(nonatomic, strong)UIViewController *bottomRightViewController;

@property(nonatomic, strong)UIButton *mainButton;

@property(nonatomic, strong)UIImage *mainButtonImage;

@property(nonatomic, strong)UIViewController *mainViewController;

@property(nonatomic, strong)UIColor *viewTintColor;

@property (nonatomic) CGSize buttonSize;

@property (nonatomic) CGSize buttonImageInsets;

@property (nonatomic) float buttonCornerRadius;

@property (nonatomic) CGSize buttonInset;

@property (nonatomic) float animateInDuration;

@property (nonatomic) float animateOutDuration;

@property (nonatomic) float animateDamping;

@property (nonatomic) float animateVelocity;

- (void)initalizeFourCorners;

- (void)setAnimateDamping:(float)animateDamping;

- (void)setAnimateVelocity:(float)animateVelocity;

- (void)setAnimateInDuration:(float)animateInDuration;

- (void)setAnimateOutDuration:(float)animateOutDuration;

- (void)setButtonInset:(CGSize)buttonInset;

- (void)setViewTintColor:(UIColor *)viewTintColor;

- (void)setButtonSize:(CGSize)buttonSize;

- (void)setButtonImageInsets:(CGSize)buttonImageInsets;

- (void)setButtonCornerRadius:(float)buttonCornerRadius;

- (void)setMainViewController:(UIViewController *)mainViewController;

- (void)setTopLeftViewController:(UIViewController *)topLeftViewController;

- (void)setTopRightViewController:(UIViewController *)topRightViewController;

- (void)setBottomLeftViewController:(UIViewController *)bottomLeftViewController;

- (void)setBottomRightViewController:(UIViewController *)bottomRightViewController;

- (void)setMainButton:(UIButton *)mainButton;

- (void)setTopLeftButton:(UIButton *)topLeftButton;

- (void)setTopRightButton:(UIButton *)topRightButton;

- (void)setBottomLeftButton:(UIButton *)bottomLeftButton;

- (void)setBottomRightButton:(UIButton *)bottomRightButton;

- (void)setMainButtonImage:(UIImage *)mainButtonImage;

- (void)setTopLeftButtonImage:(UIImage *)topLeftButtonImage;

- (void)setTopRightButtonImage:(UIImage *)topRightButtonImage;

- (void)setBottomLeftButtonImage:(UIImage *)bottomLeftButtonImage;

- (void)setBottomRightButtonImage:(UIImage *)bottomRightButtonImage;


@end
