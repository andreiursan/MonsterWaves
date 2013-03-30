//
//  Enemy.h
//  ShootTheMonsters
//
//  Created by Andrei Ursan on 3/26/13.
//  Copyright (c) 2013 Andrei Ursan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameConfig.h"

@interface Enemy : NSObject {
  CCLayer *_layer;
  int _speed;
}

@property (nonatomic, strong) CCSprite *sprite;
+ (Enemy *)createOnLayer:(CCLayer *)layer;
- (id)initOnLayer:(CCLayer *)layer;
- (void)updatePosition:(ccTime)dt;
- (void)remove;
- (BOOL)outsideWindow;
@end
