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
    int maxY = kWinHeight - minY;
    int actualY = (arc4random() % (maxY-minY)) + minY;
    self.sprite.position = ccp(kWinWidth, actualY);
    [_layer addChild: self.sprite];
    return self;
  } else {
    return nil;
  }
}

- (void)updatePosition:(ccTime)dt{
  self.sprite.position = ccpAdd(self.sprite.position, kVectorLeft);
}

- (BOOL)isOutsideWindow {
  return [self position].x < 0;
}

@end
