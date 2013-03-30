//
//  Bullet.h
//  ShootTheMonsters
//
//  Created by Andrei Ursan on 3/12/13.
//  Copyright 2013 Andrei Ursan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameConfig.h"
#import "SimpleAudioEngine.h"

@interface Bullet : NSObject {
  CGPoint _direction;
  CCLayer *_layer;
  int _speed;
}

@property (nonatomic, strong) CCSprite *sprite;

+ (Bullet *)createWithStartPosition:(CGPoint)startPosition touchLocation:(CGPoint)touchLocation layer:(CCLayer*)layer;
- (id)initWithStartPosition:(CGPoint)startPosition touchLocation:(CGPoint)touchLocation layer:(CCLayer*)layer;
- (void)updatePostion:(ccTime)dt;
- (void)remove;
- (BOOL)outsideWindow;
@end
