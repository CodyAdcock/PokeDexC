//
//  CRAPokemon.h
//  PokeDexC
//
//  Created by Cody on 9/11/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CRAPokemon : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;

- (instancetype)initWithName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *) abilities;

@end

@interface CRAPokemon (JSONConvertible)

-(instancetype)initwithDictionary:(NSDictionary<NSString *, id> *)dictionary;


@end
NS_ASSUME_NONNULL_END
