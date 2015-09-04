//
//  RsaManager.h
//  Test_RSA_Class
//
//  Created by Sywine on 4/15/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>

@interface RsaManager : NSObject{
    SecKeyRef publicKey;
    SecKeyRef privateKey;
    NSData *publicTag;
    NSData *privateTag;
}



- (void)encryptWithPublicKey:(uint8_t *)plainBuffer cipherBuffer:(uint8_t *)cipherBuffer;
- (void)decryptWithPrivateKey:(uint8_t *)cipherBuffer plainBuffer:(uint8_t *)plainBuffer;
- (SecKeyRef)getPublicKeyRef;
- (SecKeyRef)getPrivateKeyRef;
- (void)testAsymmetricEncryptionAndDecryption;
- (void)generateKeyPair:(NSUInteger)keySize;

@end
