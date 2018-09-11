//
//  CRAPokemon.m
//  PokeDexC
//
//  Created by Cody on 9/11/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

#import "CRAPokemon.h"

@implementation CRAPokemon

- (instancetype)initWithName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *) abilities{
    self = [super init];
    if(self){
        _name = name;
        _identifier = identifier;
        _abilities = abilities;
    }
    return self;
}

@end

@implementation CRAPokemon (JSONConvertible)

-(instancetype)initwithDictionary:(NSDictionary<NSString *, id> *)dictionary{
    NSString *name = dictionary[@"name"];
    NSInteger identifier = [dictionary[@"id"] integerValue];
    NSArray *abilitiesDicionaries = dictionary[@"abilities"];
    
    if(![name isKindOfClass:[NSString class]] || ![abilitiesDicionaries isKindOfClass:[NSArray class]]){
        return nil;
    }
    
    NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc] init];
    for (NSDictionary *dictionary in abilitiesDicionaries){
        NSString *abilityName = dictionary[@"ability"][@"name"];
        if(!abilityName) {continue;}
        [abilities addObject:abilityName];
    }
    return [self initWithName:name identifier:identifier abilities:abilities];
}


@end
