//
//  MainCollectionCell.h
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/7/31.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainCellModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MainCollectionCell : UICollectionViewCell<MainCellProtocol>

@property (nonatomic,strong)MainCellModel *model;
@end

NS_ASSUME_NONNULL_END
