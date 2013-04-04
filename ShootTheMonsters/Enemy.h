//
//  Enemy.h
//  ShootTheMonsters
//
//  Created by Andrei Ursan on 3/26/13.
//  Copyright (c) 2013 Andrei Ursan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameObject.h"
#import "GameConfig.h"
#import "Movable.h"
#import "GameObject+Movement.h"


@interface Enemy : GameObject <Movable>

@property (assign)float speed;
@property (assign)CGPoint direction;
+ (Enemy *)enemyOnLayer:(CCLayer *)layer;
- (id)initOnLayer:(CCLayer *)layer;

@end
