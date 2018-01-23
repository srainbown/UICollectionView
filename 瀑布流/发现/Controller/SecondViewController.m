//
//  SecondViewController.m
//  瀑布流
//
//  Created by 紫川秀 on 2018/1/3.
//  Copyright © 2018年 View. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondCollectionViewCell.h"

static NSString *secondCellId = @"secondCellId";

@interface SecondViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *secondCollection;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];
    if (_model != nil) {
        self.title = _model.title;
    }
    
    //注册cell
    [self.secondCollection registerClass:[SecondCollectionViewCell class] forCellWithReuseIdentifier:secondCellId];
}

-(UICollectionView *)secondCollection{
    if (_secondCollection == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.sectionInset = UIEdgeInsetsMake(1, 1, 1, 1);
        layout.minimumInteritemSpacing = 1;
        layout.minimumLineSpacing = 1;
        //设置滚动方向
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _secondCollection = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _secondCollection.backgroundColor = [UIColor whiteColor];
        _secondCollection.delegate = self;
        _secondCollection.dataSource = self;
        [self.view addSubview:_secondCollection];
    }
    return _secondCollection;
}

#pragma mark -- UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 10;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SecondCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:secondCellId forIndexPath:indexPath];
  
    if (cell == nil) {
        cell = [[SecondCollectionViewCell alloc]init];
    }
    return cell;
}

#pragma mark -- UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((K_Height -64 -7)/6, (K_Height -64 -7)/6);
}

#pragma mark -- UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了第%ld组,第%ld个",indexPath.section,indexPath.row);
}

@end
