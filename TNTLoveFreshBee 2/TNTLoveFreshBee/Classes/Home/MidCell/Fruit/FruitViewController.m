//
//  FruitViewController.m
//  TNTLoveFreshBee
//-Xmx256m
//  Created by 赵世得 on 2016/10/13.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "FruitViewController.h"
#import <Masonry.h>

@interface FruitViewController ()<UIWebViewDelegate>

@end

@implementation FruitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor brownColor];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
    NSURL *url = [NSURL URLWithString:@"http://m.beequick.cn/show/active?city_id=2&location_hash=80efb27n%2BewKbWahEc9R1wxDwoGvpAKn6T3amwQ0o1tAzAXStsms0KGNJg&zchtid=12064&g_imei=867689026846818&location_time=1476444373&shopId=12064&__v=android5.8&g_ipAddress=192.168.2.3&androidnewwebview=true&id=21749&g_mac=0cd6bd9b37ff&show_reload=1&g_screen_points=1080x1812&zchtauth=983731PLdTzypKUhgZXcZXWicqIfrhBPClygRiMdffd2Rcv08&hide_cart=0&__d=d14jyDobSxt2K7Rk%2BqN5H2%2F9slL8BapXxVkwPlIfnvAdPZXr%2Bt86AJeF2SZpcPklB2kCA15RqhnlhSb3UNGFbx%2Bj3q6ayujDjR8w%2BvSsiTXbttLlZg3M%2F83dqhN%2BilFKZ1zc&isGotoNative=0&trackid=icon1%7C21749&cityid=2&GPS_LatLng=116.34274%2C40.06468&location=116.34274%2C40.06468&bigids=2%2C0&name=%E9%B2%9C%E8%B4%A7%E7%9B%B4%E4%BE%9B&g_platform=ANDROID&random=1276571654&activitygroup=xianhuozhigong&g_screen_pixels=1080x1812&delivery_type=0"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSMutableString *stringM = [NSMutableString string];
    [stringM appendString:@"var imgTag = document.getElementsByTagName('figure')[0].children[0]; imgTag.onclick = function(){window.location.href='hm://www.yaowoya.com'};"];
    [webView stringByEvaluatingJavaScriptFromString:stringM];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
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
