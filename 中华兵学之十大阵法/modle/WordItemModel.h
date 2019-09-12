//
//  WordItemModel.h
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/8/4.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WordItemModel : NSObject<MainSectionModelProtocol>
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *img;
@property(nonatomic,copy)NSString *detail;
@property(nonatomic,copy)NSString *word;
@property(nonatomic,copy)NSString *wordDetail;

@end

NS_ASSUME_NONNULL_END
