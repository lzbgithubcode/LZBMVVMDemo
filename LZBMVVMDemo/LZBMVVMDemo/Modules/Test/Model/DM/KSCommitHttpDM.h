//
//  KSCommitHttpDM.h
//  LZBMVVMDemo
//
//  Created by zibin on 17/2/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "BaseHttpDataManger.h"
#import "KSCommitHttpModel.h"

@interface KSCommitHttpDM : BaseHttpDataManger

/**
 *  获得附近直播列表数据
 */
- (NSURLSessionDataTask *)getMainNearListsucessResponse:(void (^)(KSCommitHttpResponseModel *response))sucessBlock failResponse:(failResponseBlock)failBlock;
@end
