//
//  ViewController.m
//  LRUexercize
//
//  Created by 刘帅仪 on 2019/9/18.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign)NSUInteger count;    //当前size
@property (nonatomic, assign)NSUInteger capacity; //最大size
@property (nonatomic, assign)LRUNode *head;//头结点
@property (nonatomic, assign)LRUNode *tail;//为节点
@property (nonatomic, strong)NSMutableDictionary *cacheDic;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)putKey:(NSString *)key value:(NSString *)value {
    LRUNode *node = (__bridge LRUNode *)([self.cacheDic objectForKey:key]);
    if (node) {
        node->value = value;
        [self moveToHead:node];
    }else {
        LRUNode *node = {(__bridge LRUNode *)(key), value};
        
        
    }
}

- (instancetype)initWithCapacity:(NSUInteger)capacity {
    self.capacity = capacity;
    return self;
}

- (id)getItemForKey:(NSString *)key {
    LRUNode *node = (__bridge LRUNode *)([self.cacheDic objectForKey:key]);
    if (node) {
        return node->value;
    }
    return @"";
}

- (void)moveToHead:(LRUNode *)node {
    
}

- (void)addNode:(LRUNode *)node {
    if (self.head == nil) {
        self.head = node;
        self.tail = node;
    }else {
        LRUNode *temp = self.head;
        self.head = node;
        self.head->next = temp;
        temp->pre = self.head;
    }
}






@end
