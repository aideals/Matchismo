//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by 鹏 刘 on 2016/12/18.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import "CardMatchingGame.h"


@interface CardMatchingGame ()
@property (nonatomic) NSInteger score;
@property (nonatomic,strong) NSMutableArray *cards;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (id)initWithCardCount:(NSInteger)cardCount usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int i; i <= cardCount; i++) {
             Card *card = [deck drawRandomCard];
          
            if (!card) {
                self = nil;
            }
            else {
                card = self.cards[i];
            }
        
        }
    }
    return self;
}

- (Card *)cardAtIndex:(NSInteger)index
{
   return  (index <= self.cards.count) ? self.cards[index] : nil;
}

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1


- (void)flipCardAtIndex:(NSInteger)index
{
    Card *card = [self cardAtIndex:index];

    if (!card.isUnPlayable) {
        if (!card.isFaceUp) {
        for (Card *otherCard in self.cards) {
            if (otherCard.isFaceUp && !otherCard.unPlayable) {
                int matchScore = [card matchOtherCard:@[otherCard]];
                if (matchScore) {
                    otherCard.faceUp = YES;
                    otherCard.unPlayable = YES;
                    self.score += matchScore * MATCH_BONUS;
                }
                else {
                    otherCard.faceUp = NO;
                    self.score -= matchScore * MISMATCH_PENALTY;
                }
                break;
            }
        }
         self.score -= FLIP_COST;
      }
        card.faceUp = !card.isFaceUp;
    }

}



@end
