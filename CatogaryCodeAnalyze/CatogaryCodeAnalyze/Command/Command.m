//
//  Command.m
//  CatogaryCodeAnalyze
//
//  Created by 刘帅仪 on 2019/9/9.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "Command.h"

@implementation Command

- (void)execute {
    
    //override to subclass
    [self done];
}

- (void)cancle {
    self.completion = nil;
}

- (void)done {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (_completion) {
            _completion(self);
        }
        
        self.completion = nil;
        
        
    });
}

@end
