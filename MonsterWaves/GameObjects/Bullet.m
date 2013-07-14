//
//  Bullet.m
//  ShootTheMonsters
//
//  Created by Andrei Ursan on 3/12/13.
//  Copyright 2013 Andrei Ursan. All rights reserved.
//

#import "Bullet.h"

@implementation Bullet


+ (Bullet *)bulletWithStartPosition:(CGPoint)startPosition
                      toTouchLocation:(CGPoint)touchLocation
                              layer:(CCLayer*)layer{
  return [[Bullet alloc] initWithStartPosition:(CGPoint)startPosition
                                 toTouchLocation:(CGPoint)touchLocation
                                         layer:(CCLayer*)layer];
}

- (id)initWithStartPosition:(CGPoint)startPosition
              toTouchLocation:(CGPoint)touchLocation
                      layer:(CCLayer*)layer {
  self = [super initOnLayer:layer withSpriteFile:kProjectileFile];
  if (self) {
    self.direction = ccpNormalize(ccpSub(touchLocation, startPosition));
    self.speed = kProjectileSpeed;
    [self setPosition: startPosition];
    [_layer addChild: self.sprite];
    [[SimpleAudioEngine sharedEngine] playEffect:@"pew-pew-lei.caf"];
  }
  return self;
}

@end
