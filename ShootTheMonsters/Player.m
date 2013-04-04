//
//  Player.m
//  ShootTheMonsters
//
//  Created by Andrei Ursan on 3/31/13.
//  Copyright (c) 2013 Andrei Ursan. All rights reserved.
//

#import "Player.h"

@implementation Player

+ (Player *)playerOnLayer:(CCLayer *)layer {
  return [[Player alloc] initOnLayer:layer];
}

- (id)initOnLayer:(CCLayer *)layer {
  if ((self = [super initOnLayer:layer withSpriteFile:kPlayerFile])) {
    [self setPosition: ccp(self.sprite.contentSize.width/2, kWinHeight/2)];
    [_layer addChild: self.sprite];
    return self;
  } else {
    return nil;
  }
}

@end
