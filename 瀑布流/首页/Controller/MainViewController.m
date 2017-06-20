//
//  MainViewController.m
//  瀑布流
//
//  Created by 李自杨 on 2017/4/20.
//  Copyright © 2017年 View. All rights reserved.
//

/*
    
 UICollectionView继承自UIScrollView是一种全新的数据展示方式，简单来说可以把它理解成多列的TableView,可以做九宫格布局的一种View.
 
 UICollectionView的基本组成:
                          1.Cells             展示内容
                            Cells用于展示内容的主体,Cell的尺寸和内容可以各不相同
 
                          2.Supplementary     追加视图
                            Supplementary类似UITableView每个Section的HeaderView 或者FooterView,用来标记Section的View
 
                          3.DecorationViews   背景视图
                            Decorationviews装饰视图，完全跟数据没有关系的视图,负责给cell或者supplementary添加辅助视图用的,灵活性较强
 
 
 不管多么复杂的UICollectionView都是有着三个部分组成的。

********************************************************************************************
 
 1.注册要使用的cell对应的类型
- (void)registerClass:(nullable Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier;
- (void)registerNib:(nullable UINib *)nib forCellWithReuseIdentifier:(NSString *)identifier;

 2.注册要使用的补充视图(HeaderView 和 FooterView)对应的类型
- (void)registerClass:(nullable Class)viewClass forSupplementaryViewOfKind:(NSString *)elementKind withReuseIdentifier:(NSString *)identifier;
- (void)registerNib:(nullable UINib *)nib forSupplementaryViewOfKind:(NSString *)kind withReuseIdentifier:(NSString *)identifier;
 
 3.复用队列
- (__kindof UICollectionViewCell *)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;
- (__kindof UICollectionReusableView *)dequeueReusableSupplementaryViewOfKind:(NSString *)elementKind withReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;
 
 4.这些方法允许动态修改当前的Item 和 Section
    插入Section
- (void)insertSections:(NSIndexSet *)sections;
    删除Section
- (void)deleteSections:(NSIndexSet *)sections;
    刷新Section
- (void)reloadSections:(NSIndexSet *)sections;
    移动Section
- (void)moveSection:(NSInteger)section toSection:(NSInteger)newSection;

    插入Item
- (void)insertItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths;
    删除Item
- (void)deleteItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths;
    刷新Item
- (void)reloadItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths;
    移动Item
- (void)moveItemAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath;

    同样可以进行批量操作
- (void)performBatchUpdates:(void (^ __nullable)(void))updates completion:(void (^ __nullable)(BOOL finished))completion; // allows
 
 5.其它属性 和 方法相关
    预加载
@property (nonatomic, getter=isPrefetchingEnabled) BOOL prefetchingEnabled NS_AVAILABLE_IOS(10_0);
    允许选择
@property (nonatomic) BOOL allowsSelection; // default is YES
    允许多个选择
@property (nonatomic) BOOL allowsMultipleSelection; // default is NO
    全局刷新
- (void)reloadData; // discard the dataSource and delegate data and requery as necessary
    布局动画
- (void)setCollectionViewLayout:(UICollectionViewLayout *)layout animated:(BOOL)animated; // transition from one layout to another
- (void)setCollectionViewLayout:(UICollectionViewLayout *)layout animated:(BOOL)animated completion:(void (^ __nullable)(BOOL finished))completion NS_AVAILABLE_IOS(7_0);
 

 6.UICollectionView与UITableView比较
 
    相同点:
 
            都需要遵守DataSource和 Delegate，实现协议方法。
 
    不同点:
 
            与UITableView的最大不同，布局交给了指定的UICollectionViewLayout布局对象。
            UICollectionView 的cell 使用必须先注册，使用出列的方式。
             
            UICollectionView：Supplementary 补充视图需要先注册（这里可以充当区的头和尾）。
 
 */




#import "MainViewController.h"

@interface MainViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = K_RGBACOLOR(255, 255, 255, 1);
        
    
}

#pragma mark -- UICollectionViewDataSource 开始(主要管理视图数据源方面，告诉视图要显示些什么以及如何显示)
#pragma mark -- @required（必须）
//设置容器视图各个组中有多少个items
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 10;
}

//设置每个区中item的内容，类似于UITableViewCell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
//  UICollectionViewCell：相对于UItableViewCell而言，UIcollectionViewCell没有那么多样式。UIcollectionViewCell不存在所谓的style，也没有titleLabel和内置的imageView属性，UIcollectionViewCell的结构上相对比较简单。
//    
//    cell：本身作为的View，这里应该就是UICollectionReusableView
//    
//    backgroundView ：用作cell背景的视图，设置背景图片等。
//    
//    selectedBackgroundView ：cell被选中的背景视图
//    
//    contentView ：内容视图，自定义的cell时应该将内容放在这个View上
//    
//    补充：UIcollectionView有一个小细节：被选中的cell的自动变化，所有的cell中的子View，也包括contentView中的子View，当cell被选中是，会自动去查找view是否有被选中状态下的改变，如果在contentView中有一个imageView的selected和normal状态下的图片是不同的，那么选中cell这张图片也会从normal变成selected，不需要添加代码。
    
    return nil;
}

#pragma mark -- @optional（可选）
//设置容器视图有多少个组,默认为1
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

//补充视图，这里可以充当区的 头 和 尾 ，默认返回nil,
//通过king参数区分是 头 还是 尾
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    return nil;
}

//询问是否指定的单元格项目是否可以移动到集合视图的另一个位置
-(BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return NO;
}

//将制定的单元格项目从一个位置移动到集合视图的另一个位置
-(void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{

}

#pragma mark -- UICollectionViewDataSource 结束(主要管理视图数据源方面，告诉视图要显示些什么以及如何显示)

#pragma mark -- UICollectionViewDelegate 开始(主要管理与用户交互方面，提供一些样式的小细节)
#pragma mark -- @optional（可选）
//cell点击时是否高亮，点击cell时的样式和点击后cell的样式
-(BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}
//手指按下高亮
-(void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
//手指松开取消高亮
-(void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{

}
//当前item是否可以点击
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return NO;
}
//当前item是否取消点击
-(BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return NO;
}

/*
 事件的处理顺序如下:
    1.手指按下 shouldHighlightItemAtIndexPath (如果返回YES则向下执行，否则执行到这里为止)
    2.didHighlightItemAtIndexPath(高亮)
    3.手指松开didUnhighlightItemAtIndexPath(取消高亮)
    4.shouldSelectItemAtIndexPath (如果返回YES则向下执行，否则执行到这里为止)
    5.didSelectItemAtIndexPath(执行选择事件)
 */



/*
    ..选中和取消item时，会触发的方法
 */

//选中和取消选中item时，会触发的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
//取消选中itme时，会触发的方法
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{

}



/*
    ..补充视图(头 或 尾) ，显示 和 移除
 */

//这两个方法分别是指定indexPath的cell将要显示出的时候调用
//和指定IndexPath的头部 和 尾部将要显示出来的时候调用
-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{

}

-(void)collectionView:(UICollectionView *)collectionView willDisplaySupplementaryView:(UICollectionReusableView *)view forElementKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath{
    
}

//这两个方法分别是制定indexPath的cell将要从collectionView中移除的时候调用
//和指定indexPath的头 和 尾 将要从collectionView中移除的时候调用
-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{

}

-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(UICollectionReusableView *)view forElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath{

}

/*
    ..长按某item,弹出copy(复制)和paste(粘贴)的菜单相关
 */

//是否弹出菜单，需要返回YES
-(BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return NO;
}

//是否可以弹出事件，使copy和paste有效
-(BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(nonnull SEL)action forItemAtIndexPath:(nonnull NSIndexPath *)indexPath withSender:(nullable id)sender{
    return NO;
}

//对事件进行相应操作
-(void)collectionView:(UICollectionView *)collectionView performAction:(nonnull SEL)action forItemAtIndexPath:(nonnull NSIndexPath *)indexPath withSender:(nullable id)sender{
    
}

#pragma mark -- UICollectionViewDelegate 结束(主要管理与用户交互方面，提供一些样式的小细节)

#pragma mark -- UICollectionViewDelegateFlowLayout 开始(针对indexPath对应的item进行个性化设置，如果使用UIcollectionViewFlowLayout布局，这些代理方法自动调用)
//设置指定Indexpath的单元格大小(itemSize)
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(0, 0);
}

//设置分组中的每一个单元格的上下左右的空白距离(内边距)
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//设置分组中的单元格的行间距(竖距)
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

//设置每行中的item的列间距(水平)
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

//分组的头部视图的size大小，含义也是有滚动方向决定的
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(0, 0);
}

//分组的尾部视图的size大小，含义也是有滚动方向决定的
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(0, 0);
}

#pragma mark -- UICollectionViewDelegateFlowLayout 结束(针对indexPath对应的item进行个性化设置，如果使用UIcollectionViewFlowLayout布局，这些代理方法自动调用)



@end
