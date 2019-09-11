//
//  Command.h
//  CatogaryCodeAnalyze
//
//  Created by 刘帅仪 on 2019/9/9.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Command;

typedef void(^CommandCompletionCallBack)(Command *cmd);

NS_ASSUME_NONNULL_BEGIN

@interface Command : NSObject
//copy 堆栈作用域
@property (nonatomic, copy) CommandCompletionCallBack completion;

- (void)execute;
- (void)cancle;

- (void)done;

@end

NS_ASSUME_NONNULL_END
