//
//  ConnectUsVC.m
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/8/3.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "ConnectUsVC.h"
#import "MainCollectionCell.h"
#import "MainSectionController.h"
#import "connectUsCell.h"
#import "ConnectUserModel.h"
#import "UserInfoCell.h"
@interface ConnectUsVC ()

@end

@implementation ConnectUsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.leftView.hidden = NO;
    self.rightView.hidden = NO;
    [self setBar];
    self.navigationItem.title = @"读者中心";
    [self configData];
    self.leftView.hidden = YES;
    self.rightView.hidden  = YES;
    [self.adapter reloadDataWithCompletion:nil];
}
- (void)setBar{
    [self.rightView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UIButton *ribtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [ribtn addTarget:self action:@selector(riAction:) forControlEvents:UIControlEventTouchUpInside];
    [ribtn setImage:[UIImage imageNamed:@"index"] forState:UIControlStateNormal];
    [self.rightView addSubview:ribtn];
}

- (void)configData{
    
    ConnectUserModel *model  = [[ConnectUserModel alloc]init];
    model.cellClassName = NSStringFromClass([UserInfoCell class]);
    model.cellHeight = model.cellWeighght *(260/375.0);
    MainSectionModel *secM = [[MainSectionModel alloc]initWithArray:[@[model] mutableCopy]];
    self.dataArray = [@[secM] mutableCopy];
}

- (void)riAction:(UIButton *)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    return self.dataArray;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    MainSectionController *mcs =  [[MainSectionController alloc]init];
    mcs.didSelectCellBlock = ^(id<MainSectionModelProtocol>  _Nonnull model, NSInteger index) {
        
    };
    
    mcs.configCellBlock = ^(id<MainSectionModelProtocol>  _Nonnull model, NSInteger index, UICollectionViewCell * _Nonnull cell) {
        
    };
    
    return mcs;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
