//
//  KSContentModel.h
//  LZBMVVMDemo
//
//  Created by zibin on 17/2/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "BaseModel.h"

@interface KSContentModel : BaseModel

@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSString *imageUrl;
@property (nonatomic,strong) NSString *astatus,*cover,*title;

@end
