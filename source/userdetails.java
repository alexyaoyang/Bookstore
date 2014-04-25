package myjsp;
public class userdetails 
{
	String userName;
        String password;
        String firstName;
        String lastName;
        String birthmonth;
        String birthday;
        String birthyear;
        String gender;
        String contactNo;
        String address;
   
	
    public userdetails() {
    
    }
    //Get Property
    public String getUserName()
    {
    	return userName;
    }
   public String getPassword()
    {
    	return password;
    }
   public String getFirstName()
    {
    	return firstName;
    }
   public String getLastName()
    {
    	return lastName;
    }
    
    public String getContactNo()
    {
    	return contactNo;
    }
   public String getAddress()
    {
    	return address;
    }
   public String getBirthMonth()
    {
    	return birthmonth;
    }
   public String getBirthDay()
    {
    	return birthday;
    }
   public String getBirthYear()
    {
    	return birthyear;
    }
   public String getGender()
    {
        return gender;
    }
    
    //Set Property
    
   public void setUserName(String n)
    {
    	userName=n;
    }
   public void setPassword(String p)
    {
    	password=p;
    }
   public void setFirstName(String f)
    {
    	firstName=f;
    }
   public void setLastName(String l)
    {
    	lastName=l;
    }
    
    public void setContactNo(String c)
    {
    	contactNo=c;
    }
   public void setAddress(String ad)
    {
    	address=ad;
    }
   public void setBirthMonth(String bm)
    {
    	birthmonth=bm;
    }
   public void setBirthDay(String bd)
    {
    	birthday=bd;
    }
   public void setBirthYear(String by)
    {
    	birthyear=by;
    }
   public void setGender(String g)
    {
        gender=g;
    }
    

}