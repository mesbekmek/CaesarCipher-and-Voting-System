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
//Write a method called checkSameCity which accepts one parameter of type Person * and checks if they live in the same city. The function should return a boolean value.
-(BOOL)checkSameCity:(Person *)person{
    if(self.city == person.city){
        return YES;
    }
    return NO;
}
//A Person has recently had a child, whose name is 'Abc'. Write a method called registerChild which takes 0 parameters and returns a new Person * instance represeting the child, which has the same phoneNumber and city as the parent
-(Person *)registerChild{
    Person * child = [[Person alloc]init];
    child.phoneNumber = self.phoneNumber;
    child.city = self.city;
    
    return child;
}
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
    }
    return 0;
}
