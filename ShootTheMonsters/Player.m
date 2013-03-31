//
//  Player.m
//  ShootTheMonsters
//
//  Created by Andrei Ursan on 3/31/13.
//  Copyright (c) 2013 Andrei Ursan. All rights reserved.
//

#import "Player.h"

@implementation Player

+ (Player *)createOnLayer:(CCLayer *)layer {
  return [[Player alloc] initOnLayer:layer];
}

- (id)initOnLayer:(CCLayer *)layer {
  if ((self = [super init])) {
    _layer = layer;
    self.sprite = [CCSprite spriteWithFile:kPlayerFile];
    self.sprite.position = ccp(self.sprite.contentSize.width/2, [[CCDirector sharedDirector] winSize].height/2);
    [_layer addChild: self.sprite];
    return self;
  } else {
    return nil;
  }
}

@end
