//
//  HomeViewController.m
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/7/28.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "HomeViewController.h"
#import "MainSectionModel.h"
#import "MainSectionController.h"
#import "MainCollectionCell.h"
#import "WhateCell.h"
#import "DZMATViewController.h"
#import "UINavigationController+DZM.h"
#import "DetailViewController.h"
#import "WordLIstViewController.h"
#import "LoginViewController.h"

@interface HomeViewController ()<UIScrollViewDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LoginViewController *logi =  [[LoginViewController alloc]init];
    //[self presentViewController:logi animated:YES completion:nil];
    self.navigationItem.title = @"成语仓库";
    [self configDataSource];

    self.leftView.hidden = YES;
    self.rightView.hidden = YES;
   
    LLog(@"测试llDebugTooarl");
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    return self.dataArray;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    MainSectionController *mainSecC = [[MainSectionController alloc]init];
    NSInteger sec = [self.dataArray indexOfObject:object];
    mainSecC.configCellBlock = ^(MainCellModel * _Nonnull model, NSInteger index, UICollectionViewCell * _Nonnull cell) {
        
    };
    mainSecC.didSelectCellBlock = ^(MainCellModel * _Nonnull model, NSInteger index) {
        [self selectCellWithModel:model index:index  sec:sec];
    };
    return mainSecC;
}

- (void)selectCellWithModel:(id<MainSectionModelProtocol>)model  index:(NSInteger)index sec:(NSInteger)sec{
    
    MainCellModel *cellModel = (MainCellModel *)model;
    MainCollectionCell *cell  = (MainCollectionCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:sec]];
    self.ATTarget = cell;
    WordLIstViewController *detail  =[[WordLIstViewController alloc]init];
    detail.dtitle =  cellModel.title;
    MainSectionModel *secmodel = [[MainSectionModel alloc]initWithArray:[cellModel.wordList mutableCopy]];
    detail.dataArray = [@[secmodel] mutableCopy];
    [self.navigationController pushATViewController:detail animated:YES];
}

- (void)configDataSource{
    NSMutableArray *secArray  = [@[] mutableCopy];
    NSMutableArray *itemArray = [NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"mainData" ofType:@"plist"]];
    for (NSDictionary *dic in itemArray) {
        MainCellModel *cellModel1 = [MainCellModel mj_objectWithKeyValues:dic];
        cellModel1.cellClassName = NSStringFromClass([MainCollectionCell class]);
        cellModel1.cellWeighght = ScrW*0.5;
        cellModel1.cellHeight = cellModel1.cellWeighght *(350/276.0);
        [secArray addObject:cellModel1];
    }
    MainSectionModel *seModel = [[MainSectionModel alloc]initWithArray:secArray];
    self.dataArray = [NSMutableArray arrayWithObjects:seModel, nil];
    [self.adapter reloadDataWithCompletion:nil];
}


@end
