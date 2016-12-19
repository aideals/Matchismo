//
//  PlayingCard.h
//  Matchismo
//
//  Created by 鹏 刘 on 2016/12/17.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card
@property (nonatomic, strong) NSString *suit;
@property (nonatomic) NSInteger rank;

+ (NSArray *)validSuits;

+ (NSInteger)maxRank;

@end
