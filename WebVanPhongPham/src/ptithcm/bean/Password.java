package ptithcm.bean;

import org.springframework.stereotype.Service;

@Service
public class Password {
	
	//flags for, respectively, small caps, large caps, digits, punctuation
    static int a, A, d, p;

    public String randomPassword() {
        String s;
        do {
            //Using special String constructor that takes an int[]
            s = new String(new java.util.Random().ints(15, 33, 127)
                                .toArray(),
                           0, 15);
            a = A = d = p = 0;
            s.chars()
                .map(c ->
                      c > 96 & c < 123 ? a = 1
                    : c > 64 & c < 90  ? A = 1
                    : c > 47 & c < 58  ? d = 1
                    : (p = 1))
                .min();
        } while (a + A + d + p < 4);
        System.out.println(s);
        return s;
    }

}
