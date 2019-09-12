//
//  ConnectUserModel.m
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/8/13.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "ConnectUserModel.h"

@implementation ConnectUserModel
@synthesize cellClassName;
@synthesize cellHeight;
@synthesize cellWeighght;
@synthesize cellInderifier;
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cellHeight = 220;
        self.cellWeighght = ScrW;
    }
    return self;
}
@end
