//
//  DiscoverModel.m
//  瀑布流
//
//  Created by CC on 2018/1/23.
//  Copyright © 2018年 View. All rights reserved.
//

#import "DiscoverModel.h"

@implementation DiscoverModel

-(instancetype) initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.title = [NSString stringWithFormat:@"%@",dic[@"title"]];
        self.bgColor = dic[@"bgColor"];
    }
    return self;
}

@end
