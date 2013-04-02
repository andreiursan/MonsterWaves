//
//  GameOverLayer.m
//  ShootTheMonsters
//
//  Created by Andrei Ursan on 3/11/13.
//  Copyright 2013 Andrei Ursan. All rights reserved.
//

#import "GameOverLayer.h"
#import "GameLayer.h"


@implementation GameOverLayer

+ (CCScene *)sceneWithWon:(BOOL)won{
  CCScene *scene = [CCScene node];
  GameOverLayer *layer = [[GameOverLayer alloc] initWithWon:won];
  [scene addChild:layer];
  return scene;
}

- (id)initWithWon:(BOOL)won{
  if((self = [super initWithColor:ccc4(255, 255, 255, 255)])){
    NSString *message = won ?  @"You Won!" : @"You Lose :[";
    CCLabelTTF *label = [CCLabelTTF labelWithString:message fontName:@"Helvetica" fontSize:32];
    label.color = ccc3(0,0,0);
    label.position = kWinCenter;
    [self addChild:label];
    [self runAction:[CCSequence actions:
                     [CCDelayTime actionWithDuration:3],
                     [CCCallBlockN actionWithBlock:^(CCNode *node){
                        [[CCDirector sharedDirector] replaceScene:[GameLayer scene]];
                     }], nil]];
    return self;
  } else {
    return nil;
  }
}

@end
