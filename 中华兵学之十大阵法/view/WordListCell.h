//
//  WordListCell.h
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/8/3.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainCellModel.h"
#import "WordItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WordListCell : UICollectionViewCell<MainCellProtocol>

@property (nonatomic,strong)WordItemModel *model;
@end

NS_ASSUME_NONNULL_END
