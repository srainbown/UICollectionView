//
//  SecondCollectionViewCell.m
//  瀑布流
//
//  Created by CC on 2018/1/23.
//  Copyright © 2018年 View. All rights reserved.
//

#import "SecondCollectionViewCell.h"

@implementation SecondCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];
    }
    return self;
}

-(void)layoutSubviews{
    
    
}


@end
