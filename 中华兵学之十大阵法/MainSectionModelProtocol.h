//
//  MainSectionModelProtocol.h
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/7/31.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MainSectionModelProtocol <NSObject>

@property (nonatomic,assign)CGFloat cellHeight;
@property (nonatomic,assign)CGFloat cellWeighght;
@property (nonatomic,copy)NSString *cellClassName;
@property (nonatomic,copy)NSString *cellInderifier;
@end

NS_ASSUME_NONNULL_END
