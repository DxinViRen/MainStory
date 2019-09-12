//
//  BaseViewController.h
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/7/31.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController<IGListAdapterDataSource>

@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)IGListAdapter *adapter;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)UIView *leftView;
@property (nonatomic,strong)UIView *rightView;
@property (nonatomic,strong)UIImageView  *bgImageView;

- (CGRect)collectionViewFrame;
@end

NS_ASSUME_NONNULL_END
