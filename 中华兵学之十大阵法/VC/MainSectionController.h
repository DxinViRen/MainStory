//
//  MainSectionController.h
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/7/31.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "IGListSectionController.h"
#import "MainSectionModel.h"
#import "MainCellModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MainSectionController : IGListSectionController
@property (nonatomic,copy)void(^configCellBlock)(id<MainSectionModelProtocol>model,NSInteger index,UICollectionViewCell *cell);
@property (nonatomic,copy)void(^didSelectCellBlock)(id<MainSectionModelProtocol>model,NSInteger index);
@property (nonatomic,strong)MainSectionModel *object;
@end

NS_ASSUME_NONNULL_END
