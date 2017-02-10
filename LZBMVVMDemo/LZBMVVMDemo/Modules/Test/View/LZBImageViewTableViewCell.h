//
//  LZBImageViewTableViewCell.h
//  LZBMVVMDemo
//
//  Created by zibin on 17/2/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZBImageViewTableViewCellViewModel.h"

typedef void(^LZBImageViewTableViewCellViewModelBlock)(LZBImageViewTableViewCellViewModel *cellModel);

@interface LZBImageViewTableViewCell : UITableViewCell

@property (nonatomic, strong) LZBImageViewTableViewCellViewModel *cellModel;

@property (nonatomic, copy)  LZBImageViewTableViewCellViewModelBlock cellPraiseClick;
- (void)setCellPraiseClick:(LZBImageViewTableViewCellViewModelBlock)cellPraiseClick;

- (void)reloadPraiseCountWithModel:(LZBImageViewTableViewCellViewModel *)cellModel;
@end
