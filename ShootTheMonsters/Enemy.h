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

@interface Enemy : GameObject {
  int _speed;
}

+ (Enemy *)createOnLayer:(CCLayer *)layer;
- (id)initOnLayer:(CCLayer *)layer;
- (void)updatePosition:(ccTime)dt;

@end
