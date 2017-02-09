//
//  KSContentModel.h
//  LZBMVVMDemo
//
//  Created by zibin on 17/2/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "BaseModel.h"

@class LZBCreatorModel;
@interface KSContentModel : BaseModel

@property (nonatomic, strong)  NSString *city;
@property (nonatomic, strong) LZBCreatorModel *creator;
@property (nonatomic, assign)  NSInteger online_users;
@property (nonatomic, strong) NSString *stream_addr;
@property (nonatomic, strong) NSString *distance;

@end

@interface LZBCreatorModel : BaseModel
@property (nonatomic, strong) NSString *birth;
@property (nonatomic, strong) NSString *emotion;
@property (nonatomic, strong) NSString *nick;
@property (nonatomic, strong) NSString *portrait;
@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, assign) NSInteger level;
@end
