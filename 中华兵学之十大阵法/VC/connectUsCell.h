//
//  connectUsCell.h
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/8/5.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface connectUsCell : UICollectionViewCell<MainCellProtocol>
@property(nonatomic,strong)id<MainSectionModelProtocol>model;

@end

NS_ASSUME_NONNULL_END
