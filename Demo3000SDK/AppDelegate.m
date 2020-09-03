//
//  AppDelegate.m
//  Demo3000SDK
//
//  Created by yangting on 2020/9/3.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import "AppDelegate.h"
#import <VLionADSDK/VLNADSDK.h>

@interface AppDelegate ()<VLNSplashAdDelegate>
@property (nonatomic, strong) VLNSplashAd *ad;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[VLNAdSDKManager defaultManager] registerAppId:@"50017" finishBlock:^(BOOL success, NSError * _Nonnull error) {
        
        if (success) {
            VLNSplashAd *ad = [[VLNSplashAd alloc] initWithSceneName:@"scene"];
            ad.delegate = self;
            self.ad = ad;
            [ad loadAdAndShowInWindow:self.window];
        }
        else {
            NSLog(@"sdk初始化失败");
        }
        
    }];
    
    return YES;
}

- (void)vl_splashAdDidLoad:(VLNSplashAd *)splashAd {
    NSLog(@"VLNSplashAd DidLoad");
}

- (void)vl_splashAd:(VLNSplashAd *)splashAd didFailWithError:(NSError *)error {
    NSLog(@"VLNSplashAd didFailWithError");
}

- (void)vl_splashAdExposured:(VLNSplashAd *)splashAd {
    NSLog(@"VLNSplashAd splashAdExposured");
}

- (void)vl_splashAdDidClick:(VLNSplashAd *)splashAd {
    NSLog(@"VLNSplashAd splashAdDidClick");
}

- (void)vl_splashAdWillClose:(VLNSplashAd *)splashAd {
    NSLog(@"VLNSplashAd splashAdWillClose");
}

- (void)vl_splashAdDidClose:(VLNSplashAd *)splashAd {
    NSLog(@"VLNSplashAd splashAdDidClose");
}

@end
