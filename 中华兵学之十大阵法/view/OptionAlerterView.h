//
//  OptionAlerterView.h
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/9/9.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollecModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface OptionAlerterView : UIView
@property (nonatomic,copy)void (^optionBlock)(NSUInteger option);

- (void)configCollectionBtnWithModel:(CollecModel *)model;
- (void)dissMiss;
- (void)show;
@end


NS_ASSUME_NONNULL_END
