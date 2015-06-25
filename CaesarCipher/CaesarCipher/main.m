//
//  main.m
//  CaesarCipher
//
//  Created by Michael Kavouras on 6/21/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CaesarCipher : NSObject

- (NSString *)decode:(NSString *)string offset:(int)offset;
- (NSString *)encode:(NSString *)string offset:(int)offset;
- (BOOL)codeBreaker: (NSString *)string word:(NSString*)string2;

@end

@implementation CaesarCipher

- (NSString *)encode:(NSString *)string offset:(int)offset {
    if (offset > 25) {
        NSAssert(offset < 26, @"offset is out of range. 1 - 25");
    }
    unsigned long count = [string length];
    unichar result[count];
    unichar buffer[count];
    [string getCharacters:buffer range:NSMakeRange(0, count)];
    
    for (int i = 0; i < count; i++) {
        if (buffer[i] == ' ' || ispunct(buffer[i])) {
            result[i] = buffer[i];
            continue;
        }
        
        int low = islower(buffer[i]) ? 'a' : 'A';
        result[i] = (buffer[i]%low + offset)%26 + low;
    }
    
    return [NSString stringWithCharacters:result length:count];
}

- (NSString *)decode:(NSString *)string offset:(int)offset {
    return [self encode:string offset: (26 - offset)];
}

- (BOOL)codeBreaker: (NSString *)string word:(NSString*)string2{
    //Method 1
//    for (int i=1; i<=25; i++){
//        for(int j=1;j<=25;j++){
//            if([[self decode:string offset:i] isEqualToString:[self decode:string2 offset:j]]){
//                return 1;
//            }
//        }
//    }
    //Method 2 thanks to V's suggestion
    for(int i=1;i<25;i++){
        if([string isEqualToString:[self encode:string2 offset:i]]){
            return 1;
        }
    }
    return 0;
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CaesarCipher * ceasarCipher = [[CaesarCipher alloc]init];
        NSString *string = @"mike";
        NSString *string2 = @"mesfin";
        NSString *result =[ceasarCipher encode:string offset:2];
        NSString *result2 = [ceasarCipher encode:string2 offset:7];
        
        NSLog(@"This is the first string, %@ and this is the second %@",result,result2);
        
        BOOL result3 = [ceasarCipher codeBreaker:result word:result2];
        NSLog(@"\n");
        
        NSLog(@"%hhd",result3);
    }
}
