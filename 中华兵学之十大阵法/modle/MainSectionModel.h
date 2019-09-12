//
//  MainSectionModel.h
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/7/31.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainSectionModel : NSObject<IGListDiffable>
- (instancetype)initWithArray:(NSMutableArray<id<MainSectionModelProtocol>> *)arr;
@property(nonatomic,strong)NSMutableArray <id<MainSectionModelProtocol>>*dataArray;
@end

NS_ASSUME_NONNULL_END
