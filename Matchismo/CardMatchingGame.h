//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by 鹏 刘 on 2016/12/18.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject
@property (nonatomic,readonly) int score;

- (id)initWithCardCount:(NSInteger)cardCount usingDeck:(Deck *)deck;

- (void)flipCardAtIndex:(NSInteger)index;

- (Card *)cardAtIndex:(NSInteger)index;
@end
