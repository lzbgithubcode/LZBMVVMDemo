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


/**
 获取最新数据
 */
- (void)resquestUpdateDataWithCallback:(LZBCompetionCallback)callback
{
    [self loadPullUpData:callback];
}

/**
 获取历史数据
 */
- (void)resquestHistoryDataWithCallback:(LZBCompetionCallback)callback
{
  [self loadPullDownData:callback];
}

- (void)loadPullDownData:(LZBCompetionCallback)callback
{
    LZBWeakSelf(weakSelf);
    [[KSCommitHttpDM shareInstance] d_attentionListWithtime:self.updateTime rTime:self.rUpdateTime count:kLoadDataCount type:@"update" success:^(KSCommitHttpResponseModel *responseModel) {
        [weakSelf processResponseData:responseModel isRefresh:YES];
    } fail:^(NSError *error) {
        if(callback)
          callback(error);
    }];
}

- (void)loadPullUpData:(LZBCompetionCallback)callback
{
    LZBWeakSelf(weakSelf);
    [[KSCommitHttpDM shareInstance] d_attentionListWithtime:self.historyTime rTime:self.rHistoryTime count:kLoadDataCount type:@"history" success:^(KSCommitHttpResponseModel *responseModel) {
         [weakSelf processResponseData:responseModel isRefresh:YES];
    } fail:^(NSError *error) {
        if(callback)
            callback(error);
    }];
}

-(void)processResponseData:(KSCommitHttpResponseModel *)responseModel isRefresh:(BOOL)isRefresh
{
    if (responseModel.data.endTime!=0) {
        self.updateTime = MAX(self.updateTime, responseModel.data.endTime);
    }
    if (responseModel.data.beginTime!=0) {
        self.historyTime = self.historyTime>0?MIN(self.historyTime, responseModel.data.beginTime):responseModel.data.beginTime;
    }
    if (responseModel.data.rendTime!=0) {
        self.rUpdateTime = MAX(self.rUpdateTime, responseModel.data.rendTime);
    }
    if (responseModel.data.rbeginTime!=0) {
        self.rHistoryTime = self.rHistoryTime>0? MIN(self.rHistoryTime, responseModel.data.rbeginTime):responseModel.data.rbeginTime;
    }
    //TODO:转成对应的 cell model 再添加到数组
    //注意 : 刷新的时候 数组要按 “倒序” 插入
    
    if (isRefresh)
    {
        [responseModel.data.travels enumerateObjectsUsingBlock:^(KSContentModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
//            KSTopicTableViewFrameModel *model = [[KSConvertDataManger shareIntanceConvertDataManger] getTopicTableViewFrameModel_ConvertFromNewWork:obj];
            [self.topics insertObject:obj atIndex:idx];

        }];
    }
    else
    {
//        if(responseModel.data.travels.count == 0)
//        {
////            [UIView animateWithDuration:0.25 animations:^{
////                self.tableView.mj_footer.hidden = YES;
////            }];
//        }
        [self.topics addObjectsFromArray:responseModel.data.travels];
//        [self.topics addObjectsFromArray:[[KSConvertDataManger shareIntanceConvertDataManger] getTopicTableViewFrameModelArray_ConvertFromNewWork:responseModel.data.travels]];
    }
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
