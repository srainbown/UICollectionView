//
//  DiscoverViewController.m
//  瀑布流
//
//  Created by 李自杨 on 2017/4/20.
//  Copyright © 2017年 View. All rights reserved.
//

/*
 UICollectionView 使用说明
 
1.      创建UICollectionView必须要有布局参数flowLayout;(采用懒加载)
 UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
 
2.      cell必须通过注册;
 registerClass: forCellWithReuseIdentifier:
 
3.      自定义Cell，原因：系统cell没有任何子控件;(添加子控件image，label)。
 @interface LNPhotoViewCell : UICollectionViewCell
 
4.      FlowLayout自定义（调整cell尺寸，利用布局就做效果），原因：系统cell中每个item尺寸都一样;(继承flowLayout 或 Layout)。
 @interface LNFlowLayout : UICollectionViewFlowLayout
 
 ******************************************************************************
 
 自定义布局: 只要了解5个方法（重写它方法，扩展功能）
 
 1.   什么时候调用:collectionView第一次布局,collectionView刷新的时候也会调用
    作用:计算cell的布局，条件:cell的位置是固定不变的.
 - (void)prepareLayout;
 
 2.   作用:指定一段区域给你这段区域cell的尺寸(可以一次性返回所有cell尺寸,也可以每隔一个距离返回cell)
 - (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect;
 
 3.   在滚动的时候是否允许刷新(Invalidate)布局
 - (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds;
 
 4.   什么时候调用:用户手指一松开就会调用
    作用:确定最终偏移量
 - (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity; // return a point at which to rest after scrolling - for layouts that want snap-to-point scrolling behavior
 
 5.   由于UICollectionVeiw继承自UIScrollView，所以需要重写该函数，告诉contentSize大小
 - (CGSize)collectionViewContentSize;
 
 */

#import "DiscoverViewController.h"
#import "DisCollectionViewCell.h"
#import "SecondViewController.h"
#import "ZoneViewController.h"
#import "DiscoverModel.h"

static NSString *mainCellId = @"mainCellId";

@interface DiscoverViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic ,strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = K_RGBACOLOR(255, 255, 255, 1);
    
    //注册cell的类型
    [self registerClass];
    [self getData];
}

#pragma mark -- 懒加载
-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

#pragma mark -- 懒加载
-(UICollectionView *)collectionView{

    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        //设置区的内边距
        layout.sectionInset = UIEdgeInsetsMake(1, 1, 1, 1);
        //设置2个item之间的最小间隙
        layout.minimumInteritemSpacing = 1;
        //设置行之间的最小间距
        layout.minimumLineSpacing = 1;
        //设置滚动方向，默认是垂直滚动
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        //如果是垂直滚动，高度起作用，宽度忽略
//        //如果是水平滚动，宽度起作用，高度忽略
//        layout.headerReferenceSize = CGSizeMake(50, 50);
////        //设置footerView的大小
//        layout.footerReferenceSize = CGSizeMake(50, 50);
        
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        //设置代理
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

//注册cell的类型
-(void)registerClass{

    [self.collectionView registerClass:[DisCollectionViewCell class] forCellWithReuseIdentifier:mainCellId];
    //根据kind分辨是头 还是 尾
    //注册headerView
//    [self.collectionView registerNib:[] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@""]
    //注册footerView
//        [self.collectionView registerNib:[] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@""]
}

#pragma mark -- 请求数据
-(void)getData{
    for (int i = 0; i < 15; i++) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setObject:[NSString stringWithFormat:@"第%d个",i] forKey:@"title"];
        [dic setObject:[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0] forKey:@"bgColor"];
        DiscoverModel *model = [[DiscoverModel alloc]initWithDic:dic];
        [self.dataArray addObject:model];
    }
    [self.collectionView reloadData];
}

#pragma mark -- UICollectionViewDataSource
//分组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//每组多少个item
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}
//item内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DisCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:mainCellId forIndexPath:indexPath];
    if (self.dataArray.count > 0) {
        cell.model = self.dataArray[indexPath.row];
    }
    return cell;
}

#pragma mark -- UICollectionViewDelegateFlowLayout
//设置指定Indexpath的单元格大小(itemSize)
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((K_Width - 3)/2, (K_Width - 3)/2);
}

#pragma mark -- UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (0 == indexPath.row % 2) {
        ZoneViewController *zoneVc = [[ZoneViewController alloc]init];
        //push到二级页面隐藏TabBar
        [zoneVc setHidesBottomBarWhenPushed:YES];
        zoneVc.model = self.dataArray[indexPath.row];
        [self.navigationController pushViewController:zoneVc animated:YES];
    }else{
        SecondViewController *secondVc = [[SecondViewController alloc]init];
        //push到二级页面隐藏TabBar
        [secondVc setHidesBottomBarWhenPushed:YES];
        secondVc.model = self.dataArray[indexPath.row];
        [self.navigationController pushViewController:secondVc animated:YES];
    }
}

@end
