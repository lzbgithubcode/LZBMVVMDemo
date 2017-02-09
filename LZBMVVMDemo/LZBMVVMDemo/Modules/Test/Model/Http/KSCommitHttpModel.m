//
//  KSCommitHttpModel.m
//  LZBMVVMDemo
//
//  Created by zibin on 17/2/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "KSCommitHttpModel.h"

@implementation KSCommitHttpModel
- (NSString *)url
{
    return  @"http://service.ingkee.com//api/live/near_recommend?&devi=e8a317dd6c9020ffaee45ae680989791355f0d9d&cv=IK3.5.10_Iphone&ua=iPhone6_2&proto=7&lc=0000000000000035&idfv=E00F9A8A-1FB6-40C5-A6BA-F8402ADF0761&imsi=&imei=&cc=TG0001&osversion=ios_9.300000&idfa=C020B5DA-EADA-4CC1-93DC-D4D7FDFC0216&uid=112732552&sid=20jps6SWcUPJ9h91YSX8dqMkZpXp06t0gCYnAgKG5KUkrZi1OFA&conn=Wifi&mtid=2e5ac89b161fff9ac9314de83df8a695&mtxid=8a25939264bd&s_sg=315e2e0302db421812e0d3baea44bd37&s_sc=100&s_st=1474534100&interest=0&latitude=24.520433&longitude=118.126607&multiaddr=1";
}
@end



@implementation KSCommitHttpResponseModel

+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key
{
    if([key isEqualToString:@"lives"])
    {
        return [MTLJSONAdapter arrayTransformerWithModelClass:[KSContentModel class]];
    }
    return nil;
}
@end
