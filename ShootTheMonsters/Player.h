//
//  Player.h
//  ShootTheMonsters
//
//  Created by Andrei Ursan on 3/31/13.
//  Copyright (c) 2013 Andrei Ursan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameConfig.h"
#import "GameObject.h"

@interface Player : GameObject {
}

@property (nonatomic, strong) CCSprite *sprite;
+ (Player *)playerOnLayer:(CCLayer *)layer;
- (id)initOnLayer:(CCLayer *)layer;

@end
