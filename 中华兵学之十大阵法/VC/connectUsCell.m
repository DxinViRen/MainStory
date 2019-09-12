//
//  connectUsCell.m
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/8/5.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "connectUsCell.h"
#import "MainCellModel.h"
@interface connectUsCell ()
@property (nonatomic,strong)UILabel *conLabel;

@end


@implementation connectUsCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    [self.contentView addSubview:self.conLabel];
    [self.conLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo (self.contentView).inset(15);
    }];
}

- (void)setModel:(id<MainSectionModelProtocol>)model{
    _model = model;
    MainCellModel *ceMOde = (MainCellModel *)_model;
    self.conLabel.text = ceMOde.title;
}


- (UILabel *)conLabel{
    if(!_conLabel){
        _conLabel = [[UILabel alloc]init];
        _conLabel.textColor = [UIColor darkTextColor];
        _conLabel.font = [UIFont fontWithName:ThemeFont size:18];
        _conLabel.textAlignment = NSTextAlignmentLeft;
        _conLabel.numberOfLines = 0;
        _conLabel.lineBreakMode = NSLineBreakByCharWrapping;
    }
    return _conLabel;
}

@end
