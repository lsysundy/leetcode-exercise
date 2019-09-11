//
//  CoolTarget.h
//  CatogaryCodeAnalyze
//
//  Created by 刘帅仪 on 2019/9/9.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "Target.h"

NS_ASSUME_NONNULL_BEGIN

//适配对象 
@interface CoolTarget : NSObject

//被适配对象
@property (nonatomic, strong)Target *target;

//对原有方法包装
- (void)request;

@end

NS_ASSUME_NONNULL_END
