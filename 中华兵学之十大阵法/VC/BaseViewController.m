//
//  BaseViewController.m
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/7/31.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "BaseViewController.h"
#import "UINavigationBar+handle.h"
@interface BaseViewController ()


@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
    [self.view addSubview:self.bgImageView];
    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;//190  149  61
    [self dx_layoutveiws];
    [self  setHidBackBtn];
    
    self.edgesForExtendedLayout=UIRectEdgeBottom;
}

- (void)showBarItem{
    
}

- (void)setHidBackBtn{
        UIButton *backBtn = [[UIButton alloc]init];
        backBtn.frame = CGRectMake(0, 0, 20, 20);
        [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        [backBtn setImage:[UIImage imageNamed:@"fanhui-heise-2"] forState:UIControlStateNormal];
    
        [self.leftView addSubview:backBtn];
        UIBarButtonItem *backItem =  [[UIBarButtonItem alloc]initWithCustomView:self.leftView];
        self.navigationItem.leftBarButtonItem = backItem;
        
        
        UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [rightBtn addTarget:self action:@selector(rigthAction) forControlEvents:UIControlEventTouchUpInside];
        [rightBtn setImage:[UIImage imageNamed:@"index"] forState:UIControlStateNormal];
        [self.rightView addSubview:rightBtn];
        UIBarButtonItem *riItem = [[UIBarButtonItem alloc]initWithCustomView:self.rightView];
        self.navigationItem.rightBarButtonItem =riItem;
}

- (void)rigthAction{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     [self.navigationController.navigationBar navBarBackGroundColor:[UIColor colorWithRed:190/255.0 green:149/255.0 blue:61/255.0 alpha:1] image:nil isOpaque:NO];
    [self showBarItem];
}


- (void)dx_layoutveiws{
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view.safeAreaInsets);
    }];
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
}


- (CGRect)collectionViewFrame{
    return self.collectionView.frame;
}

- (UICollectionView *)collectionView{
    if(!_collectionView){
        UICollectionViewFlowLayout *layout  = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    }
    return _collectionView;
}

- (IGListAdapter *)adapter{
    if(!_adapter){
        _adapter = [[IGListAdapter alloc]initWithUpdater:[[IGListAdapterUpdater alloc]init] viewController:self workingRangeSize:0];
    }
    return _adapter;
}

- (NSMutableArray *)dataArray{
    if(!_dataArray){
        _dataArray =  [[NSMutableArray alloc]init];
    }
    return _dataArray;
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    return nil;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    return nil;
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter{
    return nil;
}

- (UIImageView *)bgImageView{
    if(!_bgImageView){
        _bgImageView =  [[UIImageView alloc]init];
        _bgImageView.image =   [UIImage imageNamed:@"bgImg"];
    }
    return _bgImageView;
}

- (UIView *)leftView{
    if(!_leftView){
        _leftView = [[UIView alloc]init];
        _leftView.frame = CGRectMake(0, 0, 20, 20);
    }
    return _leftView;
}

- (UIView *)rightView{
    if(!_rightView){
        
        _rightView = [[UIView alloc]init];
        _rightView.frame = CGRectMake(0, 0, 20, 20);
    }
    return _rightView;
}

@end
