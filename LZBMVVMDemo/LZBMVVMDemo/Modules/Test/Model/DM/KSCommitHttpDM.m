//
//  KSCommitHttpDM.m
//  LZBMVVMDemo
//
//  Created by zibin on 17/2/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "KSCommitHttpDM.h"

@implementation KSCommitHttpDM
-(NSURLSessionDataTask *)d_attentionListWithtime:(double)time rTime:(double)rTime count:(int)count type:(NSString *)type  success:(void(^)(KSCommitHttpResponseModel *responseModel))success fail:(void(^)(NSError *error))fail
{
    KSCommitHttpModel *model = [[KSCommitHttpModel alloc] init];
    model.time = time;
    model.rtime = rTime;
    model.count = count;
    model.type = type;
    return [self sendGetWithModel:model ResponseClass:[KSCommitHttpResponseModel class] sucessResponse:success failResponse:fail];
}
@end
