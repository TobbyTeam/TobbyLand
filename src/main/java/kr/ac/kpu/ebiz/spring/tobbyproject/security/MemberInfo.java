package kr.ac.kpu.ebiz.spring.tobbyproject.security;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.Assert;

import java.io.Serializable;
import java.util.*;

public class MemberInfo implements UserDetails {

private static final long serialVersionUID = -4086869747130410600L;

    private int member_id;
    private String user_id;
    private String password;
    private boolean enabled;
    private boolean nonLocked;
    private String nickname;
    private Set<GrantedAuthority> authorities;

    public MemberInfo(int member_id, String user_id, String password, boolean enabled, boolean nonLocked, String nickname, Collection<? extends GrantedAuthority> authorities){
        this.member_id = member_id;
        this.user_id = user_id;
        this.password = password;
        this.enabled = enabled;
        this.nonLocked = nonLocked;
        this.nickname = nickname;
        this.authorities = Collections.unmodifiableSet(sortAuthorities(authorities));
    }

    public int getMember_id() {
        return member_id;
    }
 
    public void setMember_id(int member_id) {
        this.member_id = member_id;
    }

    public boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public boolean getNonLocked() {
        return nonLocked;
    }

    public void setNonLocked(boolean nonLocked) {
        this.nonLocked = nonLocked;
    }
 
    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
 
    public void setPassword(String password) {
        this.password = password;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public Collection<? extends GrantedAuthority> getAuthorities() {
        // TODO Auto-generated method stub
        return authorities;
    }

    public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
        this.authorities = Collections.unmodifiableSet(sortAuthorities(authorities));
    }

    public String getPassword() {
        // TODO Auto-generated method stub
        return password;
    }

    public String getUser_id() {
        // TODO Auto-generated method stub
        return user_id;
    }

    public String getUsername() {
        // TODO Auto-generated method stub
        return getUser_id();
    }

    public boolean isAccountNonExpired() {
        // TODO Auto-generated method stub
        return true;
    }

    public boolean isAccountNonLocked() {
        // TODO Auto-generated method stub
        return nonLocked;
    }

    public boolean isCredentialsNonExpired() {
        // TODO Auto-generated method stub
        return true;
    }

    public boolean isEnabled() {
        // TODO Auto-generated method stub
        return enabled;
    }

    private static SortedSet<GrantedAuthority> sortAuthorities(Collection<? extends GrantedAuthority> authorities) {
        Assert.notNull(authorities, "Cannot pass a null GrantedAuthority collection");
        // Ensure array iteration order is predictable (as per UserDetails.getAuthorities() contract and SEC-717)
        SortedSet<GrantedAuthority> sortedAuthorities =
            new TreeSet<GrantedAuthority>(new AuthorityComparator());
 
        for (GrantedAuthority grantedAuthority : authorities) {
            Assert.notNull(grantedAuthority, "GrantedAuthority list cannot contain any null elements");
            sortedAuthorities.add(grantedAuthority);
        }
 
        return sortedAuthorities;
    }
     
    private static class AuthorityComparator implements Comparator<GrantedAuthority>, Serializable {
        private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;
 
        public int compare(GrantedAuthority g1, GrantedAuthority g2) {
            // Neither should ever be null as each entry is checked before adding it to the set.
            // If the authority is null, it is a custom authority and should precede others.
            if (g2.getAuthority() == null) {
                return -1;
            }
 
            if (g1.getAuthority() == null) {
                return 1;
            }
 
            return g1.getAuthority().compareTo(g2.getAuthority());
        }
    }
 
}