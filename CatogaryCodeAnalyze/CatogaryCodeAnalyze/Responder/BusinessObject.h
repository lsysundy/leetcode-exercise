//
//  BusinessObject.h
//  CatogaryCodeAnalyze
//
//  Created by 刘帅仪 on 2019/9/9.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BusinessObject;

typedef void(^CompletionBlock) (BOOL handled);
typedef void(^ResultBlock)(BusinessObject *handler, BOOL handled);

NS_ASSUME_NONNULL_BEGIN

@interface BusinessObject : NSObject

//下一个响应者（响应链构成的关键）
@property (nonatomic, strong) BusinessObject *nextBusiness;
//响应者的处理方法
- (void)handle: (ResultBlock)result;

//各个业务在该方法中的实际业务处理
- (void)handleBusiness: (CompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
