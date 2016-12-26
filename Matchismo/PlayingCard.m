//
//  PlayingCard.m
//  Matchismo
//
//  Created by 鹏 刘 on 2016/12/17.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit = _suit;

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    if (otherCards.count == 1) {
        PlayingCard *otherCard = [otherCards lastObject];
        // if (otherCard.suit == self.suit)
        if ([otherCard.suit isEqualToString:self.suit]) {
            score = 1;
        }
        else if (otherCard.rank == self.rank) {
            score = 4;
        }
    }
    return score;
}

/* 
 - (void)contents
 {
    [PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];

 }
 */

- (NSString *)contents
{
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit])
    {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *)validSuits
{
    return @[@"♠︎",@"♣︎",@"♥︎",@"♦︎"];
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSInteger)maxRank
{
    return [self rankStrings].count - 1;
}

- (void)setRank:(NSInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}


@end
