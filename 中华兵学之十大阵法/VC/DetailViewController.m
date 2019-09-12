//
//  DetailViewController.m
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/8/1.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "DetailViewController.h"
#import "UINavigationBar+handle.h"
#import "CollectionVC.h"
#import "OptionAlerterView.h"
#import "CollecModel.h"
@interface DetailViewController ()<UITextViewDelegate>
@property (nonatomic,strong)UIImageView *bgImagev;
@property (nonatomic,strong) UIView *rolView ;
@property (nonatomic,strong)UIImageView *lineImageView;
@property (nonatomic,strong)UIImageView *sslopImgview;
@property (nonatomic,strong)UIImageView *fansslopImgview;
@property (nonatomic,strong)UIImageView *monkeyIMageview;
@property (nonatomic,strong)UIImageView *fanmonkeyIMageview;
@property (nonatomic,strong)UIImageView *tcImageview;
@property (nonatomic,strong)UIImageView *wordImageView;
@property (nonatomic,strong)UILabel *wordLabel;
@property (nonatomic,strong)UIView *bgContentView;
@property (nonatomic,strong)UITextView *dTextView;
@property (nonatomic,strong)UIButton *shareBtn;
@property (nonatomic,assign)BOOL iscollect;
@property (nonatomic,strong)OptionAlerterView *alerterView;
@property (nonatomic,strong) CollecModel *colmodel;
@end
//fanhouzihouzi  fanslopLineline
@implementation DetailViewController
{
    
    DataManager *dataM;
    UILabel *label;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSubViews];//209  169  112
    //[self setNaviBar];
    self.navigationItem.title = self.itemModel.title;
    [self.rightView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
   
    //self.rightView.backgroundColor = [UIColor redColor];
    [self.rightView addSubview:self.shareBtn];
     dataM =  [[DataManager alloc]init];
    //[self.view addSubview:self.alerterView];
}


- (void)makeLabel{
    label = [[UILabel alloc]init];
    [self.navigationController.navigationBar addSubview:label];
   // label.text = @"一键收藏";
    label.font = [UIFont fontWithName:ThemeFont size:13];
    label.textColor = [UIColor darkTextColor];
    [label sizeToFit];
    label.text = @"操作";
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.navigationController.navigationBar);
        make.right.equalTo(self.navigationController.navigationBar).inset(50);
    }];
}

- (void)obserNoti:(NSNotification *)noti{
    self.iscollect = YES;
    [self.shareBtn setImage:[UIImage imageNamed:@"isc"] forState:UIControlStateNormal];
}

- (void)setNaviBar{
    self.rolView = [[UIView alloc]init];
    self.rolView.backgroundColor = [UIColor blackColor];
    self.rolView.layer.cornerRadius = 10;
    
   // [self.navigationController.navigationBar  addSubview:self.rolView];
    [self.rolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.navigationController.navigationBar);
        make.bottom.equalTo(self.navigationController.navigationBar);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
}


- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.rolView.hidden = YES;
    [self.alerterView removeFromSuperview];
    label.hidden = YES;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
      [[NSNotificationCenter defaultCenter]postNotificationName:@"notification" object:nil userInfo:@{@"noti":self.navigationController}];
    [self.navigationController.navigationBar navBarBackGroundColor:[UIColor colorWithRed:190/255.0 green:149/255.0 blue:61/255.0 alpha:1]image:nil isOpaque:NO];
      self.rolView.hidden = NO;
    [[NSNotificationCenter defaultCenter]postNotificationName:@"notification" object:nil userInfo:@{@"noti":self.navigationController}];
     [self makeLabel];
    
    [self configColModel];
    [self.alerterView configCollectionBtnWithModel:self.colmodel];
}

- (void)configColModel{
    BOOL isava=  [DataManager isAvaThisItem:[self.itemModel mj_keyValues]];
    self.colmodel = [[CollecModel alloc]init];
    if(!isava){
        self.colmodel.stateName =  @"取消收藏";
        self.colmodel.imgName = @"isc";
        // label.text = @"取消收藏";
        self.iscollect = YES;
        // [self.shareBtn setImage:[UIImage imageNamed:@"isc"] forState:UIControlStateNormal];
    }else{
        self.colmodel.stateName = @"一键收藏";
        //label.text = @"一键收藏";
        self.colmodel.imgName = @"shoucangShei";
    }
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
   
}

- (void)setItemModel:(WordItemModel *)itemModel{
    _itemModel = itemModel;
    self.wordImageView.image = [UIImage imageNamed:itemModel.wordDetail];
    self.dTextView.text = _itemModel.detail;
    self.navigationItem.title = _itemModel.title;
}



- (void)setSubViews{//538 726
    [self.view addSubview:self.lineImageView];
    [self.bgImagev addSubview:self.bgContentView];
    [self.view addSubview:self.sslopImgview];
    [self.view addSubview:self.monkeyIMageview];
    [self.view addSubview:self.fanmonkeyIMageview];
    [self.view addSubview:self.tcImageview];
     [self.view addSubview:self.bgImagev];
    [self.view addSubview:self.fansslopImgview];
   // [self.bgContentView addSubview:self.wordLabel];
    [self.bgContentView addSubview:self.wordImageView];
    [self.bgContentView addSubview:self.dTextView];
    [self.bgImagev mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).inset(16);
        make.right.equalTo(self.view).inset(16);
        make.top.equalTo(self.view).inset(getRectNavAndStatusHight + 20);
        make.height.equalTo(self.bgImagev.mas_width).multipliedBy(726/538.0);
    }];
    
    [self.tcImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgImagev);
        make.top.equalTo(self.bgImagev.mas_top).offset(-30);
        make.size.mas_equalTo(CGSizeMake(30, 60));
    }];
    
    [self.lineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).inset(-2);
        make.bottom.equalTo(self.bgImagev.mas_top);
        make.width.mas_equalTo(10);
    }];
    
    [self.monkeyIMageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bgImagev);
        make.bottom.equalTo(self.bgImagev.mas_top).offset(20);
        make.size.mas_equalTo(CGSizeMake(70, 75));
    }];
    
    [self.fanmonkeyIMageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgImagev);
        make.bottom.equalTo(self.bgImagev.mas_top).offset(20);
        make.size.mas_equalTo(CGSizeMake(70, 75));
    }];
    
    [self.sslopImgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lineImageView.mas_right);
        make.bottom.equalTo(self.bgImagev.mas_top).offset(-20);
        make.top.equalTo(self.view).inset(-10);
        make.right.equalTo(self.monkeyIMageview.mas_left).offset(18);
    }];
    
    [self.fansslopImgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.fanmonkeyIMageview.mas_right).offset(-18);
        make.bottom.equalTo(self.bgImagev.mas_top).offset(-20);
        make.top.equalTo(self.view).inset(-10);
        make.right.equalTo(self.lineImageView.mas_left);
    }];
    
    
    [self.bgContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.bgImagev);
        make.width.equalTo(self.bgImagev).multipliedBy((ScrW-90)/(ScrW-32));
        make.height.equalTo(self.bgContentView.mas_width).multipliedBy(726/538.0);
    }];
    
    [self.wordImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgContentView).inset(15);
        make.right.equalTo(self.bgContentView).inset(15);
        make.height.mas_equalTo(80);
        make.top.equalTo(self.bgContentView).inset(15);
    }];
    
    
    [self.dTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgContentView).inset(20);
        make.right.equalTo(self.bgContentView).inset(20);
        make.top.equalTo(self.wordImageView.mas_bottom).offset(10);
        make.bottom.equalTo(self.bgContentView).inset(30);
    }];
   
}

- (UIImageView *)bgImagev{
    if(!_bgImagev){
        _bgImagev = [[UIImageView alloc]init];
        _bgImagev.userInteractionEnabled = YES;
        _bgImagev.image  = [UIImage imageNamed:@"bgImage"];
    }
    return _bgImagev;
}

- (UIImageView *)lineImageView{
    if(!_lineImageView){
        _lineImageView = [[UIImageView alloc]init];
        //_lineImageView.image = [UIImage imageNamed:@"shengzizizi"];
    }
    return _lineImageView;
}

- (UIImageView *)sslopImgview{
    if (!_sslopImgview) {
        _sslopImgview = [[UIImageView alloc]init];
       // _sslopImgview.backgroundColor = [UIColor redColor];
        _sslopImgview.image = [UIImage  imageNamed:@"slopLineline"];
    }
    return _sslopImgview;
}

- (UIImageView *)monkeyIMageview{
    if(!_monkeyIMageview){
        _monkeyIMageview = [[UIImageView alloc]init];
        _monkeyIMageview.image = [UIImage imageNamed:@"huisehouzi"];
    }
    return _monkeyIMageview;
}

- (UIImageView *)fanmonkeyIMageview{
    if(!_fanmonkeyIMageview){
        _fanmonkeyIMageview = [[UIImageView alloc]init];
        _fanmonkeyIMageview.image = [UIImage imageNamed:@"fanhouzihouzi"];
    }
    return _fanmonkeyIMageview;
}

- (UIImageView *)fansslopImgview{
    if (!_fansslopImgview) {
        _fansslopImgview = [[UIImageView alloc]init];
        // _sslopImgview.backgroundColor = [UIColor redColor];
        _fansslopImgview.image = [UIImage  imageNamed:@"fanslopLineline"];
    }
    return _fansslopImgview;
}

- (UIImageView *)tcImageview{
    if(!_tcImageview){
        _tcImageview.image = [UIImage imageNamed:@"laoshidaochu"];
        _tcImageview.backgroundColor = [UIColor redColor];
    }
    return _tcImageview;
}

- (UIImageView *)wordImageView{
    if(!_wordImageView){
        _wordImageView = [[UIImageView alloc]init];
    }
    return _wordImageView;
}

- (UILabel *)wordLabel{
    if(!_wordLabel){
        _wordLabel = [[UILabel alloc]init];
        _wordLabel.font  = [UIFont fontWithName:ThemeFont size:12];
        _wordLabel.textColor = [UIColor lightTextColor];
        _wordLabel.textAlignment = NSTextAlignmentLeft;
        _wordLabel.numberOfLines = 0;
        _wordLabel.lineBreakMode = NSLineBreakByCharWrapping;
    }
    return _wordLabel;
}

- (UIView *)bgContentView{
    if(!_bgContentView){
        _bgContentView = [[UIView alloc]init];
        _bgContentView.userInteractionEnabled = YES;
        //_bgContentView.backgroundColor = [UIColor redColor];
    }
    return _bgContentView;
}

- (UITextView *)dTextView{
    if(!_dTextView){
        _dTextView = [[UITextView alloc]init];
        _dTextView.delegate = self;
        _dTextView.editable = NO;
        _dTextView.backgroundColor = [UIColor clearColor];
        _dTextView.textColor = [UIColor colorWithRed:54/255.0 green:54/255.0 blue:53/255.0 alpha:1];
        _dTextView.textAlignment= NSTextAlignmentLeft;
        _dTextView.font = [UIFont fontWithName:ThemeFont size:18];
        
    }
    return _dTextView;
}

- (UIButton *)shareBtn{
    if(!_shareBtn){
        _shareBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        [_shareBtn addTarget:self action:@selector(shareAction:) forControlEvents:UIControlEventTouchUpInside];
        [_shareBtn setImage:[UIImage imageNamed:@"shoucangShei"] forState:UIControlStateNormal];
    }
    return _shareBtn;
}

- (void)shareAction:(UIButton *)btn{
    [self configColModel];
    [self.alerterView configCollectionBtnWithModel:self.colmodel];
     [self.alerterView show];
////    if(!iscollect){
////       // [self collectItem];
////
//    }else{
//       // [self cancelCollect];
//        [self.alerterView dissMiss];
//    }
//    iscollect = !iscollect;
}

- (void)collectItem{
    [self.shareBtn setImage:[UIImage imageNamed:@"isc"] forState:UIControlStateNormal];
    //收藏当前Item
    [DataManager setItem:self.itemModel forkey:dataListKeyCollect];
    label.text = @"取消收藏";
    [dataM showText:@"收藏成功"];
    
}

- (void)cancelCollect{
     [self.shareBtn setImage:[UIImage imageNamed:@"shoucangShei"] forState:UIControlStateNormal];
    [DataManager deleteItem:self.itemModel forkey:dataListKeyCollect];
    label.text = @"一键收藏";
    [dataM showText:@"取消收藏"];
}

- (OptionAlerterView *)alerterView{
    if(!_alerterView){
        @WeakObj(self);
        _alerterView = [[OptionAlerterView alloc]initWithFrame:CGRectMake(0, 0, ScrW, ScrH)];
        _alerterView.optionBlock = ^(NSUInteger option) {
            if(option == 1){
                
                WBMessageObject *shareObject = [[WBMessageObject alloc]init];
                shareObject.text  =  @"精益求精";
                WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:shareObject];
                request.userInfo = @{@"ShareMessageFrom": @"SendMessageToWeiboViewController",
                                     @"Other_Info_1": [NSNumber numberWithInt:123],
                                     @"Other_Info_2": @[@"obj1", @"obj2"],
                                     @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
                [WeiboSDK sendRequest:request];
            }else{
                    if(!selfWeak.iscollect){
                        [selfWeak collectItem];
                
                    }else{
                        [selfWeak cancelCollect];
                        [selfWeak.alerterView dissMiss];
                    }
                    selfWeak.iscollect = !selfWeak.iscollect;
            }
        };
       // _alerterView.backgroundColor  = [UIColor redColor];
    }
    return _alerterView;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
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
