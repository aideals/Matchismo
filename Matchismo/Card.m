//
//  Card.m
//  Matchismo
//
//  Created by 鹏 刘 on 2016/12/17.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards
{
    //int score
    
    int score = 0;
    
    for (Card *card in otherCards)
    {
        if ([card.contents isEqualToString:self.contents])
        {
            return score = 1;
        }
       /* else {
            return 0;
        }*/
    }
    return score;
}

@end
