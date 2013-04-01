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
#import "GameObject.h"

@interface Bullet : GameObject {
  CGPoint _direction;
  int _speed;
}

+ (Bullet *)createWithStartPosition:(CGPoint)startPosition touchLocation:(CGPoint)touchLocation layer:(CCLayer*)layer;
- (id)initWithStartPosition:(CGPoint)startPosition touchLocation:(CGPoint)touchLocation layer:(CCLayer*)layer;
- (void)updatePostion:(ccTime)dt;

@end
