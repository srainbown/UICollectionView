//
//  SecondViewController.m
//  瀑布流
//
//  Created by 紫川秀 on 2018/1/3.
//  Copyright © 2018年 View. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

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
