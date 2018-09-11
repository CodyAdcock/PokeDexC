//
//  CRAPokemonController.m
//  PokeDexC
//
//  Created by Cody on 9/11/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

#import "CRAPokemonController.h"

static NSString * const baseURLString = @"http://pokeapi.co/api/v2/pokemon/";

@implementation CRAPokemonController

//nullable will make it optional in Swift
+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^_Nullable)(CRAPokemon * _Nullable)) completion{
    
    //ensure the completion is not nil
    if(!completion){
        completion = ^(CRAPokemon *p){};
    }
    
    //1)Construct URL/URL REQUEST
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *searchURL = [baseURL URLByAppendingPathComponent:[searchTerm lowercaseString]];
    
    //Not using but want example
    //NSURLRequest *request = [NSURLRequest requestWithURL:searchURL];
    
    
    NSLog([searchURL absoluteString]);
    
    //2)URLSession.shared.dataTask with completion. Don't forget .resume()
    
    [[[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error){
            NSLog(@"There was an error fetching Pokemon %s:  %@, %@",__PRETTY_FUNCTION__, error, error.localizedDescription);
            return;
        }
        if(response){
            NSLog(@"%@", response);
        }
        if (data){
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error: &error];
            if(!dictionary || ![dictionary isKindOfClass:[NSDictionary class]]){
                NSLog(@"Error parsing the json: %@", error);
                completion(nil);
                return;
            }
            CRAPokemon *pokemon = [[CRAPokemon alloc] initwithDictionary:dictionary];
            completion(pokemon);
        }
    }]resume];
}


@end
