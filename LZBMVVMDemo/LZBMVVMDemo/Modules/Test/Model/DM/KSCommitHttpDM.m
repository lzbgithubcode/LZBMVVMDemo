//
//  KSCommitHttpDM.m
//  LZBMVVMDemo
//
//  Created by zibin on 17/2/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "KSCommitHttpDM.h"

@implementation KSCommitHttpDM
- (NSURLSessionDataTask *)getMainNearListsucessResponse:(void (^)(KSCommitHttpResponseModel *response))sucessBlock failResponse:(failResponseBlock)failBlock
{
    KSCommitHttpModel *model = [[KSCommitHttpModel alloc]init];
    return [self sendGetWithModel:model ResponseClass:[KSCommitHttpResponseModel class] sucessResponse:sucessBlock failResponse:failBlock];
}
@end
