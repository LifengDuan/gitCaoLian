//
//  MineMyPartnershipViewController.m
//  SubOthersDetail
//
//  Created by 张木锋 on 2016/10/15.
//  Copyright © 2016年 ZMF. All rights reserved.
//

#import "MineMyPartnershipViewController.h"
#import "Masonry.h"
@implementation MineMyPartnershipViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"合作加盟";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"客服电话" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    
    [self setupWebViewUI];
    
}

- (void)setupWebViewUI {
    
    UIWebView *webView = [[UIWebView alloc] init];
    
    webView.scalesPageToFit = YES;
    
    [self.view addSubview:webView];
    
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(2);
        make.right.offset(-2);
        make.top.offset(0);
        make.bottom.offset(0);
    }];
    
    NSURL *URL = [NSURL URLWithString:@"http://m.beequick.cn/show/join?city_id=2&location_hash=06c411fG7nnfi6ZJ%2FyPIGGbGudfmZ0FdEiIzvb6g1d8MExTWLSoSgBgTO6&zchtid=12140&g_imei=867992028023869&location_time=1476547471&shopId=12140&__v=android5.8&g_ipAddress=192.168.31.125&androidnewwebview=true&GPS_LatLng=116.342019%2C40.061552&location=116.342019%2C40.061552&bigids=2%2C0&g_platform=ANDROID&g_mac=683e342348e0&random=-105733736&g_screen_pixels=1080x1920&g_screen_points=1080x1920&delivery_type=0&zchtauth=ce15f6n6h94FApM9BNZlHirzeVl5rC%252BOWYfkgCuHbyjlPArMk&__d=d14jyDobSxt2feIyrPUvSTms4Vv7Af8GkQthPlIYn%2F9IPZXr%2Bt86AJeF2SZpcPklB2kCA15Rqhnlhyf%2BUtOGaxv1ifyTmu%2FB30s3%2FPT7jGSA6tfrOwLLpsyKqEF7318ZZ1zY"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    [webView loadRequest:request];
    
}
@end
