//
//  LZBImageViewTableViewCellViewModel.h
//  LZBMVVMDemo
//
//  Created by zibin on 17/2/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSContentModel.h"
#import <UIKit/UIKit.h>

#define iconImageViewWidth 60
@interface LZBImageViewTableViewCellViewModel : NSObject

//data
//@property (nonatomic, strong) NSString *coverImageUrl;
//@property (nonatomic, strong) NSString *iconImageUrl;
//@property (nonatomic, strong) NSString *title;
//@property (nonatomic, assign) NSInteger praise;
@property (nonatomic, strong) KSContentModel *contentModel;


//frame
@property (nonatomic, assign, readonly) CGRect coverImageViewFrame;
@property (nonatomic, assign, readonly) CGRect iconImageViewFrame;
@property (nonatomic, assign, readonly) CGRect titleLabelFrame;
@property (nonatomic, assign, readonly) CGRect praiseButtonFrame;
@property (nonatomic, assign, readonly) CGRect bottomLineFrame;
@property (nonatomic, assign, readonly) CGFloat cellHeight;



#pragma mark - method
+ (NSArray <LZBImageViewTableViewCellViewModel * >*)viewModelWithContentModel:(NSArray <KSContentModel *>*)topics;
@end
