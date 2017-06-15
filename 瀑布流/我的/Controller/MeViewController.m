//
//  MeViewController.m
//  瀑布流
//
//  Created by 李自杨 on 2017/4/21.
//  Copyright © 2017年 View. All rights reserved.
//

#import "MeViewController.h"
#import <WebKit/WebKit.h>

@interface MeViewController ()<WKUIDelegate,WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBACOLOR(255, 255, 255, 1);
    
    _webView = [[WKWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_webView];
    
//    _webView.UIDelegate = self;
//    _webView.navigationDelegate = self;
    
    NSString *urlStr = @"https://www.zhihu.com/explore";
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
    
    //刷新按钮
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"nav_icon_home_active"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnClick)];
    
    self.navigationItem.rightBarButtonItem = btn;
    
    UIView *view = [[UIView alloc]init];
    [self.view addSubview:view];

   

}

-(void)rightBtnClick{

//    [_webView reload];
    NSString *urlStr = @"https://www.bilibili.com/video/av7989728";
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
    //返回上一级
    [_webView goBack];
    
}



@end
