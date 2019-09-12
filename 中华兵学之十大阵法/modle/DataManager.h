//
//  DataManager.h
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/8/9.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern  NSString *dataListKeyCollect;

@interface DataManager : NSObject

//增
+ (void)setItem:(id<MainSectionModelProtocol>)item forkey:(NSString *)datalist;
//删除
+ (void)deleteItem:(id<MainSectionModelProtocol>)item forkey:(NSString *)datalist;

//取
+ (NSMutableArray *)getDataListWithListkey:(NSString *)listkey;


-(void)showText:(NSString *)text;

+ (BOOL)isAvaThisItem:(NSDictionary *)dic;
@end

NS_ASSUME_NONNULL_END
