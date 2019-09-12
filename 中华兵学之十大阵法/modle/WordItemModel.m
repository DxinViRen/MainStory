//
//  WordItemModel.m
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/8/4.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "WordItemModel.h"

@implementation WordItemModel
@synthesize cellClassName;
@synthesize cellWeighght;
@synthesize cellHeight;
@synthesize cellInderifier;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cellHeight = 260.0f;
        self.cellWeighght = ScrW;
    }
    return self;
}
@end
