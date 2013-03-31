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

@interface Player : NSObject {
  CCLayer *_layer;
}

@property (nonatomic, strong) CCSprite *sprite;
+ (Player *)createOnLayer:(CCLayer *)layer;
- (id)initOnLayer:(CCLayer *)layer;

@end
