//
//  KSCommitHttpModel.h
//  LZBMVVMDemo
//
//  Created by zibin on 17/2/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "BaseResquestModel.h"
#import "KSContentModel.h"

@interface KSCommitHttpModel : BaseResquestModel

@end



@interface KSCommitHttpResponseModel : BaseResponseModel


@property (nonatomic, assign) long expire_time;
@property (nonatomic, strong) NSArray <KSContentModel *>*lives;


@end
