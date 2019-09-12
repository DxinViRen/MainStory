//
//  WordLIstViewController.h
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/8/3.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "BaseViewController.h"
#import "DZMATViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface WordLIstViewController : DZMATViewController<IGListAdapterDataSource>
@property (nonatomic,strong)NSString *dtitle;
@property (nonatomic,strong)NSMutableArray *dataArray;
@end

NS_ASSUME_NONNULL_END
