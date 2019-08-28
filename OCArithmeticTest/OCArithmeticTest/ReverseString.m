//
//  ReverseString.m
//  OCArithmeticTest
//
//  Created by 刘帅仪 on 2019/8/26.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

#import "ReverseString.h"

@implementation ReverseString

void char_reverse(char* cha) {
    printf("%s \n",cha);
    char* begin = cha;
    char* end = cha + strlen(cha);
    while (begin < end) {
        char temp = *begin;
        *(begin++) = *end;
        *(end--) = temp;
        printf("temp: %c \n",temp);
        printf("begin: %s \n",begin);
        printf("end: %s \n",end);
        printf("===================");
    }
    printf("ch %s \n", cha);
}

@end
