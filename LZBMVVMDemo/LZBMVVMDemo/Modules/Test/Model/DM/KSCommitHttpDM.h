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
 *  获取关注列表
 */
-(NSURLSessionDataTask *)d_attentionListWithtime:(double)time rTime:(double)rTime count:(int)count type:(NSString *)type  success:(void(^)(KSCommitHttpResponseModel *responseModel))success fail:(void(^)(NSError *error))fail;
@end
