//
//  ViewController.m
//  DemoPolySDK
//
//  Created by yangting on 2020/8/12.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import "VLRootViewController.h"
#import "VLRootViewCell.h"

#import "VLSplashRootController.h"
#import "VLBannerViewController.h"
#import "VLInterstitialAdController.h"
#import "VLRewardVideoAdController.h"
#import "VLNativeRootViewController.h"
#import "DrawNativeViewController.h"
#import "VLNContentViewController.h"
#import "VLGameRootViewController.h"
#import "VLNewsRootViewController.h"

@interface VLRootViewController ()
<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *contentArr;
@end

@implementation VLRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self defaultInit];
    
    [self loadData];
}

#pragma mark --初始化配置
- (void)defaultInit {
    [self.tableView registerNib:[UINib nibWithNibName:@"VLRootViewCell" bundle:nil] forCellReuseIdentifier:@"VLRootViewCell"];
    
    self.title = @"瑞狮3000SDK";
}

- (void)loadData {
    self.contentArr = @[
    @{kVLRootViewControllerAdTypeKey : @(VLPolyAdSDKTypeSplash),
      kVLRootViewControllerAdNameKey : @"开屏广告"},
    
    @{kVLRootViewControllerAdTypeKey : @(VLPolyAdSDKTypeBanner),
      kVLRootViewControllerAdNameKey : @"横幅广告"},
    
    @{kVLRootViewControllerAdTypeKey : @(VLPolyAdSDKTypeInterstitial),
      kVLRootViewControllerAdNameKey : @"插屏广告"},
    
    @{kVLRootViewControllerAdTypeKey : @(VLPolyAdSDKTypeRewardVideo),
      kVLRootViewControllerAdNameKey : @"激励视频广告"},
    
    @{kVLRootViewControllerAdTypeKey : @(VLPolyAdSDKTypeNative),
      kVLRootViewControllerAdNameKey : @"原生广告"},
    
    @{kVLRootViewControllerAdTypeKey : @(VLPolyAdSDKTypeDraw),
      kVLRootViewControllerAdNameKey : @"Draw广告"},
    
    @{kVLRootViewControllerAdTypeKey : @(VLPolyAdSDKTypeContent),
      kVLRootViewControllerAdNameKey : @"短视频内容"},
    
    @{kVLRootViewControllerAdTypeKey : @(VLPolyAdSDKTypeSmallGame),
      kVLRootViewControllerAdNameKey : @"小游戏"},
    
    @{kVLRootViewControllerAdTypeKey : @(VLPolyAdSDKTypeNewsPage),
      kVLRootViewControllerAdNameKey : @"新闻资讯"},
    ];
}

- (void)handleEventWithAdType:(VLPolyAdSDKType)sdkAdType {
    switch (sdkAdType) {
        case VLPolyAdSDKTypeSplash:
            {
                VLSplashRootController *vc = [VLSplashRootController new];
                [self.navigationController pushViewController:vc animated:YES];
            }
            break;
            
        case VLPolyAdSDKTypeBanner:
        {
            VLBannerViewController *vc = [VLBannerViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
            case VLPolyAdSDKTypeInterstitial:
        {
            VLInterstitialAdController *vc = [VLInterstitialAdController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
            case VLPolyAdSDKTypeRewardVideo:
        {
            VLRewardVideoAdController *vc = [VLRewardVideoAdController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
            case VLPolyAdSDKTypeNative:
        {
            VLNativeRootViewController *vc = [VLNativeRootViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
            case VLPolyAdSDKTypeDraw:
        {
            DrawNativeViewController *vc = [DrawNativeViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
            case VLPolyAdSDKTypeContent:
        {
            VLNContentViewController *vc = [VLNContentViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        case VLPolyAdSDKTypeSmallGame:
        {
            VLGameRootViewController *vc = [VLGameRootViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        case VLPolyAdSDKTypeNewsPage:
        {
            VLNewsRootViewController *vc = [VLNewsRootViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        default:
            break;
    }
}

#pragma mark --UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.contentArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VLRootViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VLRootViewCell"];
    cell.infoDict = [self.contentArr objectAtIndex:indexPath.section];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *infoDict = [self.contentArr objectAtIndex:indexPath.section];
    VLPolyAdSDKType sdkAdType = [[infoDict objectForKey:kVLRootViewControllerAdTypeKey] integerValue];
    [self handleEventWithAdType:sdkAdType];
}

@end
