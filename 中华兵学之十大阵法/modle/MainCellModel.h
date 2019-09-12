//
//  MainCellModel.h
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/7/31.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WordItemModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MainCellModel : NSObject<MainSectionModelProtocol>
@property (nonatomic,copy)NSString  *title;
@property (nonatomic,copy)NSString  *imageName;
@property (nonatomic,copy)NSString  *detail;
@property (nonatomic,strong)NSMutableArray <WordItemModel *>*wordList;
@property (nonatomic,copy)NSString  *aboutStory;
@property (nonatomic,copy)NSString  *close;
@end

NS_ASSUME_NONNULL_END
