//
//  OptionAlerterView.m
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/9/9.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "OptionAlerterView.h"

@interface OptionAlerterView ()
@property (nonatomic,strong)UIButton *collectBtn;
@property (nonatomic,strong)UILabel  *collectionLabel;
@property (nonatomic,strong)UIButton *shareBtn;
@property (nonatomic,strong)UILabel  *shareLabel;
@property (nonatomic,strong)UIView   *bgview;
@property (nonatomic,strong)UIButton   *optionView;

@end


@implementation OptionAlerterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutUI];
    }
    return self;
}

- (void)configCollectionBtnWithModel:(CollecModel *)model{
    [self.collectBtn setImage:[UIImage imageNamed:model.imgName] forState:UIControlStateNormal];
    self.collectionLabel.text = model.stateName;
}

- (void)layoutUI{
    
    [self addSubview:self.bgview];
    [self.bgview addSubview:self.optionView];
    [self.optionView addSubview:self.collectionLabel];
    [self.optionView addSubview:self.collectBtn];
    [self.optionView addSubview:self.shareLabel];
    [self.optionView addSubview:self.shareBtn];
//
//    [self.bgview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self);
//    }];
//
    
    
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.optionView).inset(40);
        make.top.equalTo(self.optionView).inset(30);
        make.size.mas_equalTo(CGSizeMake(64, 64));
    }];
////
    [self.shareLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.shareBtn).offset(-5);
        make.top.equalTo(self.shareBtn.mas_bottom).offset(10);
        make.height.mas_equalTo(20);
    }];
//
//
    [self.collectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.optionView).inset(40);
        make.centerY.equalTo(self.shareBtn);
        make.size.equalTo(self.shareBtn);
    }];
//
    [self.collectionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.shareLabel);
        make.centerX.equalTo(self.collectBtn);
    }];
//
    
}

- (UIButton *)shareBtn{
    if(!_shareBtn){
        _shareBtn = [[UIButton alloc]init];
        _shareBtn.tag = 1;
        [_shareBtn addTarget:self action:@selector(optionAction:) forControlEvents:UIControlEventTouchUpInside];
        [_shareBtn setImage:[UIImage imageNamed:@"xinlangweibo"] forState:UIControlStateNormal];
    }
    return _shareBtn;
}

- (UILabel *)shareLabel{
    if(!_shareLabel){
        _shareLabel = [[UILabel alloc]init];
        _shareLabel.text = @"分享";
        _shareLabel.font = [UIFont fontWithName:ThemeFont size:14];
        _shareLabel.textAlignment = NSTextAlignmentLeft;
        _shareLabel.textColor = [UIColor colorWithHexString:@"#2c2c2c"];
        [_shareLabel sizeToFit];
    }
    return _shareLabel;
}

- (UIButton *)collectBtn{
    if(!_collectBtn){
        _collectBtn = [[UIButton alloc]init];
        
        [_collectBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_collectBtn addTarget:self action:@selector(optionTap:) forControlEvents:UIControlEventTouchUpInside];
        _collectBtn.tag = 2;
        
    }
    return _collectBtn;
}

- (void)optionTap:(NSUInteger)tag{
    if(self.optionBlock){
        self.optionBlock(tag);
    }
}

- (UILabel *)collectionLabel{
    if(!_collectionLabel){
        _collectionLabel = [[UILabel alloc]init];
        _collectionLabel.text = @"收藏";
        _collectionLabel.font = [UIFont fontWithName:ThemeFont size:14];
        _collectionLabel.textColor = [UIColor colorWithHexString:@"#2c2c2c"];
    }
    return _collectionLabel;
}

- (UIView *)bgview{
    if(!_bgview){
        _bgview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScrW, ScrH)];
        _bgview.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [_bgview addGestureRecognizer:tap];
        _bgview.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
    }
    return _bgview;
}

- (void)tapAction:(UITapGestureRecognizer *)tap{
    [self dissMiss];
}

- (UIButton *)optionView{
    if(!_optionView){
        _optionView = [[UIButton alloc]initWithFrame:CGRectMake(0, ScrH+270, ScrW, 270)];
        _optionView.backgroundColor = ThemeColor;
        _optionView.layer.cornerRadius = 5;
    }
    return _optionView;
}

- (void)optionAction:(UIButton *)btn{
    if(self.optionBlock){
        self.optionBlock(btn.tag);
    }
}

- (void)dissMiss{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = self.optionView.frame;
        frame =CGRectMake(0, ScrH, ScrW, 270);
        self.optionView.frame  = frame;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)show{
    UIWindow *window =[UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = self.optionView.frame;
        frame =CGRectMake(0, ScrH-270, ScrW, 270);
        self.optionView.frame  = frame;
    } completion:^(BOOL finished) {
    }];
}

@end
