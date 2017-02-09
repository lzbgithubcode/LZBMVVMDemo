//
//  KSContentModel.m
//  LZBMVVMDemo
//
//  Created by zibin on 17/2/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "KSContentModel.h"

@implementation KSContentModel
+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key
{
    if([key isEqualToString:@"creator"])
    {
        return [MTLJSONAdapter dictionaryTransformerWithModelClass:[LZBCreatorModel class]];
    }
    return nil;
}
@end

@implementation LZBCreatorModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"userId":@"id",
             @"birth":@"birth",
             @"emotion":@"emotion",
             @"nick":@"nick",
             @"portrait":@"portrait",
             @"level":@"level",};
}


@end
