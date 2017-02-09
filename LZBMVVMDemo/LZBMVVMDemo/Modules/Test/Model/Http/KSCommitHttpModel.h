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
@property (nonatomic,assign) double time;
@property (nonatomic,assign) double rtime;
@property (nonatomic,assign) NSInteger count;
@property (nonatomic,strong) NSString *type;
@property (nonatomic,assign) NSString *cut;
@end

@interface KSCommitHttpResponseDataModel : BaseResponseModel

@property (nonatomic,strong) NSArray <KSContentModel*> *travels;
@property (nonatomic,assign) double beginTime;
@property (nonatomic,assign) double endTime;
@property (nonatomic,assign) double rbeginTime;
@property (nonatomic,assign) double rendTime;

@end

@interface KSCommitHttpResponseModel : BaseResponseModel

@property (nonatomic,strong) KSCommitHttpResponseDataModel *data;


@end
