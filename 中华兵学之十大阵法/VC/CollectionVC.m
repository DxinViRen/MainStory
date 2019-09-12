//
//  CollectionVC.m
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/8/8.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "CollectionVC.h"
#import "MainCellModel.h"
#import "MainSectionController.h"
#import "WordItemModel.h"
#import "WordListCell.h"
@interface CollectionVC ()

@end

@implementation CollectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavi];
    self.navigationItem.title = @"学而时习之";
   
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self configData];
    [self.adapter reloadDataWithCompletion:nil];
}

- (void)configData{
   NSMutableArray *dataArr = [DataManager getDataListWithListkey:dataListKeyCollect];
   NSMutableArray *data = [@[]  mutableCopy];
   for (NSDictionary  *dic in dataArr) {
        WordItemModel  *model  = [WordItemModel mj_objectWithKeyValues:dic];
        [data addObject:model];
    }
     MainSectionModel *secmodel = [[MainSectionModel alloc]initWithArray:data];
    
    self.dataArray = [@[secmodel] mutableCopy];
    
}

- (void)setNavi{
    
    if([self.navigationController.viewControllers.firstObject  isEqual:self]){
        self.leftView.hidden = YES;
        self.rightView.hidden  = YES;
    }else{
        //self.leftView.hidden = YES;
        self.rightView.hidden  = YES;
    }
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    return self.dataArray;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    MainSectionController *mainsec  = [[MainSectionController alloc]init];
    return mainsec;
}

@end
