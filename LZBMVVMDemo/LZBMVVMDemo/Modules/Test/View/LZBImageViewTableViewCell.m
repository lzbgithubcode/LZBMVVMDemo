//
//  LZBImageViewTableViewCell.m
//  LZBMVVMDemo
//
//  Created by zibin on 17/2/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "LZBImageViewTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface LZBImageViewTableViewCell()
@property (nonatomic, strong)  UIImageView *coverImageView;
@property (nonatomic, strong)  UIImageView *iconImageView;
@property (nonatomic, strong)  UILabel *titleLabel;
@property (nonatomic, strong)  UIButton *praiseButton;
@property (nonatomic, strong)  UIView *bottomLine;

@end

@implementation LZBImageViewTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
  {
      [self.contentView addSubview:self.coverImageView];
      [self.contentView addSubview:self.iconImageView];
      [self.contentView addSubview:self.titleLabel];
      [self.contentView addSubview:self.praiseButton];
      [self.contentView addSubview:self.bottomLine];
      self.selectionStyle = UITableViewCellSelectionStyleNone;
  }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.coverImageView.frame = self.cellModel.coverImageViewFrame;
    self.iconImageView.frame = self.cellModel.iconImageViewFrame;
    self.titleLabel.frame = self.cellModel.titleLabelFrame;
    self.praiseButton.frame = self.cellModel.praiseButtonFrame;
    self.bottomLine.frame = self.cellModel.bottomLineFrame;
}

- (void)setCellModel:(LZBImageViewTableViewCellViewModel *)cellModel
{
    _cellModel = cellModel;
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:cellModel.coverImageUrl] placeholderImage:[UIImage imageNamed:@"default_photo"]];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:cellModel.coverImageUrl] placeholderImage:[UIImage imageNamed:@"default_head"]];
    self.titleLabel.text = cellModel.title;
    [self.praiseButton setTitle:[NSString stringWithFormat:@"%ld",cellModel.praise] forState:UIControlStateNormal];

}

#pragma mark - lazy
- (UIImageView *)coverImageView
{
   if(_coverImageView == nil)
   {
       _coverImageView = [UIImageView new];
       _coverImageView.contentMode = UIViewContentModeScaleAspectFit;
       _coverImageView.clipsToBounds = YES;
   }
    return _coverImageView;
}
- (UIImageView *)iconImageView
{
   if(_iconImageView == nil)
   {
       _iconImageView = [UIImageView new];
       _iconImageView.contentMode = UIViewContentModeScaleAspectFill;
       _iconImageView.clipsToBounds = YES;
       _iconImageView.layer.cornerRadius =  iconImageViewWidth *0.5;
       _iconImageView.layer.masksToBounds = YES;
   }
    return _iconImageView;
}

- (UILabel *)titleLabel
{
  if(_titleLabel == nil)
  {
      _titleLabel = [UILabel new];
      _titleLabel.font = [UIFont systemFontOfSize:14.0];
      _titleLabel.textColor = [UIColor purpleColor];
  }
    return _titleLabel;
}
-(UIButton *)praiseButton
{
   if(_praiseButton == nil)
   {
       _praiseButton = [UIButton buttonWithType:UIButtonTypeCustom];
       [_praiseButton setImage:[UIImage imageNamed:@"me_other_followed"] forState:UIControlStateNormal];
       [_praiseButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
       
   }
    return _praiseButton;
}

- (UIView *)bottomLine
{
   if(_bottomLine == nil)
   {
       _bottomLine = [UIView new];
       _bottomLine.backgroundColor = [UIColor lightGrayColor];
   }
    return _bottomLine;
}
@end
