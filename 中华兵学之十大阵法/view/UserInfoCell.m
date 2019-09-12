//
//  UserInfoCell.m
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/8/13.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "UserInfoCell.h"

@interface UserInfoCell ()
@property (nonatomic,strong)UIImageView *mainImageView;
@property (nonatomic,strong)UIView *bgview;
@property (nonatomic,strong)UIView *lineView;
@property (nonatomic,strong)UIButton *itemBtn;



@end



@implementation UserInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setModel:(id<MainSectionModelProtocol>)model{
    
}

- (void)setUI{
    [self.contentView addSubview:self.mainImageView];
    [self.contentView addSubview:self.bgview];
    [self.bgview addSubview:self.itemBtn];
    [self.mainImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.height.mas_equalTo(220);
    }];
    
    [self.bgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.left.equalTo(self.contentView).inset(20);
        make.centerY.equalTo(self.contentView.mas_bottom);
        make.height.equalTo(self.bgview.mas_width).multipliedBy(60/285.0);
    }];
    
    [self.itemBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.bgview);
        make.size.mas_equalTo(CGSizeMake(25, 25));
    }];

}

- (UIImageView *)mainImageView{
    if(!_mainImageView){
        _mainImageView = [[UIImageView alloc]init];
        _mainImageView.image = [UIImage imageNamed:@"wenjiqiwu"];
        _mainImageView.backgroundColor = [UIColor redColor];
        _mainImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _mainImageView;
}


- (UIView *)bgview{
    if(!_bgview){
        _bgview = [[UIView alloc]init];
        _bgview.layer.cornerRadius = 5;
        _bgview.layer.borderWidth = 0.5;
        _bgview.layer.borderColor = [UIColor blackColor].CGColor;
        _bgview.backgroundColor = ThemeColor;
    }
    return _bgview;
}

- (UIView *)lineView{
    if(!_lineView){
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"#EEEEEE"];
        
    }
    return _lineView;
}

- (UIButton *)itemBtn{
    if(!_itemBtn){
        _itemBtn =[[UIButton alloc]init];
        _itemBtn.backgroundColor = [UIColor  redColor];
        [_itemBtn addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _itemBtn;
}

- (void)itemAction:(UIButton *)btn{
    NSLog(@"12434");
}

@end
