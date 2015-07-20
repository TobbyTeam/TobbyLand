package kr.ac.kpu.ebiz.spring.tobbyproject.etc;

import kr.ac.kpu.ebiz.spring.tobbyproject.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by happy on 2015-07-01.
 */
public class MemberThread extends Thread{

    @Autowired
    MemberRepository memberRepository;

    private int member_id;

    public MemberThread(int member_id) {
        this.member_id = member_id;

    }

    public void run(){
        try{
        Thread.sleep(10000);}

        catch (Exception e){}

        int i = memberRepository.selectEnabled(member_id);

        System.out.println(i+"++++확인");

        if(i ==0)
        {memberRepository.delete(member_id);}

    }
}
