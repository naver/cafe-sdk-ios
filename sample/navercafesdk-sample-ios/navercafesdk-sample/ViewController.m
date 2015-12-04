//
//  ViewController.m
//  navercafesdk-sample
//
//  Created by Gyeonghwan on 2015. 10. 26..
//  Copyright (c) 2015년 navercorp. All rights reserved.
//

#import "ViewController.h"
#import <NaverCafeSDK/NCSDKManager.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    [[NCSDKManager getSharedInstance] setNaverLoginClientId:@"197CymaStozo7X5r2qR5"
                                     naverLoginClientSecret:@"evCgKH1kJL"
                                                     cafeId:28290504];
    
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    [button1 setImage:[UIImage imageNamed:@"icon1.png"] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(touchButton1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(button1.frame), 40, 40)];
    [button2 setImage:[UIImage imageNamed:@"icon2.png"] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(touchButton2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchButton1 {
    [[NCSDKManager getSharedInstance] setParentViewController:self];
    [[NCSDKManager getSharedInstance] presentMainViewController];
}
- (void)touchButton2 {
    [[NCSDKManager getSharedInstance] setParentViewController:self];
    [[NCSDKManager getSharedInstance] presentArticlePostViewControllerWithMenuId:10 subject:@"제 점수는요" content:@"100점?"];
}

@end
