//
//  LZBCommitDataController.h
//  LZBMVVMDemo
//
//  Created by zibin on 17/2/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "LZBBaseDataController.h"
#import "KSContentModel.h"

@interface LZBCommitDataController : LZBBaseDataController

/**
 获取最新数据
 */
- (void)resquestUpdateDataWithCallback:(LZBCompetionCallback)callback;

/**
 获取历史数据
 */
- (void)resquestHistoryDataWithCallback:(LZBCompetionCallback)callback;

//获取数据模型
@property (nonatomic, strong,nonnull,readonly) NSArray <KSContentModel *>*dataTopics;
@end
