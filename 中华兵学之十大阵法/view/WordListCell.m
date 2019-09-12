//
//  WordListCell.m
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/8/3.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "WordListCell.h"

@interface WordListCell ()
@property(nonatomic,strong)UIImageView  *bgImageView;
@property(nonatomic,strong)UIView  *eleContenview;
@property(nonatomic,strong)UIImageView *woedImageview;
@property(nonatomic,strong)UILabel *dititleLabel;
@property (nonatomic,strong)UIImageView *leftImageView;
@property (nonatomic,strong)UILabel     *dTitleLabel;
@property (nonatomic,strong)UILabel     *ddetailLabel;
@property (nonatomic,strong)UIImageView *wordImgView;

@property (nonatomic,strong)UIImageView *markLearnView;
@property (nonatomic,strong)UILabel *markLabel;
@property (nonatomic,assign)BOOL isMar;

@end


@implementation WordListCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
        [self dxLayoutSubview];
    }
    return self;
}

- (void)setModel:(WordItemModel *)model{
    _model = model;
    self.leftImageView.image = [UIImage imageNamed:_model.img];
    self.wordImgView.image = [UIImage imageNamed:_model.word];
}

- (void)setUI{
    [self.contentView addSubview:self.bgImageView];
    [self.bgImageView addSubview:self.eleContenview];
    [self.eleContenview addSubview:self.markLearnView];
    [self.eleContenview addSubview:self.markLabel];
    [self.eleContenview addSubview:self.leftImageView];
    [self.eleContenview addSubview:self.ddetailLabel];
    [self.eleContenview addSubview:self.dTitleLabel];
    [self.eleContenview addSubview:self.wordImgView];
    
    self.eleContenview.backgroundColor  = [[UIColor whiteColor]colorWithAlphaComponent:0];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor  clearColor];
}

- (void)dxLayoutSubview{
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).inset(5);
        make.bottom.equalTo(self.contentView).inset(5);
        make.left.equalTo(self.contentView).inset(15);
        make.right.equalTo(self.contentView).inset(15);
    }];
     
     [self.eleContenview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgImageView).inset(16.0f);
        make.top.equalTo(self.bgImageView).inset(25.0f);
        make.bottom.equalTo(self.bgImageView).inset(25.0f);
        make.right.equalTo(self.bgImageView).inset(20.0f);
    }];
    
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.eleContenview).inset(10);
        make.left.equalTo(self.eleContenview).inset(20);
        make.right.equalTo(self.eleContenview).inset(20);
        make.bottom.equalTo(self.eleContenview).inset(60);
    }];
    
    [self.wordImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.leftImageView.mas_bottom).offset(5);
        make.bottom.equalTo(self.eleContenview).inset(10);
        make.left.equalTo(self.leftImageView);
        make.right.equalTo(self.markLearnView.mas_left).offset(-10);
    }];
    
    [self.markLearnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.wordImgView);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.right.equalTo(self.markLabel.mas_left).offset(-10);
    }];
    
    [self.markLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.markLearnView);
        make.right.equalTo(self.leftImageView);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(70);
    }];
}

- (UIImageView *)bgImageView{
    if(!_bgImageView){
        _bgImageView = [[UIImageView alloc]init];
        _bgImageView.image  = [UIImage imageNamed:@"zhenzhenzhentouminh"];
    }
    return _bgImageView;
}

- (UIView *)eleContenview{
    if(!_eleContenview){
        _eleContenview = [[UIView alloc]init];
    }
    return _eleContenview;
}

- (UIImageView *)leftImageView{
    if(!_leftImageView){
        _leftImageView = [[UIImageView alloc]init];
        _leftImageView.backgroundColor = [UIColor redColor];
    }
    return _leftImageView;
}

- (UILabel *)dTitleLabel{
    if(!_dTitleLabel){
        _dTitleLabel = [[UILabel alloc]init];
        _dTitleLabel.textColor  = ThemeColor;
        _dTitleLabel.textAlignment = NSTextAlignmentLeft;
        _dTitleLabel.font = [UIFont fontWithName:ThemeFont size:15.0f];
        [_dTitleLabel sizeToFit];
    }
    return _dTitleLabel;
}

- (UILabel *)ddetailLabel{
    if(!_ddetailLabel){
        _ddetailLabel = [[UILabel alloc]init];
        _ddetailLabel.textAlignment = NSTextAlignmentLeft;
        _ddetailLabel.font = [UIFont fontWithName:ThemeFont size:15];
        _ddetailLabel.textColor = ThemeColor;
        [_ddetailLabel sizeToFit];
    }
    return _ddetailLabel;
}

- (UIImageView *)wordImgView{
    if(!_wordImgView){
        _wordImgView = [[UIImageView alloc]init];
      //  _wordImgView.backgroundColor = [UIColor redColor];
    }
    return _wordImgView;
}

- (UIImageView *)markLearnView{
    if(!_markLearnView){
        _markLearnView = [[UIImageView alloc]init];
        _markLearnView.image = [UIImage imageNamed:@"xuexi-3"];
        _markLearnView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapg = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [_markLearnView addGestureRecognizer:tapg];
    }
    return _markLearnView;
}

- (UILabel *)markLabel{
    if(!_markLabel){
        _markLabel = [[UILabel alloc]init];
        _markLabel.font = [UIFont fontWithName:ThemeFont size:15];
        _markLabel.textColor = ThemeColor;
        _markLabel.text = @"标记学习";
        _markLabel.textAlignment = NSTextAlignmentRight;
       // [_markLabel sizeToFit];
    }
    return _markLabel;
}

- (void)tapAction:(UITapGestureRecognizer *)tap{

    
    if(self.isMar){
        self.markLearnView.image = [UIImage imageNamed:@"xuexi-2"];
    }else{
        self.markLearnView.image = [UIImage imageNamed:@"xuexi-3"];
    }
    
    self.isMar = !self.isMar;
    
}
@end
