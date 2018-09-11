//
//  CRAPokemonController.h
//  PokeDexC
//
//  Created by Cody on 9/11/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRAPokemon.h"

NS_ASSUME_NONNULL_BEGIN

@interface CRAPokemonController : NSObject

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^_Nullable)(CRAPokemon * _Nullable)) completion;
//static func fetchPokemon(for searchTerm: String, completion:((Pokemon?) -> ()));



NS_ASSUME_NONNULL_END

@end
