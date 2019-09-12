//
//  MainCellModel.m
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/7/31.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "MainCellModel.h"

@implementation MainCellModel

@synthesize cellClassName;

@synthesize cellHeight;

@synthesize cellInderifier;

@synthesize cellWeighght;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cellWeighght = ScrW;
        self.cellHeight = 55.0f;
        self.wordList = [@[] mutableCopy];
    }
    return self;
}

+(NSDictionary *)mj_objectClassInArray{
    return @{@"wordList":@"WordItemModel"};
}
@end
