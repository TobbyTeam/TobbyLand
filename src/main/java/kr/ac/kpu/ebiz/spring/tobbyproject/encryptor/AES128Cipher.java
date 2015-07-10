package kr.ac.kpu.ebiz.spring.tobbyproject.encryptor;

import org.apache.commons.codec.binary.Hex;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.security.SecureRandom;


public class AES128Cipher {


    public String encode(String member_id) throws Exception {

        String password = "1234";

        byte[] seedB = password.getBytes();
        SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
        sr.setSeed(seedB);
        KeyGenerator kgen = KeyGenerator.getInstance("AES");
        kgen.init(128, sr); // 192 and 256 bits may not be available
        // Generate the secret key specs.
        SecretKey skey = kgen.generateKey();
        String keyString = Hex.encodeHexString(skey.getEncoded());
        SecretKeySpec skeySpec = new SecretKeySpec(skey.getEncoded(), "AES");
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
        byte[] encrypted =  cipher.doFinal(member_id.getBytes());

        String enSt =  Hex.encodeHexString(encrypted);

/*        System.out.println("encrypted string: [" + keyString + "] " + enSt );*/

        return enSt;
    }

    public String decode(String enSt) throws Exception {
        String password = "1234";
        byte[] seedB = password.getBytes();
        SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
        sr.setSeed(seedB);

        KeyGenerator kgen = KeyGenerator.getInstance("AES");
        kgen.init(128, sr); // 192 and 256 bits may not be available
        // Generate the secret key specs.
        SecretKey skey = kgen.generateKey();
        String keyString = Hex.encodeHexString(skey.getEncoded());
        SecretKeySpec skeySpec = new SecretKeySpec(skey.getEncoded(), "AES");

        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.DECRYPT_MODE, skeySpec);
        byte[] decrypted =  cipher.doFinal(Hex.decodeHex(enSt.toCharArray()));

        String dnSt = new String(decrypted);

/*        System.out.println("decrypted string: [" + keyString + "] " + new String(decrypted));*/

        return dnSt;
    }



}