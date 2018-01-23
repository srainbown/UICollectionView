//
//  DiscoverModel.h
//  瀑布流
//
//  Created by CC on 2018/1/23.
//  Copyright © 2018年 View. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiscoverModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) UIColor *bgColor;

-(instancetype) initWithDic:(NSDictionary *)dic;

@end
