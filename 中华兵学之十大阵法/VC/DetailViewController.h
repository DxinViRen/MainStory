 //
//  DetailViewController.h
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/8/1.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "DZMAnimatedTransitioning/DZMATViewController.h"
#import "DZMATViewController.h"
#import "WordItemModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : BaseViewController
@property (nonatomic,strong)WordItemModel *itemModel;
@end

NS_ASSUME_NONNULL_END
