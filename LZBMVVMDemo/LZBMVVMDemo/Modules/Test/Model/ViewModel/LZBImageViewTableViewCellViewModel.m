//
//  LZBImageViewTableViewCellViewModel.m
//  LZBMVVMDemo
//
//  Created by zibin on 17/2/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "LZBImageViewTableViewCellViewModel.h"


#define praiseButtonFramWidth 120
#define praiseButtonFramHeight 20
#define defaultMargin  15

@interface LZBImageViewTableViewCellViewModel()

@property (nonatomic, assign) CGRect coverImageViewFrame;
@property (nonatomic, assign) CGRect iconImageViewFrame;
@property (nonatomic, assign) CGRect titleLabelFrame;
@property (nonatomic, assign) CGRect praiseButtonFrame;
@property (nonatomic, assign) CGRect bottomLineFrame;
@property (nonatomic, assign) CGFloat cellHeight;
@end

@implementation LZBImageViewTableViewCellViewModel
+ (NSArray <LZBImageViewTableViewCellViewModel * >*)viewModelWithContentModel:(NSArray <KSContentModel *>*)topics
{
    NSMutableArray  *tempArray = [NSMutableArray array];
    LZBWeakSelf(weakSelf);
    [topics enumerateObjectsUsingBlock:^(KSContentModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LZBImageViewTableViewCellViewModel *cellModel = [[LZBImageViewTableViewCellViewModel alloc]init];
        cellModel.contentModel = obj;
        [weakSelf configViewModelWithModel:obj viewMoedel:cellModel];
        [tempArray addObject:cellModel];
    }];
    return tempArray;
}

+ (void)configViewModelWithModel:(KSContentModel *)contentModel  viewMoedel:(LZBImageViewTableViewCellViewModel *)viewModel
{
    //1.头像
    CGFloat iconImageViewFrameX = defaultMargin;
    CGFloat iconImageViewFrameY = defaultMargin;
    CGFloat iconImageViewFrameW = iconImageViewWidth;
    CGFloat iconImageViewFrameH = iconImageViewFrameW;
    viewModel.iconImageViewFrame = CGRectMake(iconImageViewFrameX, iconImageViewFrameY, iconImageViewFrameW,iconImageViewFrameH);
    
    //2.点赞
    CGFloat praiseButtonFrameW = praiseButtonFramWidth;
    CGFloat praiseButtonFrameH = praiseButtonFramHeight;
    CGFloat praiseButtonFrameX = [UIScreen mainScreen].bounds.size.width -defaultMargin-praiseButtonFramWidth;
    CGFloat praiseButtonFrameY = iconImageViewFrameY + (iconImageViewFrameH -praiseButtonFrameH)*0.5;
    viewModel.praiseButtonFrame = CGRectMake(praiseButtonFrameX, praiseButtonFrameY, praiseButtonFrameW,praiseButtonFrameH);
    
    //3.名字
    CGFloat titleLabelFrameX = CGRectGetMaxX(viewModel.iconImageViewFrame)+defaultMargin;
    CGFloat titleLabelFrameY = iconImageViewFrameY;
    CGFloat titleLabelFrameW = [UIScreen mainScreen].bounds.size.width-titleLabelFrameX-praiseButtonFrameW-defaultMargin;
    CGFloat titleLabelFrameH = iconImageViewFrameH;
    viewModel.titleLabelFrame = CGRectMake(titleLabelFrameX, titleLabelFrameY, titleLabelFrameW,titleLabelFrameH);
    
    //frame
    CGFloat coverImageViewFrameX = 0;
    CGFloat coverImageViewFrameY = CGRectGetMaxY(viewModel.iconImageViewFrame) +defaultMargin;
    CGFloat coverImageViewFrameW = [UIScreen mainScreen].bounds.size.width;
    CGFloat coverImageViewFrameH = [UIScreen mainScreen].bounds.size.width * 0.6;
    viewModel.coverImageViewFrame = CGRectMake(coverImageViewFrameX, coverImageViewFrameY, coverImageViewFrameW,coverImageViewFrameH);
    
    //底部线
    CGFloat bottomLineFrameX = 0;
    CGFloat bottomLineFrameY = CGRectGetMaxY(viewModel.coverImageViewFrame)+defaultMargin;
    CGFloat bottomLineFrameW = [UIScreen mainScreen].bounds.size.width;
    CGFloat bottomLineFrameH = 2;
    viewModel.bottomLineFrame = CGRectMake(bottomLineFrameX, bottomLineFrameY, bottomLineFrameW, bottomLineFrameH);
    
    viewModel.cellHeight = CGRectGetMaxY(viewModel.bottomLineFrame);
}
@end
