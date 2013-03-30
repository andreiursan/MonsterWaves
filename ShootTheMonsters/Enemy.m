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
  if ((self = [super init])) {
 
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    self.sprite = [CCSprite spriteWithFile:kMonsterFile];
    _layer = layer;
    
    int minY = self.sprite.contentSize.height / 2;
    int maxY = winSize.height - minY;
    int actualY = (arc4random() % (maxY-minY)) + minY;
    self.sprite.position = ccp(winSize.width, actualY);
    
    [_layer addChild: self.sprite];
    
    return self;
  } else {
    return nil;
  }
}

- (void)updatePosition:(ccTime)dt{
  self.sprite.position = ccpAdd(self.sprite.position, kVectorLeft);
}

- (void)remove {
  [_layer removeChild:self.sprite cleanup:YES];
}

- (BOOL)outsideWindow{
  if (0 > self.sprite.position.x){
    return YES;
  } else
    return NO;
}

@end
