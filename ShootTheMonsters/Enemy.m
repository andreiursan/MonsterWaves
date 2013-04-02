//
//  Enemy.m
//  ShootTheMonsters
//
//  Created by Andrei Ursan on 3/26/13.
//  Copyright (c) 2013 Andrei Ursan. All rights reserved.
//

#import "Enemy.h"

@implementation Enemy

+ (Enemy *)createOnLayer:(CCLayer *)layer {
  return [[Enemy alloc] initOnLayer:layer];
}

- (id)initOnLayer:(CCLayer *)layer {
  if ((self = [super initOnLayer:layer withSpriteFile:kMonsterFile])) {
    
    int minY = self.sprite.contentSize.height / 2;
    int actualY = minY + arc4random_uniform(kWinHeight-minY);
    self.sprite.position = ccp(kWinWidth, actualY);
    
    self.direction = kVectorLeft;
    self.speed = kMonsterMinSpeed + arc4random_uniform(kMonsterMaxSpeed - kMonsterMinSpeed);
    [_layer addChild: self.sprite];
    
    return self;
  } else {
    return nil;
  }
}

- (BOOL)isOutsideWindow {
  return self.position.x < 0;
}

@end
