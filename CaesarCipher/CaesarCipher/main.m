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
//Being amateur codebreakers, we want to know if two distinct looking ciphers correspond to the same input message. Write a method called codeBreaker, which accepts two cipher strings as paramaters and returns a boolean value which tells us whether they are actually the same input message encoded using two different offsets. hint: the maximum offset is 25
- (BOOL)codeBreaker: (NSString *)string word:(NSString*)string2{
    for (int i=1; i<=25; i++){
        for(int j=1;j<=25;j++){
            if([self decode:string offset:i] == [self decode:string2 offset:j]){
                return 1;
            }
        }
    }
    return 0;
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CaesarCipher * ceasarCipher = [[CaesarCipher alloc]init];
        NSString *mesfin = @"mesfin";
        NSString *mesfin2 = @"mesfin";
        NSString *result =[ceasarCipher encode:mesfin offset:2];
        NSString *result2 = [ceasarCipher encode:mesfin2 offset:7];
        
        NSLog(@"This is the first string, %@ and this is the second %@",result,result2);
        
        BOOL result3 = [ceasarCipher codeBreaker:result word:result2];
        NSLog(@"\n");
        
        NSLog(@"%hhd",result3);
        
        NSString *decode = [ceasarCipher decode:mesfin offset:2];
        NSString *decode2 =[ceasarCipher decode:mesfin offset:7];
        
        NSLog(@"This is the first string, %@ and this is the second %@",decode,decode2);
        
    }
}
