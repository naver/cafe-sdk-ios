//
//  ViewController.m
//  navercafesdk-sample
//
//  Created by Gyeonghwan on 2015. 10. 26..
//  Copyright (c) 2015년 navercorp. All rights reserved.
//

#import "ViewController.h"
#import <NaverCafeSDK/NCSDKManager.h>
@interface ViewController () <NCSDKManagerDelegate, UIAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    
    //use Naver Cafe (korea)
    [[NCSDKManager getSharedInstance] setNaverLoginClientId:@"197CymaStozo7X5r2qR5"
                                     naverLoginClientSecret:@"evCgKH1kJL"
                                                     cafeId:28290504];
    //use Moot (global)
    [[NCSDKManager getSharedInstance] setGlobalConsumerKey:@"PLUGTESTKEY"
                                      globalConsumerSecret:@"PLUGTESTSECRET"
                                         globalCommunityNo:1
                                            globalLoungeNo:58];

    [[NCSDKManager getSharedInstance] setParentViewController:self];
    [[NCSDKManager getSharedInstance] setNcSDKDelegate:self];
    [[NCSDKManager getSharedInstance] setUseWidgetScreenShot:YES];
    [[NCSDKManager getSharedInstance] setUseWidgetVideoRecord:YES];
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    [button1 setImage:[UIImage imageNamed:@"icon1.png"] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(touchButton1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(button1.frame), 40, 40)];
    [button2 setImage:[UIImage imageNamed:@"icon2.png"] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(touchButton2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];

    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(button2.frame), 40, 40)];
    [button3 setImage:[UIImage imageNamed:@"icon3.png"] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(touchButton3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
}
- (void)setOrientationMode {
    [[NCSDKManager getSharedInstance] setOrientationIsLandscape:UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchButton1 {
    [self setOrientationMode];
    [[NCSDKManager getSharedInstance] presentMainViewController];
}
- (void)touchButton2 {
    [self setOrientationMode];
    NSString *filePath = [self screenShotFilePath];
    [[NCSDKManager getSharedInstance] presentArticlePostViewControllerWithType:kGLArticlePostTypeImage filePath:filePath];
}
- (void)touchButton3 {
    [self setOrientationMode];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"ShortCut" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
    [alert addButtonWithTitle:[NSString stringWithFormat:@"Toggle Translate Slider"]];
    [alert show];
}

#pragma mark - NCSDKManagerDelegate
- (void)ncSDKViewDidLoad {
    NSLog(@"ncSDKViewDidLoad");
}
- (void)ncSDKViewDidUnLoad {
    NSLog(@"ncSDKViewDidUnLoad");
}
- (void)ncSDKJoinedCafeMember {
    NSLog(@"Complete To Join Cafe");
}
- (void)ncSDKPostedArticleAtMenu:(NSInteger)menuId
                attachImageCount:(NSInteger)imageCount
                attachVideoCount:(NSInteger)videoCount {
    NSLog(@"Complete To Write, Menu ID[%@]", @(menuId));
}
- (void)ncSDKPostedCommentAtArticle:(NSInteger)articleId {
    NSLog(@"Complete Comment, Article ID[%@]", @(articleId));
}
- (void)ncSDKRequestScreenShot {
    
}
- (void)ncSDKDidVoteAtArticle:(NSInteger)articleId {
    NSLog(@"Complete to vote, Article ID[%@]", @(articleId));
}

- (void)ncSDKWidgetPostArticleWithImage {
    NSString *filePath = [self screenShotFilePath];
    [[NCSDKManager getSharedInstance] presentArticlePostViewControllerWithType:kGLArticlePostTypeImage filePath:filePath];
}
- (void)ncSDKWidgetSuccessVideoRecord {
    [[NCSDKManager getSharedInstance] presentArticlePostViewController];
}
- (void)ncSDKAppSchemeBanner:(NSString *)appScheme {
    NSLog(@"ncSDKAppSchemeBanner %@", appScheme);
}
- (void)ncSDKDidEndWatchingLiveSeconds:(NSInteger)seconds {
    NSLog(@"ncSDKDidEndWatchingLiveSeconds %@", @(seconds));
}
#pragma mark - UIAlertViewDelegate
static BOOL kSliderToggle = NO;
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if ([title hasPrefix:@"Toggle"]) {
        kSliderToggle = !kSliderToggle;
        [[NCSDKManager getSharedInstance] disableTransparentSlider:kSliderToggle];
    }
    
}

- (NSString *)screenShotFilePath {
    UIView *targetScreen = self.view;
    
    UIGraphicsBeginImageContextWithOptions(targetScreen.bounds.size, targetScreen.opaque, 0.0);
    [targetScreen.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screengrab = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *pngData = UIImagePNGRepresentation(screengrab);
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"GLAttachImage.png"];
    [pngData writeToFile:filePath atomically:YES];
    
    return filePath;
}
@end
