//
//  DisCollectionViewCell.m
//  瀑布流
//
//  Created by 李自杨 on 2017/4/20.
//  Copyright © 2017年 View. All rights reserved.
//

#import "DisCollectionViewCell.h"

@implementation DisCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

//如果你需要更精确控制子view，而不是使用限制或autoresizing行为，就需要实现该方法
-(void)layoutSubviews{

    self.backgroundColor = [UIColor orangeColor];
    
//    UIButton *btn = [[UIButton alloc]init];
//    [self addSubview:btn];


//    //实现这些方法覆盖你的view如何与其他view对齐布局
//    [self alignmentRectForFrame:CGRectMake(0, 0, 0, 0)];
//    [self frameForAlignmentRect:CGRectMake(0, 0, 0, 0)];
//    
//    //当你想在执行resize操作时有一个不同于默认的size，实现该方法。比如，你可以用这个方法阻止view收缩到view不能正确显示的点
//    [self sizeThatFits:CGSizeMake(0, 0)];
//    
//    //跟踪子view添加事件
//    [self didAddSubview:btn];
//    //跟踪子view的删除事件
//    [self willRemoveSubview:btn];
    
//    //跟踪当前view在view层次里的运动
//    [self willMoveToSuperview:btn];
//    [self didMoveToSuperview];
    
//    //跟踪view(即将或已经)移动到另一个window
//    [self willMoveToWindow:[[UIWindow alloc]init]];
//    [self didMoveToWindow];
   

}
//
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//}
//-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//}
//-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//}
////高等级系统系事件插入，列入来电等
//-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//}




@end
