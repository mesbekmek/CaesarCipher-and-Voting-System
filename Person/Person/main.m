//
//  main.m
//  Person
//
//  Created by Michael Kavouras on 6/21/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person: NSObject

- (void)setName:(NSString *)name;
- (NSString *)name;

- (void)setCity:(NSString *)city;
- (NSString *)city;

- (void)setPhoneNumber:(NSString *)phoneNumber;
- (NSString *)phoneNumber;

-(BOOL)checkSameCity:(Person *)person;

-(Person *)registerChild;
@end

@implementation Person {
    NSString *_name;
    NSString *_phoneNumber;
    NSString *_city;
}

- (void)setName:(NSString *)name {
    _name = name;
}

- (NSString *)name {
    return _name;
}

- (void)setCity:(NSString *)city {
    _city = city;
}

- (NSString *)city {
    return _city;
}

- (void)setPhoneNumber:(NSString *)phoneNumber {
    _phoneNumber = phoneNumber;
}

- (NSString *)phoneNumber {
    return _phoneNumber;
}

-(BOOL)checkSameCity:(Person *)person{
    if([[self city] isEqualToString:[person city]]){
        return YES;
    }
    return NO;
}

-(Person *)registerChild{
    Person *child = [[Person alloc]init];
    child.phoneNumber = self.phoneNumber;
    child.city = self.city;
    
    return child;
}
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* carl = [[Person alloc]init];
        
        Person* lisa = [[Person alloc]init];
        
        [lisa setCity:@"Gotham"];
        
        [carl setName:@"Carl"];
        
        [carl setCity:@"Gotham"];
        
        [carl setPhoneNumber:@"234-843-2333"];
        
        
        Person *child = [carl registerChild];
        
        BOOL result = [carl checkSameCity:lisa];
        
        NSLog(@"%hhd",result);
        
        NSLog(@"%@",[carl name]);
        NSLog(@"%@",[carl city]);
        NSLog(@"%@",[carl phoneNumber]);
        
        NSLog(@"%@",[child phoneNumber]);
        
        
    }
    return 0;
}
