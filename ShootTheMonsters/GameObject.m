//
//  GameObject.m
//  ShootTheMonsters
//
//  Created by Andrei Ursan on 4/1/13.
//  Copyright (c) 2013 Andrei Ursan. All rights reserved.
//

#import "GameObject.h"

@implementation GameObject

- (id)initOnLayer:(CCLayer *)layer withSpriteFile:(NSString *)file {
  self = [super init];
  if (self) {
    _layer = layer;
    self.sprite = [CCSprite spriteWithFile:file];
  }
  return self;
}

- (CGPoint)position {
  return self.sprite.position;
}

- (void)setPosition:(CGPoint)position {
  self.sprite.position = position;
}

- (void)removeFromLayer {
  [_layer removeChild:self.sprite cleanup:YES];
}

- (BOOL)isOutsideWindow {
  return !CGRectContainsRect(kWinBounds, self.sprite.boundingBox);
}

@end
