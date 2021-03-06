//
//  VLBannerViewController.m
//  DemoPolySDK
//
//  Created by yangting on 2020/8/13.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import "VLBannerViewController.h"
#import <VLionADSDK/VLNADSDK.h>

@interface VLBannerViewController ()<VLNBannerViewDelegate>
@property (nonatomic, strong) VLNBannerView *vlBannerView;
@end

@implementation VLBannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CGSize adSize = CGSizeMake(UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.width/6.4);
//    self.vlBannerView = [[VLNBannerView alloc] initWithSceneName:@"scene"
//                                                          adSize:adSize
//                                                        delegate:self
//                                              rootViewController:self];
//    self.vlBannerView.frame = CGRectMake(0, 200, adSize.width, adSize.height);
//    [self.view addSubview:self.vlBannerView];
//
//    [self.vlBannerView loadAd];
    
    
    CGSize adSize = CGSizeMake(UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.width/6.4);
    self.vlBannerView = [[VLNBannerView alloc] initWithTag3000Id:@"60027"
                                                          adSize:adSize
                                                        delegate:self
                                              rootViewController:self];
    self.vlBannerView.frame = CGRectMake(0, 200, adSize.width, adSize.height);
    [self.view addSubview:self.vlBannerView];
    
    [self.vlBannerView loadAd];
    
}

- (IBAction)btn_reloadBanner:(id)sender {
    [self.vlBannerView loadAd];
}
#pragma mark --VLNBannerViewDelegate

- (void)vl_bannerView:(VLNBannerView *)bannerView sizeRate:(CGFloat)sizeRate {
    CGSize adSize = bannerView.bounds.size;
    self.vlBannerView.frame = CGRectMake(0, 200, adSize.width, adSize.width/sizeRate);
}

/**
         Banner广告加载成功.
 */
- (void)vl_bannerViewDidLoad:(VLNBannerView *)bannerView {
    
}

/**
         Banner广告加载或者展示失败.
         @param error :失败error
 */
- (void)vl_bannerView:(VLNBannerView *)bannerView didFailWithError:(NSError *)error {
    NSLog(@"banner加载失败%@", error);
}

/**
         Banner广告曝光回调
 */
- (void)vl_bannerViewExposured:(VLNBannerView *)bannerView {
    
}

/**
         Banner广告点击回调
 */
- (void)vl_bannerViewDidClick:(VLNBannerView *)bannerView {
    
}

/**
         Banner广告关闭回调，您需要在该回调方法里面，移除掉广告对象
 */
- (void)vl_bannerViewDidClose:(VLNBannerView *)bannerView {
    [self.vlBannerView removeFromSuperview];
}
@end
