//
//  LZBCommitDataController.m
//  LZBMVVMDemo
//
//  Created by zibin on 17/2/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "LZBCommitDataController.h"
#import "KSCommitHttpDM.h"

#define kLoadDataCount      10

@interface LZBCommitDataController ()
@property (nonatomic, assign) double updateTime,historyTime,rUpdateTime,rHistoryTime;
@property (nonatomic, strong) NSMutableArray <KSContentModel *>*topics;
@property (nonatomic, strong) NSArray <KSContentModel *>*dataTopics;
@end

@implementation LZBCommitDataController

- (void)resquestUpdateDataWithCallback:(LZBCompetionCallback)callback
{
    [self loadPullDownData:callback];
}

- (void)loadPullDownData:(LZBCompetionCallback)callback
{
    LZBWeakSelf(weakSelf);
    [[KSCommitHttpDM shareInstance] getMainNearListsucessResponse:^(KSCommitHttpResponseModel *response) {
        [weakSelf processResponseData:response];
        if(callback)
            callback(nil);
    } failResponse:^(NSError *error) {
        if(callback)
            callback(error);
    }];
}

-(void)processResponseData:(KSCommitHttpResponseModel *)responseModel
{
    [self.topics addObjectsFromArray:responseModel.lives];
    self.dataTopics = self.topics;
}

- (NSArray<KSContentModel *> *)dataTopics
{
    if(_dataTopics == nil)
    {
        _dataTopics = @[];
    }
    return _dataTopics;
}

- (NSMutableArray<KSContentModel *> *)topics
{
  if(_topics == nil)
  {
      _topics = [NSMutableArray array];
  }
    return _topics;
}

@end
