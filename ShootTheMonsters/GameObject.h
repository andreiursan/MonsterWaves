//
//  GameObject.h
//  ShootTheMonsters
//
//  Created by Andrei Ursan on 4/1/13.
//  Copyright (c) 2013 Andrei Ursan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameConfig.h"

@interface GameObject : NSObject {
  CCLayer *_layer;
}

@property (nonatomic, strong) CCSprite *sprite;
- (id)initOnLayer:(CCLayer *)layer withSpriteFile:(NSString *)file;
- (CGPoint)position;
- (void)setPosition:(CGPoint)position;
- (void)removeFromLayer;
- (BOOL)isOutsideWindow;
@end
