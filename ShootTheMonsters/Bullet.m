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
  
  if ((self = [super initOnLayer:layer withSpriteFile:kProjectileFile])) {
    self.direction = ccpNormalize(ccpSub(touchLocation, startPosition));
    self.speed = kProjectileSpeed;
    [self setPosition: startPosition];
    [_layer addChild: self.sprite];
    [[SimpleAudioEngine sharedEngine] playEffect:@"pew-pew-lei.caf"];
    return self;
  } else {
    return nil;
  }
}

@end
