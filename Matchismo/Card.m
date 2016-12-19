//
//  Card.m
//  Matchismo
//
//  Created by 鹏 刘 on 2016/12/17.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)matchOtherCard:(NSArray *)otherCards
{
    int score;
    for (Card *otherCard in otherCards) {
        if ([otherCard.content isEqualToString:self.content]) {
            return score = 1;
        }
        else {
            return score = 0;
        }
    
    }
    return score;
}

@end
