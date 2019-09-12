//
//  MainSectionModel.m
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/7/31.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "MainSectionModel.h"

@implementation MainSectionModel

- (instancetype)initWithArray:(NSMutableArray<id<MainSectionModelProtocol>> *)arr
{
    if (self = [super init]) {
        self.dataArray = arr;
    }
    return self;
}

- (id<NSObject>)diffIdentifier
{
    return self;
}
- (BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object
{
    return [self isEqual:object];
}
@end
