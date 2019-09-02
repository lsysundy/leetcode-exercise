//
//  MObserver.m
//  CatogaryCodeAnalyze
//
//  Created by 刘帅仪 on 2019/8/30.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "MObserver.h"
#import "MObject.h"

@implementation MObserver

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([object isKindOfClass:[MObject class]] && [keyPath isEqualToString:@"value"]) {
        NSNumber *valueNum = [change valueForKey:NSKeyValueChangeNewKey];
        NSLog(@"new key is %@", valueNum);
    }
    
}

@end
