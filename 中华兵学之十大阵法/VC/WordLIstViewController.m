//
//  WordLIstViewController.m
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/8/3.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "WordLIstViewController.h"
#import "MainSectionController.h"
#import "MainCellModel.h"
#import "WordListCell.h"
#import "MainCollectionCell.h"
#import "ConnectUsVC.h"
#import "DetailViewController.h"
@interface WordLIstViewController ()
@property (nonatomic,strong)UIImageView *bgImageView;
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)IGListAdapter *adapter;

@end

@implementation WordLIstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title  = self.dtitle;
    [self.navigationItem setHidesBackButton:YES animated:YES];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;//190  149  61
    [self setHidBackBtn];
    //[self configDataSource];
    [self dxlayoutSubView];
    [self.adapter reloadDataWithCompletion:nil];
    
}

- (void)setHidBackBtn{
   
    UIButton *backBtn = [[UIButton alloc]init];
    backBtn.frame = CGRectMake(0, 0, 20, 20);
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setImage:[UIImage imageNamed:@"fanhui-heise-2"] forState:UIControlStateNormal];
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [leftView addSubview:backBtn];
    UIBarButtonItem *backItem =  [[UIBarButtonItem alloc]initWithCustomView:leftView];
    self.navigationItem.leftBarButtonItem = backItem;
    
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [rightBtn addTarget:self action:@selector(rigthAction) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setImage:[UIImage imageNamed:@"lianxiwomen"] forState:UIControlStateNormal];
    UIView *rview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    [rview addSubview:rightBtn];
    UIBarButtonItem *riItem = [[UIBarButtonItem alloc]initWithCustomView:rview];
    self.navigationItem.rightBarButtonItem =riItem;
}

- (void)rigthAction{
    //联系我们
    ConnectUsVC *convc = [[ConnectUsVC alloc]init];
    [self.navigationController pushViewController:convc animated:YES];
}

- (void)configDataSource{
     NSMutableArray *cellArr = [@[] mutableCopy];
    for (int i =  0; i  < 10; i++) {
        MainCellModel *model = [[MainCellModel alloc]init];
        model.cellHeight = 200;
        model.cellClassName  = NSStringFromClass([WordListCell class]);
        [cellArr addObject:model];
    }
    MainSectionModel *secmodel = [[MainSectionModel alloc]initWithArray:cellArr];
    [self.dataArray addObject:secmodel];
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dxlayoutSubView{
    [self.view addSubview:self.bgImageView];
    [self.view addSubview:self.collectionView];
    [self.bgImageView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view.safeAreaInsets);
    }];
}


- (UIImageView *)bgImageView{
    if(!_bgImageView){
        _bgImageView =  [[UIImageView alloc]init];
        _bgImageView.image = [UIImage imageNamed:@"bgImg"];
    }
    return _bgImageView;
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
    return self.dataArray;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    MainSectionController *mc = [[MainSectionController alloc]init];
    
    NSInteger section = [self.dataArray indexOfObject:object];
    mc.didSelectCellBlock = ^(id<MainSectionModelProtocol>  _Nonnull model, NSInteger index) {
        [self cellClickWithModel:model index:index sec:section];
    };
    return mc;
}

- (void)cellClickWithModel:(id<MainSectionModelProtocol>)model index:(NSInteger)index sec:(NSInteger)sec{
    DetailViewController *detail = [[DetailViewController alloc]init];
    detail.itemModel = model;
    [self.navigationController pushViewController:detail animated:YES];
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter{
    return nil;
}


@end
