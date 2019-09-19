//
//  ViewController.h
//  LRUexercize
//
//  Created by 刘帅仪 on 2019/9/18.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef struct LRUNode {
    NSString *key;
    NSString *value;
    struct LRUNode *pre;
    struct LRUNode *next;
}LRUNode;

@interface ViewController : UIViewController

- (instancetype)initWithCapacity: (NSUInteger)capacity;
- (void)setItem: (id)item forKey: (NSString *)key;
- (id)getItemForKey: (NSString *)key;

@end

