//
//  Bullet.m
//  ShootTheMonsters
//
//  Created by Andrei Ursan on 3/12/13.
//  Copyright 2013 Andrei Ursan. All rights reserved.
//

#import "Bullet.h"


@implementation Bullet

+ (Bullet *)createWithStartPosition:(CGPoint)startPosition
                      touchLocation:(CGPoint)touchLocation
                              layer:(CCLayer*)layer{
  return [[Bullet alloc] initWithStartPosition:(CGPoint)startPosition
                                 touchLocation:(CGPoint)touchLocation
                                         layer:(CCLayer*)layer];
}

- (id)initWithStartPosition:(CGPoint)startPosition
              touchLocation:(CGPoint)touchLocation
                      layer:(CCLayer*)layer {
  if (self = [super init]) {
    _layer = layer;
    self.sprite = [CCSprite spriteWithFile:kProjectileFile];
    _direction = ccpNormalize(ccpSub(touchLocation, startPosition));
    _speed = kProjectileSpeed;
    self.sprite.position = startPosition;
    [_layer addChild:self.sprite];
    [[SimpleAudioEngine sharedEngine] playEffect:@"pew-pew-lei.caf"];
    return self;
  } else {
    return nil;
  }
}

- (void)updatePostion:(ccTime) dt{
  self.sprite.position = ccpAdd(ccpMult(_direction, dt * _speed), self.sprite.position);
}

- (void)remove {
  [_layer removeChild:self.sprite cleanup:YES];
}

@end
