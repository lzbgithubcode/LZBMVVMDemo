//
//  KSCommitHttpModel.m
//  LZBMVVMDemo
//
//  Created by zibin on 17/2/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "KSCommitHttpModel.h"

@implementation KSCommitHttpModel
-(NSString *)url
{
  return @"http://120.25.233.158:80/isc/json/content/newAttention";
}
@end

@implementation  KSCommitHttpResponseDataModel

+(NSValueTransformer *)JSONTransformerForKey:(NSString *)key
{
    if ([key isEqualToString:@"travels"]) {
        return [MTLJSONAdapter arrayTransformerWithModelClass:[KSContentModel class]];
    }
    return nil;
}

@end

@implementation KSCommitHttpResponseModel

+(NSValueTransformer *)JSONTransformerForKey:(NSString *)key
{
    if ([key isEqualToString:@"data"]) {
        return [MTLJSONAdapter dictionaryTransformerWithModelClass:[KSCommitHttpResponseDataModel class]];
    }
    return nil;
}

@end
