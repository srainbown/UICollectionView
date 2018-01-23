//
//  ZoneViewController.m
//  瀑布流
//
//  Created by CC on 2018/1/23.
//  Copyright © 2018年 View. All rights reserved.
//

#import "ZoneViewController.h"

@interface ZoneViewController ()

@end

@implementation ZoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (_model == nil) {
        self.view.backgroundColor = [UIColor whiteColor];
    }else{
        self.title = _model.title;
        self.view.backgroundColor = _model.bgColor;
    }
}

@end
