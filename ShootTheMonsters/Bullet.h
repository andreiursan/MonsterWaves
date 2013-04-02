//
//  Bullet.h
//  ShootTheMonsters
//
//  Created by Andrei Ursan on 3/12/13.
//  Copyright 2013 Andrei Ursan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SimpleAudioEngine.h"
#import "GameConfig.h"
#import "GameObject.h"
#import "Movable.h"
#import "GameObject+Movement.h"

@interface Bullet : GameObject <Movable>

@property (assign)float speed;
@property (assign)CGPoint direction;
+ (Bullet *)createWithStartPosition:(CGPoint)startPosition touchLocation:(CGPoint)touchLocation layer:(CCLayer*)layer;
- (id)initWithStartPosition:(CGPoint)startPosition touchLocation:(CGPoint)touchLocation layer:(CCLayer*)layer;

@end
