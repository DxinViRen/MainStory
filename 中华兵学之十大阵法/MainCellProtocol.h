//
//  MainCellProtocol.h
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/7/31.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MainCellProtocol <NSObject>
@property (nonatomic,strong)id<MainSectionModelProtocol>model;
@end

NS_ASSUME_NONNULL_END
