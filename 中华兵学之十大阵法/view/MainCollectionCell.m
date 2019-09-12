//
//  MainCollectionCell.m
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/7/31.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "MainCollectionCell.h"

@interface MainCollectionCell ()
@property (nonatomic,strong)UIImageView *bgContenView;
@property (nonatomic,strong)UIImageView *mainImageView;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UIView *centerView;

@end



@implementation MainCollectionCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.bgContenView];
        [self.bgContenView addSubview:self.centerView];
        [self.centerView addSubview:self.mainImageView];
        [self.centerView addSubview:self.titleLabel];
        [self dx_layoutViews];
    }
    return self;
}
- (void)setModel:(MainCellModel *)model{
    _model = model;
    self.mainImageView.image  = [UIImage  imageNamed:_model.imageName];
    self.titleLabel.text =  _model.title;
}

- (void)dx_layoutViews{
    [self.bgContenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.and.right.and.bottom.equalTo(self.contentView).inset(10.0f);
    }];
    
    [self.centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgContenView).inset(15);
        make.bottom.equalTo(self.bgContenView).inset(40);
        make.left.equalTo(self.bgContenView).inset(20);
        make.right.equalTo(self.bgContenView).inset(10);
        make.size.mas_equalTo(CGSizeMake(130, 100));
    }];
    
    [self.mainImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.equalTo(self.centerView);
        make.bottom.equalTo(self.centerView).inset(25);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.bottom.equalTo(self.centerView);
        make.top.equalTo(self.mainImageView.mas_bottom);
    }];
    
}


- (UIImageView *)bgContenView{
    if(!_bgContenView){
        _bgContenView = [[UIImageView alloc]init];
        _bgContenView.clipsToBounds = YES;
        _bgContenView.backgroundColor  =  [UIColor  colorWithRed:215/255.0 green:190/255.0 blue:154/255.0 alpha:1];
        _bgContenView.layer.cornerRadius  =  12;
        _bgContenView.image = [UIImage imageNamed:@"beijingaa"];
        
    }
    return _bgContenView;
}

- (UIView *)centerView{
    if(!_centerView){
        _centerView = [[UIView alloc]init];
        _centerView.backgroundColor = [UIColor colorWithRed:190/255.0 green:149/255.0 blue:61/255.0 alpha:1];
    }
    return _centerView;
}

- (UIImageView *)mainImageView{
    if(!_mainImageView){
        _mainImageView =[[UIImageView alloc]init];
    }
    return _mainImageView;
}

- (UILabel *)titleLabel{
    if(!_titleLabel){
        _titleLabel =  [[UILabel alloc]init];
        _titleLabel.font  = [UIFont fontWithName:@"Helvetica-Bold" size:15];
        _titleLabel.textColor =  [UIColor colorWithHexString:@"#333333"];
        _titleLabel.textAlignment  = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
@end
