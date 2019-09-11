//
//  BusinessObject.m
//  CatogaryCodeAnalyze
//
//  Created by 刘帅仪 on 2019/9/9.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "BusinessObject.h"


@implementation BusinessObject

- (void)handle: (ResultBlock)result {
    
    CompletionBlock completion = ^(BOOL handle) {
        //当前任务处理掉了，上抛结果
        if (handle) {
            result(self, handle);
        }else {
            //沿着责任链，指派给下一个业务处理
            if (self.nextBusiness) {
                [self.nextBusiness handle:result];
            } else {
                //没有业务处理，上抛
                result(nil, NO);
            }
        }
    };
    
    //当前业务进行处理
    [self handleBusiness:completion];
}

- (void)handleBusiness: (CompletionBlock)completion {
    
    //业务逻辑处理：如f网络请求。本地照片查询等
    
}




@end
